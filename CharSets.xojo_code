#tag Module
Protected Module CharSets
	#tag Method, Flags = &h0
		Function BlockCount() As Integer
		  Load
		  Return mBlockNames.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockFirst(i As Integer) As Integer
		  Load
		  Return mBlockFirst(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockLast(i As Integer) As Integer
		  Load
		  Return mBlockLast(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlockName(i As Integer) As String
		  // The Unicode blocks (Resources/Blocks.txt, from the Unicode Character Database), in code point order
		  Load
		  Return mBlockNames(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatRanges(cps() As Integer) As String
		  // Sorted code points as hex ranges: "3040-30FF,4E00"
		  Dim parts() As String
		  Dim i As Integer = 0
		  While i < cps.Count
		    Dim j As Integer = i
		    While j + 1 < cps.Count And cps(j + 1) = cps(j) + 1
		      j = j + 1
		    Wend
		    If j > i Then
		      parts.Add(Hex4(cps(i)) + "-" + Hex4(cps(j)))
		    Else
		      parts.Add(Hex4(cps(i)))
		    End If
		    i = j + 1
		  Wend
		  Return String.FromArray(parts, ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Hex4(cp As Integer) As String
		  Dim h As String = Hex(cp)
		  While h.Length < 4
		    h = "0" + h
		  Wend
		  Return h
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Load()
		  If mLoaded Then Return
		  mLoaded = True
		  
		  // Blocks.txt: "0400..04FF; Cyrillic"
		  Dim f As FolderItem = ResourceFile("Blocks.txt")
		  If f <> Nil And f.Exists Then
		    Dim t As TextInputStream = TextInputStream.Open(f)
		    While Not t.EndOfFile
		      Dim line As String = t.ReadLine(Encodings.UTF8).Trim
		      If line = "" Or line.Left(1) = "#" Then Continue
		      Dim semi As Integer = line.IndexOf(";")
		      If semi < 0 Then Continue
		      Dim span() As String = line.Left(semi).Split("..")
		      If span.Count <> 2 Then Continue
		      mBlockFirst.Add(Integer.FromHex(span(0).Trim))
		      mBlockLast.Add(Integer.FromHex(span(1).Trim))
		      mBlockNames.Add(line.Middle(semi + 1).Trim)
		    Wend
		    t.Close
		  End If
		  
		  // CharSets.txt (MeshtasticFontPacks, tools/export_sets.py): name, description, count, ranges, tab-separated
		  f = ResourceFile("CharSets.txt")
		  If f <> Nil And f.Exists Then
		    Dim t As TextInputStream = TextInputStream.Open(f)
		    While Not t.EndOfFile
		      Dim line As String = t.ReadLine(Encodings.UTF8)
		      If line = "" Or line.Left(1) = "#" Then Continue
		      Dim fields() As String = line.Split(Chr(9))
		      If fields.Count < 4 Then Continue
		      mSetNames.Add(fields(0))
		      mSetDescriptions.Add(fields(1))
		      mSetCounts.Add(fields(2).ToInteger)
		      mSetRanges.Add(fields(3))
		    Wend
		    t.Close
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseHex(s As String, ByRef value As Integer) As Boolean
		  Dim allowed As String
		  allowed = "0123456789ABCDEF"
		  If s = "" Or s.Length > 6 Then Return False
		  For Each c As String In s.Characters
		    If allowed.IndexOf(c) < 0 Then Return False
		  Next
		  value = Integer.FromHex(s)
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseRanges(text As String, cps() As Integer) As Boolean
		  // Adds the code points of a range list to cps: hex values or ranges separated by commas, spaces or semicolons,
		  // "3040-30FF", "3040..30FF", "U+4E00", "0x4E00". False (and nothing added) when an entry isn't one
		  Dim found() As Integer
		  Dim s As String = text.ReplaceAll("..", "-")
		  While s.IndexOf(" -") >= 0 Or s.IndexOf("- ") >= 0
		    s = s.ReplaceAll(" -", "-").ReplaceAll("- ", "-")
		  Wend
		  s = s.ReplaceAll(";", ",").ReplaceAll(" ", ",").ReplaceAll(Chr(9), ",")
		  For Each part As String In s.Split(",")
		    part = part.Trim.Uppercase.ReplaceAll("U+", "").ReplaceAll("0X", "")
		    If part = "" Then Continue
		    Dim ends() As String = part.Split("-")
		    If ends.Count > 2 Then Return False
		    Dim lo, hi As Integer
		    If Not ParseHex(ends(0), lo) Then Return False
		    hi = lo
		    If ends.Count = 2 And Not ParseHex(ends(1), hi) Then Return False
		    If hi < lo Or hi > &h10FFFF Then Return False
		    For cp As Integer = lo To hi
		      found.Add(cp)
		    Next
		  Next
		  For Each cp As Integer In found
		    cps.Add(cp)
		  Next
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceFile(name As String) As FolderItem
		  // A file (or folder) of the app's resources: in the bundle's Resources folder (Copy Files build step), or, when
		  // run from the IDE without it, in the Resources folder next to the project
		  Dim f As FolderItem
		  Try
		    f = SpecialFolder.Resource(name)
		  Catch e As RuntimeException
		    f = Nil
		  End Try
		  If f <> Nil And f.Exists Then Return f
		  Dim dir As FolderItem = App.ExecutableFile
		  For level As Integer = 1 To 8
		    If dir = Nil Then Exit
		    dir = dir.Parent
		    If dir = Nil Then Exit
		    Dim r As FolderItem = dir.Child("Resources")
		    If r <> Nil And r.Exists And r.IsFolder Then
		      Dim c As FolderItem = r.Child(name)
		      If c <> Nil And c.Exists Then Return c
		    End If
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCount() As Integer
		  Load
		  Return mSetNames.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetDescription(i As Integer) As String
		  Load
		  Return mSetDescriptions(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetName(i As Integer) As String
		  // The named sets of mkfontpack.py (Resources/CharSets.txt): "hanzi-gb2312", "hkscs"...
		  Load
		  Return mSetNames(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetRanges(i As Integer) As String
		  Load
		  Return mSetRanges(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetSize(i As Integer) As Integer
		  // The number of characters in the set
		  Load
		  Return mSetCounts(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortUnique(cps() As Integer)
		  // Sorts the code points and removes the duplicates
		  If cps.Count < 2 Then Return
		  cps.Sort
		  Dim out() As Integer
		  out.Add(cps(0))
		  For i As Integer = 1 To cps.LastIndex
		    If cps(i) <> cps(i - 1) Then out.Add(cps(i))
		  Next
		  cps.RemoveAll
		  For Each cp As Integer In out
		    cps.Add(cp)
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBlockFirst() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockLast() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBlockNames() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLoaded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSetCounts() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSetDescriptions() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSetNames() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSetRanges() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
