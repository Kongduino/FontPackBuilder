#tag Module
Protected Module MFPWriter
	#tag Method, Flags = &h0
		Function Build(glyphs() As GlyphBitmap, lineHeight As Integer, baseline As Integer, meta As String, forceIndexSize As Integer = 0) As MemoryBlock
		  // A Meshtastic Font Pack, format version 2 (MeshtasticFontPacks, SPEC.md), as mkfontpack.py writes it: glyphs
		  // sorted by code point, without duplicates. meta: the metadata text (key=value lines). forceIndexSize: 1 or 2
		  // to force the size of the metrics indices (0: the smallest that fits). Nil when the glyphs don't fit the format
		  Dim n As Integer = glyphs.Count
		  If n = 0 Then Return Nil

		  // Ranges: runs of consecutive code points, at most 256 long, within one plane
		  Dim runFirst(), runLast() As Integer
		  For Each g As GlyphBitmap In glyphs
		    Dim cp As Integer = g.CodePoint
		    Dim last As Integer = runLast.LastIndex
		    If last >= 0 And cp = runLast(last) + 1 And cp - runFirst(last) < 256 And _
		      Bitwise.ShiftRight(cp, 16) = Bitwise.ShiftRight(runFirst(last), 16) Then
		      runLast(last) = cp
		    Else
		      runFirst.Add(cp)
		      runLast.Add(cp)
		    End If
		  Next
		  Dim rangeCount As Integer = runFirst.Count
		  Dim planeCount As Integer = 0
		  Dim plane As Integer = -1
		  For Each f As Integer In runFirst
		    If Bitwise.ShiftRight(f, 16) <> plane Then
		      plane = Bitwise.ShiftRight(f, 16)
		      planeCount = planeCount + 1
		    End If
		  Next

		  // Distinct metrics, the most common first (ties: in the order they first appear)
		  Dim keyIndex As New Dictionary
		  Dim keys() As String
		  Dim counts(), firsts() As Integer
		  For i As Integer = 0 To n - 1
		    Dim g As GlyphBitmap = glyphs(i)
		    If g.Advance < 0 Or g.Advance > 255 Or g.Width > 255 Or g.Height > 255 Or g.XOffset < -128 Or g.XOffset > 127 _
		      Or g.YOffset < -128 Or g.YOffset > 127 Then Return Nil
		    Dim k As String = g.MetricsKey
		    If keyIndex.HasKey(k) Then
		      Dim j As Integer = keyIndex.Value(k)
		      counts(j) = counts(j) + 1
		    Else
		      keyIndex.Value(k) = keys.Count
		      keys.Add(k)
		      counts.Add(1)
		      firsts.Add(i)
		    End If
		  Next
		  Dim metricsCount As Integer = keys.Count
		  If metricsCount > 65535 Then Return Nil
		  Dim order() As Integer
		  Dim sortKey() As Int64
		  For j As Integer = 0 To metricsCount - 1
		    order.Add(j)
		    sortKey.Add((1000000 - counts(j)) * 10000000 + firsts(j))
		  Next
		  sortKey.SortWith(order)
		  Dim metricRank As New Dictionary // key -> its index in the metrics table
		  For r As Integer = 0 To metricsCount - 1
		    metricRank.Value(keys(order(r))) = r
		  Next
		  Dim indexSize As Integer = If(metricsCount <= 256, 1, 2)
		  If forceIndexSize > indexSize Then indexSize = forceIndexSize

		  // Sizes and offsets: planes, ranges, range checkpoints, metrics, glyphs, glyph checkpoints, bitmaps, metadata
		  Dim bitmapsSize As Integer = 0
		  Dim maxAdvance As Integer = 0
		  For Each g As GlyphBitmap In glyphs
		    bitmapsSize = bitmapsSize + (g.Width * g.Height + 7) \ 8
		    maxAdvance = Max(maxAdvance, g.Advance)
		  Next
		  Dim metaBytes As String = meta.ConvertEncoding(Encodings.UTF8)
		  Dim planesOff As Integer = kHeaderSize
		  Dim rangesOff As Integer = planesOff + planeCount * 8
		  Dim rcpOff As Integer = rangesOff + rangeCount * 3
		  Dim metricsOff As Integer = rcpOff + ((rangeCount + 63) \ 64) * 4
		  Dim glyphsOff As Integer = metricsOff + metricsCount * 5
		  Dim gcpOff As Integer = glyphsOff + n * indexSize
		  Dim bitmapsOff As Integer = gcpOff + ((n + 63) \ 64) * 4
		  Dim metaOff As Integer = bitmapsOff + bitmapsSize
		  Dim fileSize As Integer = metaOff + metaBytes.Bytes

		  Dim m As New MemoryBlock(fileSize)
		  m.LittleEndian = True

		  // Planes, ranges and range checkpoints
		  Dim p As Integer = planesOff
		  plane = -1
		  Dim glyphIndex As Integer = 0
		  For r As Integer = 0 To rangeCount - 1
		    Dim f As Integer = runFirst(r)
		    If Bitwise.ShiftRight(f, 16) <> plane Then
		      plane = Bitwise.ShiftRight(f, 16)
		      m.UInt8Value(p) = plane
		      m.UInt32Value(p + 4) = r
		      p = p + 8
		    End If
		    If r Mod 64 = 0 Then m.UInt32Value(rcpOff + (r \ 64) * 4) = glyphIndex
		    m.UInt16Value(rangesOff + r * 3) = f And &hFFFF
		    m.UInt8Value(rangesOff + r * 3 + 2) = runLast(r) - f
		    glyphIndex = glyphIndex + runLast(r) - f + 1
		  Next

		  // Metrics table
		  For r As Integer = 0 To metricsCount - 1
		    Dim fields() As String = keys(order(r)).Split(",")
		    m.UInt8Value(metricsOff + r * 5) = fields(0).ToInteger
		    m.UInt8Value(metricsOff + r * 5 + 1) = fields(1).ToInteger
		    m.UInt8Value(metricsOff + r * 5 + 2) = fields(2).ToInteger
		    m.Int8Value(metricsOff + r * 5 + 3) = fields(3).ToInteger
		    m.Int8Value(metricsOff + r * 5 + 4) = fields(4).ToInteger
		  Next

		  // Glyph table, glyph checkpoints, bitmaps
		  Dim bitmapPos As Integer = 0
		  For i As Integer = 0 To n - 1
		    Dim g As GlyphBitmap = glyphs(i)
		    If i Mod 64 = 0 Then m.UInt32Value(gcpOff + (i \ 64) * 4) = bitmapPos
		    Dim rank As Integer = metricRank.Value(g.MetricsKey)
		    If indexSize = 1 Then
		      m.UInt8Value(glyphsOff + i) = rank
		    Else
		      m.UInt16Value(glyphsOff + i * 2) = rank
		    End If
		    Dim bits As MemoryBlock = g.PackedBits
		    Dim size As Integer = (g.Width * g.Height + 7) \ 8
		    If size > 0 Then m.StringValue(bitmapsOff + bitmapPos, size) = bits.StringValue(0, size)
		    bitmapPos = bitmapPos + size
		  Next

		  // Metadata, then the header (its CRC covers everything from byte 16)
		  If metaBytes.Bytes > 0 Then m.StringValue(metaOff, metaBytes.Bytes) = metaBytes
		  m.StringValue(0, 4) = "MFPK"
		  m.UInt16Value(4) = kVersion
		  m.UInt16Value(6) = kHeaderSize
		  m.UInt32Value(8) = fileSize
		  m.UInt8Value(16) = 1
		  m.UInt8Value(17) = lineHeight
		  m.UInt8Value(18) = baseline
		  m.UInt8Value(19) = maxAdvance
		  m.UInt8Value(20) = planeCount
		  m.UInt8Value(21) = indexSize
		  m.UInt16Value(22) = metricsCount
		  m.UInt32Value(24) = n
		  m.UInt32Value(28) = rangeCount
		  m.UInt32Value(32) = planesOff
		  m.UInt32Value(36) = rangesOff
		  m.UInt32Value(40) = rcpOff
		  m.UInt32Value(44) = metricsOff
		  m.UInt32Value(48) = glyphsOff
		  m.UInt32Value(52) = gcpOff
		  m.UInt32Value(56) = bitmapsOff
		  m.UInt32Value(60) = bitmapsSize
		  m.UInt32Value(64) = metaOff
		  m.UInt32Value(68) = metaBytes.Bytes
		  m.UInt32Value(12) = CRC32(m, 16, fileSize - 16)
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CRC32(m As MemoryBlock, offset As Integer, length As Integer) As UInt32
		  // CRC-32 (IEEE, as zlib)
		  If mCrcTable.Count = 0 Then
		    For i As Integer = 0 To 255
		      Dim c As UInt32 = i
		      For k As Integer = 1 To 8
		        If (c And 1) <> 0 Then
		          c = &hEDB88320 Xor Bitwise.ShiftRight(c, 1)
		        Else
		          c = Bitwise.ShiftRight(c, 1)
		        End If
		      Next
		      mCrcTable.Add(c)
		    Next
		  End If
		  Dim crc As UInt32 = &hFFFFFFFF
		  For i As Integer = offset To offset + length - 1
		    crc = mCrcTable((crc Xor m.UInt8Value(i)) And &hFF) Xor Bitwise.ShiftRight(crc, 8)
		  Next
		  Return crc Xor &hFFFFFFFF
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCrcTable() As UInt32
	#tag EndProperty


	#tag Constant, Name = kHeaderSize, Type = Double, Dynamic = False, Default = \"80", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kVersion, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


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
