#tag Class
Protected Class RenderedPack
	#tag Method, Flags = &h0
		Sub Add(g As GlyphBitmap)
		  // A rendered glyph, after the others (the renderer goes in code point order); kept as the original too
		  Glyphs.Add(g)
		  mLookup.Value(g.CodePoint) = g
		  mOriginals.Value(g.CodePoint) = g.Clone
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Original(cp As Integer) As GlyphBitmap
		  // The glyph as rendered from the font (before any edit), or Nil when the font doesn't have it
		  If Not mOriginals.HasKey(cp) Then Return Nil
		  Dim g As GlyphBitmap = mOriginals.Value(cp)
		  Return g.Clone
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(sizePx As Integer)
		  // One pack being built: the glyphs of one font at one size, with its line box
		  Self.SizePx = sizePx
		  mLookup = New Dictionary
		  mOriginals = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Glyph(cp As Integer) As GlyphBitmap
		  // The glyph of a code point, or Nil
		  If mLookup.HasKey(cp) Then Return mLookup.Value(cp)
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Replace(g As GlyphBitmap)
		  // An edited glyph in place of the rendered one, or a new one (a character the font doesn't have), in code point
		  // order
		  Dim lo As Integer = 0
		  Dim hi As Integer = Glyphs.Count
		  While lo < hi
		    Dim mid As Integer = (lo + hi) \ 2
		    If Glyphs(mid).CodePoint < g.CodePoint Then
		      lo = mid + 1
		    Else
		      hi = mid
		    End If
		  Wend
		  If lo < Glyphs.Count And Glyphs(lo).CodePoint = g.CodePoint Then
		    Glyphs(lo) = g
		  Else
		    Glyphs.AddAt(lo, g)
		  End If
		  mLookup.Value(g.CodePoint) = g
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Baseline As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FontFile As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FontName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Glyphs() As GlyphBitmap
	#tag EndProperty

	#tag Property, Flags = &h0
		License As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LineHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLookup As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Missing As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOriginals As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		SizePx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Source As String
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
