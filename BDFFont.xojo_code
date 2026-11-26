#tag Class
Protected Class BDFFont
	#tag Method, Flags = &h0
		Function Ascent() As Integer
		  // Pixels from the top of the line box (the ascender line) to the baseline: FONT_ASCENT
		  Return mAscent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FaceName() As String
		  // The font's FAMILY_NAME, else its file name
		  Return mFaceName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasGlyph(cp As Integer) As Boolean
		  Return mGlyphs.HasKey(cp)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function JIS0201ToUnicode(code As Integer) As Integer
		  // A JIS X 0201 code as a code point: the roman half (with the yen sign and the overline), half-width katakana;
		  // -1 when it has none
		  If code = &h5C Then Return &hA5
		  If code = &h7E Then Return &h203E
		  If code >= &h20 And code <= &h7D Then Return code
		  If code >= &hA1 And code <= &hDF Then Return &hFF61 + code - &hA1
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function JIS0208ToUnicode(code As Integer) As Integer
		  // A JIS X 0208 code (row and cell, &h2121 to &h7E7E) as a code point, through EUC-JP; -1 when it has none
		  Dim j1 As Integer = Bitwise.ShiftRight(code, 8)
		  Dim j2 As Integer = code And &hFF
		  If j1 < &h21 Or j1 > &h7E Or j2 < &h21 Or j2 > &h7E Then Return -1
		  If mEUCJP = Nil Then mEUCJP = GetInternetTextEncoding("EUC-JP")
		  Return Decoded(ChrB(j1 Or &h80) + ChrB(j2 Or &h80), mEUCJP)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Decoded(bytes As String, enc As TextEncoding) As Integer
		  // The one character two bytes give in that encoding, or -1 (no encoding, no such character)
		  If enc = Nil Then Return -1
		  Dim s As String = bytes.DefineEncoding(enc).ConvertEncoding(Encodings.UTF8)
		  If s.Length <> 1 Then Return -1
		  Dim cp As Integer = s.Asc
		  If cp = &h3F Or cp = &hFFFD Then Return -1 // what a failed conversion gives
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function JIS0208WindowsAlias(code As Integer, cp As Integer) As Integer
		  // The code point Windows (CP932) gives a JIS X 0208 code where it differs from JIS, e.g. U+FF5E for the wave
		  // dash (U+301C): text typed on Windows and many phones uses these. -1 where they agree
		  Dim j1 As Integer = Bitwise.ShiftRight(code, 8)
		  Dim j2 As Integer = code And &hFF
		  Dim s1 As Integer = Bitwise.ShiftRight(j1 + 1, 1) + If(j1 <= &h5E, &h70, &hB0)
		  Dim s2 As Integer
		  If (j1 And 1) = 1 Then
		    s2 = j2 + &h1F
		    If s2 >= &h7F Then s2 = s2 + 1
		  Else
		    s2 = j2 + &h7E
		  End If
		  If mCP932 = Nil Then mCP932 = GetInternetTextEncoding("Windows-31J")
		  Dim alias As Integer = Decoded(ChrB(s1) + ChrB(s2), mCP932)
		  If alias = cp Then Return -1
		  Return alias
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Load(f As FolderItem, ByRef errorText As String) As Boolean
		  // Reads a BDF bitmap font: Unicode (ISO10646), JIS X 0208 or JIS X 0201 encoded. Its pixels are used as they
		  // are, at its own size (PixelSize). A font loaded after another adds only the characters the first lacks, so a
		  // JIS X 0208 kanji font and its JIS X 0201 half-width katakana font make one pack. As mkfontpack.py's load_bdf.
		  // False, with errorText, when the file isn't a BDF font this can read
		  If mGlyphs = Nil Then mGlyphs = New Dictionary
		  Dim text As String
		  Try
		    Dim t As TextInputStream = TextInputStream.Open(f)
		    t.Encoding = Encodings.ISOLatin1
		    text = t.ReadAll
		    t.Close
		  Catch e As IOException
		    errorText = e.Message
		    Return False
		  End Try
		  Dim lines() As String = text.ReplaceLineEndings(Chr(10)).Split(Chr(10))

		  Const kNone = 0
		  Const kUnicode = 1
		  Const kJIS0208 = 2
		  Const kJIS0201 = 3
		  Dim encoding As Integer = kNone
		  Dim ascent As Integer = 0
		  Dim pixelSize As Integer = 0
		  Dim boxHeight As Integer = 0
		  Dim family As String
		  Dim aliases As New Dictionary
		  Dim cp As Integer = -1
		  Dim alias As Integer = -1
		  Dim advance As Integer = 0
		  Dim bw, bh, bx, by As Integer
		  Dim found As Integer = 0
		  Dim hexDigits As String = "0123456789ABCDEF"

		  Dim i As Integer = 0
		  While i < lines.Count
		    Dim line As String = lines(i).Trim
		    i = i + 1
		    If line = "" Then Continue
		    Dim fields() As String = line.Split(" ")
		    Select Case fields(0)
		    Case "FAMILY_NAME"
		      family = line.Middle(12).Trim.ReplaceAll("""", "")
		    Case "PIXEL_SIZE"
		      If fields.Count > 1 Then pixelSize = fields(1).ToInteger
		    Case "FONTBOUNDINGBOX"
		      If fields.Count > 2 Then boxHeight = fields(2).ToInteger
		    Case "FONT_ASCENT"
		      If fields.Count > 1 Then ascent = fields(1).ToInteger
		    Case "CHARSET_REGISTRY"
		      Dim registry As String = line.Middle(17).Trim.ReplaceAll("""", "").Uppercase
		      If registry.IndexOf("10646") >= 0 Then
		        encoding = kUnicode
		      ElseIf registry.BeginsWith("JISX0208") Then
		        encoding = kJIS0208
		      ElseIf registry.BeginsWith("JISX0201") Then
		        encoding = kJIS0201
		      Else
		        errorText = f.Name + ": " + registry
		        Return False
		      End If
		    Case "ENCODING"
		      If encoding = kNone Then
		        errorText = f.Name + ": no CHARSET_REGISTRY"
		        Return False
		      End If
		      Dim code As Integer = If(fields.Count > 1, fields(1).ToInteger, -1)
		      cp = -1
		      alias = -1
		      If code >= 0 Then
		        Select Case encoding
		        Case kUnicode
		          cp = code
		        Case kJIS0208
		          cp = JIS0208ToUnicode(code)
		          If cp >= 0 Then alias = JIS0208WindowsAlias(code, cp)
		        Case kJIS0201
		          cp = JIS0201ToUnicode(code)
		        End Select
		      End If
		    Case "DWIDTH"
		      If fields.Count > 1 Then advance = fields(1).ToInteger
		    Case "BBX"
		      If fields.Count > 4 Then
		        bw = fields(1).ToInteger
		        bh = fields(2).ToInteger
		        bx = fields(3).ToInteger
		        by = fields(4).ToInteger
		      End If
		    Case "BITMAP"
		      // bh rows of hex, the leftmost pixel in the high bit of the first byte
		      Dim g As New GlyphBitmap(bw, bh)
		      For y As Integer = 0 To bh - 1
		        If i >= lines.Count Then Exit
		        Dim row As String = lines(i).Trim
		        i = i + 1
		        For x As Integer = 0 To bw - 1
		          Dim digit As Integer = x \ 4
		          If digit >= row.Length Then Exit
		          Dim nibble As Integer = hexDigits.IndexOf(row.Middle(digit, 1).Uppercase)
		          If nibble < 0 Then Continue
		          If (Bitwise.ShiftRight(nibble, 3 - (x Mod 4)) And 1) = 1 Then g.Pixel(x, y) = True
		        Next
		      Next
		      If cp < 0 Or mGlyphs.HasKey(cp) Then Continue // not a character, or the first font has it
		      g.CodePoint = cp
		      g.Advance = advance
		      // BBX's y offset is the box bottom above the baseline; YOffset is from the ascender line down
		      g.XOffset = bx
		      g.YOffset = ascent - (by + bh)
		      g.Crop
		      mGlyphs.Value(cp) = g
		      found = found + 1
		      If alias >= 0 Then aliases.Value(alias) = cp
		    End Select
		  Wend

		  // The Windows code points, where the font has no glyph of its own there
		  For Each k As Variant In aliases.Keys
		    If mGlyphs.HasKey(k) Then Continue
		    Dim g As GlyphBitmap = GlyphBitmap(mGlyphs.Value(aliases.Value(k))).Clone
		    g.CodePoint = k
		    mGlyphs.Value(k) = g
		  Next

		  If found = 0 Then
		    errorText = f.Name + ": no glyphs"
		    Return False
		  End If
		  If mFiles.Count = 0 Then
		    // The first font sets the line box and the size
		    mAscent = ascent
		    mPixelSize = If(pixelSize > 0, pixelSize, boxHeight)
		    mFaceName = If(family <> "", family, f.Name)
		  End If
		  mFiles.Add(f.Name)
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FileNames() As String
		  // The fonts loaded, comma-separated (the pack's font= line, as mkfontpack.py writes it)
		  Return String.FromArray(mFiles, ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PixelSize() As Integer
		  // The font's size in pixels (PIXEL_SIZE, else its bounding box height): its pixels are made for that size
		  Return mPixelSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Render(cp As Integer) As GlyphBitmap
		  // A copy of the glyph of a code point, cropped to its ink, as FontRenderer.Render gives it: XOffset from the
		  // pen, YOffset from the ascender line. A blank glyph when the font doesn't have it
		  If Not mGlyphs.HasKey(cp) Then Return New GlyphBitmap(0, 0)
		  Return GlyphBitmap(mGlyphs.Value(cp)).Clone
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mAscent As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCP932 As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEUCJP As TextEncoding
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFaceName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFiles() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGlyphs As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPixelSize As Integer
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
