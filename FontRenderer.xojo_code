#tag Module
Protected Module FontRenderer
	#tag Method, Flags = &h0
		Function Ascent(fontName As String, sizePx As Integer) As Integer
		  // The font's ascent at that size, in pixels (the top of its line box is the ascender line): from CoreText on
		  // macOS, from the font's hhea table on Windows (what CoreText reports)
		  #If TargetMacOS
		    Declare Function CTFontGetAscent Lib "CoreText" (font As Ptr) As Double
		    Dim font As Ptr = SizedFont(fontName, sizePx)
		    If font = Nil Then Return sizePx
		    Return Round(CTFontGetAscent(font))
		  #ElseIf TargetWindows
		    If Not LoadTables(fontName) Then Return sizePx
		    Return Round(mHheaAscender * sizePx / mUnitsPerEm)
		  #Else
		    #Pragma Unused fontName
		    Return sizePx
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CmapGlyph(cp As Integer) As Integer
		  // The glyph id of a code point in the font's cmap subtable (format 4 or 12), 0 when it has none
		  If mCmap = Nil Then Return 0
		  Dim off As Integer = mCmapOffset
		  If mCmapFormat = 12 Then
		    Dim lo As Integer = 0
		    Dim hi As Integer = mCmap.UInt32Value(off + 12) - 1
		    While lo <= hi
		      Dim mid As Integer = (lo + hi) \ 2
		      Dim g As Integer = off + 16 + mid * 12
		      If cp < mCmap.UInt32Value(g) Then
		        hi = mid - 1
		      ElseIf cp > mCmap.UInt32Value(g + 4) Then
		        lo = mid + 1
		      Else
		        Return mCmap.UInt32Value(g + 8) + cp - mCmap.UInt32Value(g)
		      End If
		    Wend
		    Return 0
		  End If

		  // Format 4: the BMP only, segments sorted by their last code point
		  If cp > &hFFFF Then Return 0
		  Dim segX2 As Integer = mCmap.UInt16Value(off + 6)
		  Dim endBase As Integer = off + 14
		  Dim startBase As Integer = endBase + segX2 + 2
		  Dim deltaBase As Integer = startBase + segX2
		  Dim rangeBase As Integer = deltaBase + segX2
		  Dim lo As Integer = 0
		  Dim hi As Integer = segX2 \ 2 - 1
		  While lo < hi
		    Dim mid As Integer = (lo + hi) \ 2
		    If mCmap.UInt16Value(endBase + 2 * mid) < cp Then
		      lo = mid + 1
		    Else
		      hi = mid
		    End If
		  Wend
		  If mCmap.UInt16Value(endBase + 2 * lo) < cp Then Return 0
		  Dim first As Integer = mCmap.UInt16Value(startBase + 2 * lo)
		  If first > cp Then Return 0
		  Dim delta As Integer = mCmap.UInt16Value(deltaBase + 2 * lo)
		  Dim rangeOffset As Integer = mCmap.UInt16Value(rangeBase + 2 * lo)
		  If rangeOffset = 0 Then Return (cp + delta) And &hFFFF
		  Dim at As Integer = rangeBase + 2 * lo + rangeOffset + 2 * (cp - first)
		  If at + 2 > mCmap.Size Then Return 0
		  Dim g As Integer = mCmap.UInt16Value(at)
		  If g = 0 Then Return 0
		  Return (g + delta) And &hFFFF
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DrawingSurface(w As Integer, h As Integer) As Ptr
		  // The pixels of a w x h, 32-bit, top-down bitmap selected into the drawing context (kept: every glyph of a size
		  // uses the same one), or Nil
		  #If TargetWindows
		    Declare Function CreateCompatibleDC Lib "Gdi32" (hdc As Ptr) As Ptr
		    Declare Function CreateDIBSection Lib "Gdi32" (hdc As Ptr, info As Ptr, usage As UInt32, ByRef bits As Ptr, section As Ptr, offset As UInt32) As Ptr
		    Declare Function SelectObject Lib "Gdi32" (hdc As Ptr, obj As Ptr) As Ptr
		    Declare Function DeleteObject Lib "Gdi32" (obj As Ptr) As Int32

		    If mDC = Nil Then mDC = CreateCompatibleDC(Nil)
		    If mDC = Nil Then Return Nil
		    If mSurface <> Nil And w = mSurfaceW And h = mSurfaceH Then Return mSurfaceBits
		    Dim info As New MemoryBlock(44) // BITMAPINFOHEADER; no colour table at 32 bits
		    info.LittleEndian = True
		    info.UInt32Value(0) = 40
		    info.Int32Value(4) = w
		    info.Int32Value(8) = -h // negative: rows from the top
		    info.UInt16Value(12) = 1
		    info.UInt16Value(14) = 32
		    Dim bits As Ptr
		    Dim surface As Ptr = CreateDIBSection(mDC, info, 0, bits, Nil, 0)
		    If surface = Nil Or bits = Nil Then Return Nil
		    Call SelectObject(mDC, surface)
		    If mSurface <> Nil Then Call DeleteObject(mSurface) // no longer selected
		    mSurface = surface
		    mSurfaceBits = bits
		    mSurfaceW = w
		    mSurfaceH = h
		    Return bits
		  #Else
		    #Pragma Unused w
		    #Pragma Unused h
		    Return Nil
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FaceOf(font As Ptr) As String
		  // The face name GDI actually gives for a font it was asked for (another one when it doesn't know the name)
		  #If TargetWindows
		    Declare Function CreateCompatibleDC Lib "Gdi32" (hdc As Ptr) As Ptr
		    Declare Function SelectObject Lib "Gdi32" (hdc As Ptr, obj As Ptr) As Ptr
		    Declare Function GetTextFaceW Lib "Gdi32" (hdc As Ptr, count As Int32, name As Ptr) As Int32

		    If mDC = Nil Then mDC = CreateCompatibleDC(Nil)
		    If mDC = Nil Or font = Nil Then Return ""
		    Dim previous As Ptr = SelectObject(mDC, font)
		    Dim name As New MemoryBlock(128)
		    Dim n As Integer = GetTextFaceW(mDC, 64, name)
		    Call SelectObject(mDC, previous)
		    If n <= 0 Then Return ""
		    Return name.WString(0)
		  #Else
		    #Pragma Unused font
		    Return ""
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FamilyNames(f As FolderItem) As String()
		  // The family name (name id 1) of each face in a font file (a .ttc holds several), as GDI selects fonts by it
		  Dim names() As String
		  Try
		    Dim bs As BinaryStream = BinaryStream.Open(f, False)
		    bs.LittleEndian = False
		    Dim offsets() As Integer
		    Dim tag As String = bs.Read(4, Encodings.ASCII)
		    If tag = "ttcf" Then
		      bs.Position = 8
		      Dim n As Integer = bs.ReadUInt32
		      For i As Integer = 0 To n - 1
		        bs.Position = 12 + 4 * i
		        offsets.Add(bs.ReadUInt32)
		      Next
		    Else
		      offsets.Add(0)
		    End If
		    For Each sfnt As Integer In offsets
		      Dim name As String = FamilyNameAt(bs, sfnt)
		      If name <> "" Then names.Add(name)
		    Next
		    bs.Close
		  Catch e As IOException
		    System.DebugLog("FontRenderer: can't read " + f.NativePath + ": " + e.Message)
		  End Try
		  Return names
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FamilyNameAt(bs As BinaryStream, sfnt As Integer) As String
		  // The family name of the face whose table directory is at sfnt: Windows English first, then any Windows
		  // language, then Macintosh Roman
		  bs.Position = sfnt + 4
		  Dim numTables As Integer = bs.ReadUInt16
		  Dim nameTable As Integer = -1
		  For i As Integer = 0 To numTables - 1
		    bs.Position = sfnt + 12 + 16 * i
		    Dim tag As String = bs.Read(4, Encodings.ASCII)
		    If tag = "name" Then
		      bs.Position = sfnt + 12 + 16 * i + 8
		      nameTable = bs.ReadUInt32
		      Exit
		    End If
		  Next
		  If nameTable < 0 Then Return ""

		  bs.Position = nameTable + 2
		  Dim count As Integer = bs.ReadUInt16
		  Dim stringsAt As Integer = nameTable + bs.ReadUInt16
		  Dim best As String
		  Dim bestRank As Integer = 0
		  For i As Integer = 0 To count - 1
		    bs.Position = nameTable + 6 + 12 * i
		    Dim platform As Integer = bs.ReadUInt16
		    Dim encoding As Integer = bs.ReadUInt16
		    Dim language As Integer = bs.ReadUInt16
		    Dim nameID As Integer = bs.ReadUInt16
		    Dim length As Integer = bs.ReadUInt16
		    Dim offset As Integer = bs.ReadUInt16
		    If nameID <> 1 Then Continue
		    Dim rank As Integer = 0
		    If platform = 3 And (encoding = 1 Or encoding = 10 Or encoding = 0) Then
		      rank = If(language = &h409, 3, 2)
		    ElseIf platform = 1 And encoding = 0 Then
		      rank = 1
		    End If
		    If rank <= bestRank Then Continue
		    bs.Position = stringsAt + offset
		    Dim raw As String = bs.Read(length)
		    Dim s As String
		    If platform = 3 Then
		      s = DefineEncoding(raw, Encodings.UTF16BE)
		    Else
		      s = DefineEncoding(raw, Encodings.MacRoman)
		    End If
		    best = s.ConvertEncoding(Encodings.UTF8)
		    bestRank = rank
		  Next
		  Return best
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FontTable(tag As String) As MemoryBlock
		  // A table of the font selected into the drawing context (the face's own one in a .ttc), big-endian, or Nil
		  #If TargetWindows
		    Declare Function GetFontData Lib "Gdi32" (hdc As Ptr, table As UInt32, offset As UInt32, buffer As Ptr, size As UInt32) As UInt32

		    // The tag as GDI wants it: its four letters in memory order
		    Dim key As UInt32 = Asc(tag.Middle(0, 1)) + Asc(tag.Middle(1, 1)) * &h100 + Asc(tag.Middle(2, 1)) * &h10000 + Asc(tag.Middle(3, 1)) * &h1000000
		    Dim size As UInt32 = GetFontData(mDC, key, 0, Nil, 0)
		    If size = 0 Or size = &hFFFFFFFF Then Return Nil
		    Dim data As New MemoryBlock(size)
		    If GetFontData(mDC, key, 0, data, size) <> size Then Return Nil
		    data.LittleEndian = False
		    Return data
		  #Else
		    #Pragma Unused tag
		    Return Nil
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GlyphAdvance(gid As Integer) As Integer
		  // The advance of a glyph in font units, from hmtx (the glyphs after numberOfHMetrics take the last one)
		  If mHmtx = Nil Or mNumHMetrics = 0 Then Return 0
		  Dim i As Integer = Min(gid, mNumHMetrics - 1)
		  If 4 * i + 2 > mHmtx.Size Then Return 0
		  Return mHmtx.UInt16Value(4 * i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasGlyph(fontName As String, cp As Integer) As Boolean
		  // True when the font has a glyph of its own for the code point (not the "missing" box): asks CoreText on macOS,
		  // reads the font's cmap on Windows
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
		  #ElseIf TargetWindows
		    If Not LoadTables(fontName) Then Return False
		    Return CmapGlyph(cp) <> 0
		  #Else
		    #Pragma Unused fontName
		    #Pragma Unused cp
		    Return True
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LoadTables(fontName As String) As Boolean
		  // Windows: reads the tables of a font that Render and HasGlyph need (cmap, head, hhea, hmtx), once per font
		  #If TargetWindows
		    Declare Function CreateFontW Lib "Gdi32" (height As Int32, width As Int32, escapement As Int32, orientation As Int32, weight As Int32, italic As UInt32, underline As UInt32, strikeOut As UInt32, charSet As UInt32, outPrecision As UInt32, clipPrecision As UInt32, quality As UInt32, pitchAndFamily As UInt32, faceName As WString) As Ptr
		    Declare Function CreateCompatibleDC Lib "Gdi32" (hdc As Ptr) As Ptr
		    Declare Function SelectObject Lib "Gdi32" (hdc As Ptr, obj As Ptr) As Ptr
		    Declare Function DeleteObject Lib "Gdi32" (obj As Ptr) As Int32

		    If fontName = mTablesFont Then Return mTablesOK
		    mTablesFont = fontName
		    mTablesOK = False
		    mCmap = Nil
		    mHmtx = Nil
		    If mDC = Nil Then mDC = CreateCompatibleDC(Nil)
		    If mDC = Nil Then Return False
		    Dim font As Ptr = CreateFontW(-64, 0, 0, 0, 400, 0, 0, 0, 1, 0, 0, 3, 0, fontName)
		    If font = Nil Then Return False
		    If FaceOf(font) <> fontName Then
		      Call DeleteObject(font)
		      Return False
		    End If
		    Dim previous As Ptr = SelectObject(mDC, font)
		    Dim cmap As MemoryBlock = FontTable("cmap")
		    Dim head As MemoryBlock = FontTable("head")
		    Dim hhea As MemoryBlock = FontTable("hhea")
		    Dim hmtx As MemoryBlock = FontTable("hmtx")
		    Call SelectObject(mDC, previous)
		    Call DeleteObject(font)
		    If cmap = Nil Or head = Nil Or hhea = Nil Or hmtx = Nil Or head.Size < 20 Or hhea.Size < 36 Then Return False

		    // The cmap subtable: full Unicode (format 12) first, else the BMP (format 4)
		    Dim bestRank As Integer = 0
		    Dim n As Integer = cmap.UInt16Value(2)
		    For i As Integer = 0 To n - 1
		      Dim platform As Integer = cmap.UInt16Value(4 + 8 * i)
		      Dim encoding As Integer = cmap.UInt16Value(6 + 8 * i)
		      Dim offset As Integer = cmap.UInt32Value(8 + 8 * i)
		      If offset + 2 > cmap.Size Then Continue
		      Dim fmt As Integer = cmap.UInt16Value(offset)
		      Dim unicode As Boolean = platform = 0 Or (platform = 3 And (encoding = 1 Or encoding = 10))
		      Dim rank As Integer = 0
		      If unicode And fmt = 12 Then
		        rank = 2
		      ElseIf unicode And fmt = 4 Then
		        rank = 1
		      End If
		      If rank > bestRank Then
		        bestRank = rank
		        mCmapOffset = offset
		        mCmapFormat = fmt
		      End If
		    Next
		    If bestRank = 0 Then Return False
		    mCmap = cmap
		    mHmtx = hmtx
		    mUnitsPerEm = head.UInt16Value(18)
		    mHheaAscender = hhea.Int16Value(4)
		    mNumHMetrics = hhea.UInt16Value(34)
		    If mUnitsPerEm = 0 Then Return False
		    mTablesOK = True
		    Return True
		  #Else
		    #Pragma Unused fontName
		    Return False
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RegisterFontFile(f As FolderItem, faces() As String) As Boolean
		  // Makes a font file usable by this app (not installed for other apps). faces receives the name to use as a
		  // FontName for each face in the file (a .ttc holds several): its PostScript name, which CoreText registers for
		  // the process, on macOS; its family name, which GDI adds privately, on Windows
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
		  #ElseIf TargetWindows
		    Declare Function AddFontResourceExW Lib "Gdi32" (name As WString, flags As UInt32, reserved As Ptr) As Int32

		    If f = Nil Or Not f.Exists Then Return False
		    // FR_PRIVATE: for this process only. Adding a file again (an earlier call) isn't a problem
		    If AddFontResourceExW(f.NativePath, &h10, Nil) = 0 Then Return False
		    For Each name As String In FamilyNames(f)
		      If faces.IndexOf(name) < 0 Then faces.Add(name) // a family's styles share its name
		    Next
		    // A file added again may have changed: read its tables again
		    mTablesFont = ""
		    Return faces.Count > 0
		  #Else
		    #Pragma Unused f
		    #Pragma Unused faces
		    Return False
		  #EndIf
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Render(fontName As String, sizePx As Integer, cp As Integer) As GlyphBitmap
		  // The glyph of a code point at sizePx pixels, drawn with anti-aliasing and font smoothing off (1 bit per pixel,
		  // like FreeType's mono mode), then cropped to its ink: by CoreText on macOS, by GDI on Windows. XOffset is from
		  // the pen, YOffset from the ascender line (the caller moves it to its line box)
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
		  #ElseIf TargetWindows
		    Declare Function SelectObject Lib "Gdi32" (hdc As Ptr, obj As Ptr) As Ptr
		    Declare Function SetTextColor Lib "Gdi32" (hdc As Ptr, colour As UInt32) As UInt32
		    Declare Function SetBkMode Lib "Gdi32" (hdc As Ptr, mode As Int32) As Int32
		    Declare Function SetTextAlign Lib "Gdi32" (hdc As Ptr, align As UInt32) As UInt32
		    Declare Function ExtTextOutW Lib "Gdi32" (hdc As Ptr, x As Int32, y As Int32, options As UInt32, rect As Ptr, text As Ptr, count As UInt32, dx As Ptr) As Int32
		    Declare Function GdiFlush Lib "Gdi32" () As Int32

		    Dim result As New GlyphBitmap(0, 0)
		    result.CodePoint = cp
		    If Not LoadTables(fontName) Then Return result
		    Dim gid As Integer = CmapGlyph(cp)
		    If gid = 0 Then Return result
		    // From hmtx, unhinted and rounded, like CoreText's advance
		    result.Advance = Round(GlyphAdvance(gid) * sizePx / mUnitsPerEm)
		    Dim font As Ptr = SizedFont(fontName, sizePx)
		    If font = Nil Then Return result

		    // A white bitmap with room around the pen, rows from the top
		    Dim margin As Integer = sizePx
		    Dim w As Integer = sizePx * 4
		    Dim h As Integer = sizePx * 3
		    Dim bits As Ptr = DrawingSurface(w, h)
		    If bits = Nil Then Return result
		    For i As Integer = 0 To w * h - 1
		      bits.UInt32(i * 4) = &hFFFFFF
		    Next
		    Call SelectObject(mDC, font)
		    Call SetBkMode(mDC, 1) // TRANSPARENT
		    Call SetTextColor(mDC, 0)
		    Call SetTextAlign(mDC, 24) // TA_BASELINE: y is the baseline
		    Dim ascent As Integer = Round(mHheaAscender * sizePx / mUnitsPerEm)
		    Dim baselineRow As Integer = margin + ascent // from the top
		    Dim glyphs As New MemoryBlock(2)
		    glyphs.LittleEndian = True
		    glyphs.UInt16Value(0) = gid
		    // ETO_GLYPH_INDEX: this font's glyph, which GDI can't replace with another font's
		    Call ExtTextOutW(mDC, margin, baselineRow, &h10, Nil, glyphs, 1, Nil)
		    Call GdiFlush

		    // 1 bit per pixel (the blue byte of each pixel), then cropped to the ink
		    Dim full As New GlyphBitmap(w, h)
		    For y As Integer = 0 To h - 1
		      For x As Integer = 0 To w - 1
		        If bits.Byte((y * w + x) * 4) < 128 Then full.Pixel(x, y) = True
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
		  // The font at exactly sizePx (cached: the renderer asks for the same one thousands of times): a CoreText font
		  // on macOS; on Windows a GDI font without anti-aliasing, or Nil when GDI would give another face
		  #If TargetMacOS
		    Declare Function CTFontCreateWithName Lib "CoreText" (name As CFStringRef, size As Double, matrix As Ptr) As Ptr
		    If fontName <> mSizedFontName Or sizePx <> mSizedFontSize Then
		      If mSizedFont <> Nil Then CFRelease(mSizedFont)
		      mSizedFont = CTFontCreateWithName(fontName, sizePx, Nil)
		      mSizedFontName = fontName
		      mSizedFontSize = sizePx
		    End If
		    Return mSizedFont
		  #ElseIf TargetWindows
		    Declare Function CreateFontW Lib "Gdi32" (height As Int32, width As Int32, escapement As Int32, orientation As Int32, weight As Int32, italic As UInt32, underline As UInt32, strikeOut As UInt32, charSet As UInt32, outPrecision As UInt32, clipPrecision As UInt32, quality As UInt32, pitchAndFamily As UInt32, faceName As WString) As Ptr
		    Declare Function SelectObject Lib "Gdi32" (hdc As Ptr, obj As Ptr) As Ptr
		    Declare Function GetStockObject Lib "Gdi32" (index As Int32) As Ptr
		    Declare Function DeleteObject Lib "Gdi32" (obj As Ptr) As Int32
		    If fontName <> mSizedFontName Or sizePx <> mSizedFontSize Then
		      If mSizedFont <> Nil Then
		        If mDC <> Nil Then Call SelectObject(mDC, GetStockObject(13)) // SYSTEM_FONT: the old one can then go
		        Call DeleteObject(mSizedFont)
		      End If
		      // Negative height: the em size in pixels, as CoreText's size. 1: DEFAULT_CHARSET; 3: NONANTIALIASED_QUALITY
		      mSizedFont = CreateFontW(-sizePx, 0, 0, 0, 400, 0, 0, 0, 1, 0, 0, 3, 0, fontName)
		      If mSizedFont <> Nil And FaceOf(mSizedFont) <> fontName Then
		        Call DeleteObject(mSizedFont)
		        mSizedFont = Nil
		      End If
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


	#tag Property, Flags = &h21
		Private mCmap As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCmapFormat As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCmapOffset As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCoverageFont As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCoverageFontName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDC As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHheaAscender As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHmtx As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumHMetrics As Integer
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

	#tag Property, Flags = &h21
		Private mSurface As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSurfaceBits As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSurfaceH As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSurfaceW As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTablesFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTablesOK As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUnitsPerEm As Integer
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
