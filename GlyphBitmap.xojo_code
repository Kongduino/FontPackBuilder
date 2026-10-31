#tag Class
Protected Class GlyphBitmap
	#tag Method, Flags = &h0
		Function Clone() As GlyphBitmap
		  Dim g As New GlyphBitmap(Width, Height)
		  g.CodePoint = CodePoint
		  g.Advance = Advance
		  g.XOffset = XOffset
		  g.YOffset = YOffset
		  g.Edited = Edited
		  If Width * Height > 0 Then g.mPixels.StringValue(0, Width * Height) = mPixels.StringValue(0, Width * Height)
		  Return g
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(w As Integer, h As Integer)
		  // A glyph: its ink box (Width x Height pixels, one byte each: 0 or 1) at XOffset from the pen and YOffset from
		  // the top of the line, and the Advance of the pen. A blank glyph (a space) has no ink box
		  Width = Max(0, w)
		  Height = Max(0, h)
		  mPixels = New MemoryBlock(Max(1, Width * Height))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Crop()
		  // Shrinks the ink box to the lit pixels (offsets adjusted); a glyph without any becomes blank
		  Dim minX As Integer = Width, minY As Integer = Height, maxX As Integer = -1, maxY As Integer = -1
		  For y As Integer = 0 To Height - 1
		    For x As Integer = 0 To Width - 1
		      If mPixels.Byte(y * Width + x) <> 0 Then
		        minX = Min(minX, x)
		        maxX = Max(maxX, x)
		        minY = Min(minY, y)
		        maxY = Max(maxY, y)
		      End If
		    Next
		  Next
		  If maxX < 0 Then
		    Width = 0
		    Height = 0
		    XOffset = 0
		    YOffset = 0
		    mPixels = New MemoryBlock(1)
		    Return
		  End If
		  If minX = 0 And minY = 0 And maxX = Width - 1 And maxY = Height - 1 Then Return
		  Dim w As Integer = maxX - minX + 1
		  Dim h As Integer = maxY - minY + 1
		  Dim m As New MemoryBlock(w * h)
		  For y As Integer = 0 To h - 1
		    For x As Integer = 0 To w - 1
		      m.Byte(y * w + x) = mPixels.Byte((y + minY) * Width + x + minX)
		    Next
		  Next
		  mPixels = m
		  Width = w
		  Height = h
		  XOffset = XOffset + minX
		  YOffset = YOffset + minY
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetricsKey() As String
		  // The glyph's metrics as the pack stores them (advance, width, height, x offset, y offset)
		  Return Str(Advance) + "," + Str(Width) + "," + Str(Height) + "," + Str(XOffset) + "," + Str(YOffset)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PackedBits() As MemoryBlock
		  // The ink box as the pack stores it: row by row, most significant bit first, packed continuously across rows
		  Dim n As Integer = Width * Height
		  Dim m As New MemoryBlock((n + 7) \ 8)
		  For i As Integer = 0 To n - 1
		    If mPixels.Byte(i) <> 0 Then
		      Dim b As Integer = i \ 8
		      m.Byte(b) = m.Byte(b) Or Bitwise.ShiftRight(&h80, i Mod 8)
		    End If
		  Next
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pixel(x As Integer, y As Integer) As Boolean
		  If x < 0 Or y < 0 Or x >= Width Or y >= Height Then Return False
		  Return mPixels.Byte(y * Width + x) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pixel(x As Integer, y As Integer, Assigns lit As Boolean)
		  If x < 0 Or y < 0 Or x >= Width Or y >= Height Then Return
		  mPixels.Byte(y * Width + x) = If(lit, 1, 0)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Advance As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CodePoint As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Edited As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Height As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPixels As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		Width As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		XOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		YOffset As Integer
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
End Class
#tag EndClass
