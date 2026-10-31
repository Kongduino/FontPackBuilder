#tag Module
Protected Module FontRenderer
	#tag Method, Flags = &h0
		Function Ascent(fontName As String, sizePx As Integer) As Integer
		  // The font's ascent at that size, in pixels (the top of its line box is the ascender line), from CoreText
		  #If TargetMacOS
		    Declare Function CTFontGetAscent Lib "CoreText" (font As Ptr) As Double
		    Dim font As Ptr = SizedFont(fontName, sizePx)
		    If font = Nil Then Return sizePx
		    Return Round(CTFontGetAscent(font))
		  #Else
		    #Pragma Unused fontName
		    Return sizePx
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Render(fontName As String, sizePx As Integer, cp As Integer) As GlyphBitmap
		  // The glyph of a code point at sizePx pixels, drawn by CoreText into a grey bitmap with anti-aliasing and font
		  // smoothing off (1 bit per pixel, like FreeType's mono mode), then cropped to its ink. XOffset is from the pen,
		  // YOffset from the ascender line (the caller moves it to its line box)
		  #If TargetMacOS
		    Declare Function CGColorSpaceCreateDeviceGray Lib "CoreGraphics" () As Ptr
		    Declare Function CGBitmapContextCreate Lib "CoreGraphics" (data As Ptr, width As Integer, height As Integer, bitsPerComponent As Integer, bytesPerRow As Integer, space As Ptr, bitmapInfo As UInt32) As Ptr
		    Declare Sub CGContextSetShouldAntialias Lib "CoreGraphics" (ctx As Ptr, value As Boolean)
		    Declare Sub CGContextSetAllowsAntialiasing Lib "CoreGraphics" (ctx As Ptr, value As Boolean)
		    Declare Sub CGContextSetShouldSmoothFonts Lib "CoreGraphics" (ctx As Ptr, value As Boolean)
		    Declare Sub CGContextSetAllowsFontSmoothing Lib "CoreGraphics" (ctx As Ptr, value As Boolean)
		    Declare Sub CGContextSetShouldSubpixelPositionFonts Lib "CoreGraphics" (ctx As Ptr, value As Boolean)
		    Declare Sub CGContextSetShouldSubpixelQuantizeFonts Lib "CoreGraphics" (ctx As Ptr, value As Boolean)
		    Declare Sub CGContextSetGrayFillColor Lib "CoreGraphics" (ctx As Ptr, gray As Double, alpha As Double)
		    Declare Sub CTFontDrawGlyphs Lib "CoreText" (font As Ptr, glyphs As Ptr, positions As Ptr, count As Integer, ctx As Ptr)
		    Declare Function CTFontGetGlyphsForCharacters Lib "CoreText" (font As Ptr, chars As Ptr, glyphs As Ptr, count As Integer) As Boolean
		    Declare Function CTFontGetAdvancesForGlyphs Lib "CoreText" (font As Ptr, orientation As Integer, glyphs As Ptr, advances As Ptr, count As Integer) As Double
		    Declare Function CTFontGetAscent Lib "CoreText" (font As Ptr) As Double

		    Dim font As Ptr = SizedFont(fontName, sizePx)
		    If font = Nil Then Return New GlyphBitmap(0, 0)

		    // The glyph id (a surrogate pair above U+FFFF gives it in the first slot)
		    Dim chars As New MemoryBlock(4)
		    Dim glyphs As New MemoryBlock(4)
		    Dim count As Integer = 1
		    If cp > &hFFFF Then
		      Dim v As Integer = cp - &h10000
		      chars.UInt16Value(0) = &hD800 + Bitwise.ShiftRight(v, 10)
		      chars.UInt16Value(2) = &hDC00 + (v And &h3FF)
		      count = 2
		    Else
		      chars.UInt16Value(0) = cp
		    End If
		    Dim result As New GlyphBitmap(0, 0)
		    result.CodePoint = cp
		    If Not CTFontGetGlyphsForCharacters(font, chars, glyphs, count) Or glyphs.UInt16Value(0) = 0 Then Return result
		    Dim advances As New MemoryBlock(16)
		    result.Advance = Round(CTFontGetAdvancesForGlyphs(font, 0, glyphs, advances, 1))

		    // A white grey bitmap with room around the pen: rows from the top in memory, CoreGraphics' y from the bottom
		    Dim margin As Integer = sizePx
		    Dim w As Integer = sizePx * 4
		    Dim h As Integer = sizePx * 3
		    Dim pixels As New MemoryBlock(w * h)
		    For i As Integer = 0 To w * h - 1
		      pixels.Byte(i) = 255
		    Next
		    Dim space As Ptr = CGColorSpaceCreateDeviceGray
		    Dim ctx As Ptr = CGBitmapContextCreate(pixels, w, h, 8, w, space, 0) // 0: kCGImageAlphaNone
		    CFRelease(space)
		    If ctx = Nil Then Return result
		    CGContextSetAllowsAntialiasing(ctx, False)
		    CGContextSetShouldAntialias(ctx, False)
		    CGContextSetAllowsFontSmoothing(ctx, False)
		    CGContextSetShouldSmoothFonts(ctx, False)
		    CGContextSetShouldSubpixelPositionFonts(ctx, False)
		    CGContextSetShouldSubpixelQuantizeFonts(ctx, False)
		    CGContextSetGrayFillColor(ctx, 0, 1)
		    Dim ascent As Integer = Round(CTFontGetAscent(font))
		    Dim baselineRow As Integer = margin + ascent // from the top
		    Dim pos As New MemoryBlock(16) // one CGPoint
		    pos.DoubleValue(0) = margin
		    pos.DoubleValue(8) = h - baselineRow
		    CTFontDrawGlyphs(font, glyphs, pos, 1, ctx)
		    CFRelease(ctx)

		    // 1 bit per pixel, then cropped to the ink
		    Dim full As New GlyphBitmap(w, h)
		    For y As Integer = 0 To h - 1
		      For x As Integer = 0 To w - 1
		        If pixels.Byte(y * w + x) < 128 Then full.Pixel(x, y) = True
		      Next
		    Next
		    full.CodePoint = cp
		    full.Advance = result.Advance
		    full.XOffset = -margin
		    full.YOffset = -margin // the bitmap's top is margin pixels above the ascender line
		    full.Crop
		    Return full
		  #Else
		    #Pragma Unused fontName
		    #Pragma Unused sizePx
		    Dim g As New GlyphBitmap(0, 0)
		    g.CodePoint = cp
		    Return g
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SizedFont(fontName As String, sizePx As Integer) As Ptr
		  // A CoreText font at exactly sizePx (cached: the renderer asks for the same one thousands of times)
		  #If TargetMacOS
		    Declare Function CTFontCreateWithName Lib "CoreText" (name As CFStringRef, size As Double, matrix As Ptr) As Ptr
		    If fontName <> mSizedFontName Or sizePx <> mSizedFontSize Then
		      If mSizedFont <> Nil Then CFRelease(mSizedFont)
		      mSizedFont = CTFontCreateWithName(fontName, sizePx, Nil)
		      mSizedFontName = fontName
		      mSizedFontSize = sizePx
		    End If
		    Return mSizedFont
		  #Else
		    #Pragma Unused fontName
		    #Pragma Unused sizePx
		    Return Nil
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasGlyph(fontName As String, cp As Integer) As Boolean
		  // True when the font has a glyph of its own for the code point (not the "missing" box). Asks CoreText
		  #If TargetMacOS
		    Declare Function CTFontCreateWithName Lib "CoreText" (name As CFStringRef, size As Double, matrix As Ptr) As Ptr
		    Declare Function CTFontGetGlyphsForCharacters Lib "CoreText" (font As Ptr, chars As Ptr, glyphs As Ptr, count As Integer) As Boolean

		    If fontName <> mCoverageFontName Then
		      If mCoverageFont <> Nil Then CFRelease(mCoverageFont)
		      mCoverageFont = CTFontCreateWithName(fontName, 12, Nil)
		      mCoverageFontName = fontName
		    End If
		    If mCoverageFont = Nil Then Return False
		    // The code point in UTF-16: one unit, or a surrogate pair above U+FFFF
		    Dim chars As New MemoryBlock(4)
		    Dim glyphs As New MemoryBlock(4)
		    Dim count As Integer = 1
		    If cp > &hFFFF Then
		      Dim v As Integer = cp - &h10000
		      chars.UInt16Value(0) = &hD800 + Bitwise.ShiftRight(v, 10)
		      chars.UInt16Value(2) = &hDC00 + (v And &h3FF)
		      count = 2
		    Else
		      chars.UInt16Value(0) = cp
		    End If
		    If Not CTFontGetGlyphsForCharacters(mCoverageFont, chars, glyphs, count) Then Return False
		    Return glyphs.UInt16Value(0) <> 0
		  #Else
		    #Pragma Unused fontName
		    #Pragma Unused cp
		    Return True
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CFRelease(obj As Ptr)
		  #If TargetMacOS
		    Declare Sub CFRelease Lib "CoreFoundation" (obj As Ptr)
		    If obj <> Nil Then CFRelease(obj)
		  #Else
		    #Pragma Unused obj
		  #EndIf
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RegisterFontFile(f As FolderItem, faces() As String) As Boolean
		  // Makes a font file usable by this app (not installed for other apps): CoreText registers it for the process.
		  // faces receives the PostScript name of each face in the file (a .ttc holds several), to use as a FontName
		  #If TargetMacOS
		    Declare Function CFURLCreateWithFileSystemPath Lib "CoreFoundation" (allocator As Ptr, path As CFStringRef, style As Integer, isDir As Boolean) As Ptr
		    Declare Function CTFontManagerRegisterFontsForURL Lib "CoreText" (url As Ptr, scope As Integer, errorOut As Ptr) As Boolean
		    Declare Function CTFontManagerCreateFontDescriptorsFromURL Lib "CoreText" (url As Ptr) As Ptr
		    Declare Function CFArrayGetCount Lib "CoreFoundation" (arr As Ptr) As Integer
		    Declare Function CFArrayGetValueAtIndex Lib "CoreFoundation" (arr As Ptr, idx As Integer) As Ptr
		    Declare Function CTFontCreateWithFontDescriptor Lib "CoreText" (desc As Ptr, size As Double, matrix As Ptr) As Ptr
		    Declare Function CTFontCopyPostScriptName Lib "CoreText" (font As Ptr) As CFStringRef

		    If f = Nil Or Not f.Exists Then Return False
		    Dim url As Ptr = CFURLCreateWithFileSystemPath(Nil, f.NativePath, 0, False) // 0: POSIX path
		    If url = Nil Then Return False
		    // Scope 1: this process. Already registered (an earlier call) isn't a problem: its faces are listed below
		    Call CTFontManagerRegisterFontsForURL(url, 1, Nil)
		    Dim descriptors As Ptr = CTFontManagerCreateFontDescriptorsFromURL(url)
		    CFRelease(url)
		    If descriptors = Nil Then Return False
		    For i As Integer = 0 To CFArrayGetCount(descriptors) - 1
		      Dim font As Ptr = CTFontCreateWithFontDescriptor(CFArrayGetValueAtIndex(descriptors, i), 12, Nil)
		      If font <> Nil Then
		        faces.Add(CTFontCopyPostScriptName(font))
		        CFRelease(font)
		      End If
		    Next
		    CFRelease(descriptors)
		    Return faces.Count > 0
		  #Else
		    #Pragma Unused f
		    #Pragma Unused faces
		    Return False
		  #EndIf
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCoverageFont As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCoverageFontName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSizedFont As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSizedFontName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSizedFontSize As Integer
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
