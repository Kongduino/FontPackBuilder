#tag DesktopWindow
Begin DesktopWindow MainWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   640
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   2013911039
   MenuBarVisible  =   False
   MinimumHeight   =   640
   MinimumWidth    =   900
   Resizeable      =   True
   Title           =   "FontPackBuilder"
   Type            =   0
   Visible         =   True
   Width           =   900
   Begin DesktopPopupMenu pmFont
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   -1
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   248
   End
   Begin DesktopLabel lblFontInfo
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   280
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   600
   End
   Begin DesktopCheckBox chk12
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "12 px"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   100
   End
   Begin DesktopCheckBox chk16
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "16 px"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   132
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   100
   End
   Begin DesktopListBox lbSets
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   ",50%"
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   200
      Index           =   -2147483648
      InitialValue    =   "checkbox	name	count"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   84
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   393
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopListBox lbBlocks
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   "80"
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   390
      Index           =   -2147483648
      InitialValue    =   "checkbox	range	block name"
      Italic          =   False
      Left            =   425
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   84
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   455
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopTextField tfBlockFilter
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Filter blocks"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   296
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   393
   End
   Begin DesktopTextField tfRanges
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Ranges (hex): 1000-109F, 4E00"
      Index           =   -2147483648
      Italic          =   False
      Left            =   425
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   486
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   455
   End
   Begin DesktopLabel lblSelection
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "0 characters"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   330
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   393
   End
   Begin DesktopTextField tfPackName
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Pack name"
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   362
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   393
   End
   Begin DesktopButton btnRender
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Render"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   600
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btnSave
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save Pack…"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   112
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   600
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   112
   End
   Begin DesktopProgressBar pbProgress
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   20
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   100
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   600
      Transparent     =   False
      Value           =   50.0
      Visible         =   True
      Width           =   169
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopLabel lblStatus
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "status"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   568
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   860
   End
   Begin DesktopTextField tfPreview
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Sample Text"
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   396
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   393
   End
   Begin DesktopCanvas cvPreview
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      Enabled         =   True
      Height          =   126
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   430
      Transparent     =   False
      Visible         =   True
      Width           =   393
   End
   Begin DesktopTextField tfEditChar
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   26
      Hint            =   "Character or U+hex"
      Index           =   -2147483648
      Italic          =   False
      Left            =   425
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   144
   End
   Begin DesktopButton btnEdit
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Edit…"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   581
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   520
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel lblEdits
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   425
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "No edited glyphs"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   555
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   455
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  // FontPackBuilder: builds Meshtastic Font Packs (.mfp, format version 2) from a font: choose the characters by
		  // set, Unicode block or range, render them at 12 and/or 16 px, save one pack per size
		  mCheckedBlocks = New Dictionary
		  mEdits = New Dictionary
		  
		  pmFont.RemoveAllRows
		  AddFontRow("GNU Unifont, 16 px (bundled)", "unifont-18.0.01.otf", _
		  "OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0", "GNU Unifont 18.0.01", 16)
		  AddFontRow("Fusion Pixel, 12 px, Hong Kong forms (bundled)", "fusion-pixel-12px-proportional-zh_hk.ttf", _
		  "OFL-1.1", "Fusion Pixel Font 12px zh_hk (TakWolf)", 12)
		  pmFont.AddRow(kOtherFont)
		  
		  lbSets.ColumnTypeAt(0) = DesktopListBox.CellTypes.CheckBox
		  lbSets.HasHeader = True
		  lbSets.HeaderAt(0) = " "
		  lbSets.HeaderAt(1) = "Set"
		  lbSets.HeaderAt(2) = "Characters"
		  lbSets.ColumnWidths = "24,*,80"
		  lbSets.ColumnAlignmentAt(2) = DesktopListBox.Alignments.Right
		  lbSets.RemoveAllRows
		  For i As Integer = 0 To CharSets.SetCount - 1
		    lbSets.AddRow("", CharSets.SetDescription(i), Format(CharSets.SetSize(i), "#,##0"))
		    lbSets.RowTagAt(lbSets.LastAddedRowIndex) = i
		  Next
		  
		  lbBlocks.ColumnTypeAt(0) = DesktopListBox.CellTypes.CheckBox
		  lbBlocks.HasHeader = True
		  lbBlocks.HeaderAt(0) = " "
		  lbBlocks.HeaderAt(1) = "Range"
		  lbBlocks.HeaderAt(2) = "Unicode block"
		  lbBlocks.ColumnWidths = "24,110,*"
		  FillBlocks
		  
		  tfPreview.Text = "你好，世界！佢哋喺度食緊飯 日本語のテスト 한국어 Привет"
		  tfPackName.Text = "cjk"
		  UpdateEdits
		  lblStatus.Text = ""
		  pbProgress.MaximumValue = 1000
		  pbProgress.Value = 0
		  btnSave.Enabled = False
		  If CharSets.SetCount = 0 Then lblStatus.Text = "Resources missing: CharSets.txt and Blocks.txt not found"
		  
		  pmFont.SelectedRowIndex = 0
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddFontRow(caption As String, fileName As String, license As String, source As String, sizePx As Integer)
		  // A bundled font (Resources/Fonts)
		  pmFont.AddRow(caption)
		  Dim d As New Dictionary
		  d.Value("file") = fileName
		  d.Value("license") = license
		  d.Value("source") = source
		  d.Value("size") = sizePx
		  pmFont.RowTagAt(pmFont.LastAddedRowIndex) = d
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FillBlocks()
		  // The Unicode blocks matching the filter (name or range), with their check boxes as set
		  Dim filter As String = tfBlockFilter.Text.Trim
		  lbBlocks.RemoveAllRows
		  For i As Integer = 0 To CharSets.BlockCount - 1
		    Dim range As String = Hex4(CharSets.BlockFirst(i)) + "–" + Hex4(CharSets.BlockLast(i))
		    Dim name As String = CharSets.BlockName(i)
		    If filter <> "" And name.IndexOf(filter) < 0 And range.IndexOf(filter) < 0 Then Continue
		    lbBlocks.AddRow("", range, name)
		    lbBlocks.RowTagAt(lbBlocks.LastAddedRowIndex) = i
		    lbBlocks.CellCheckBoxValueAt(lbBlocks.LastAddedRowIndex, 0) = mCheckedBlocks.HasKey(i)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GlyphEdited(sizePx As Integer, g As GlyphBitmap)
		  // The glyph editor's result: kept (re-applied after each render) and put in the pack of that size
		  mEdits.Value(Str(sizePx) + ":" + Str(g.CodePoint)) = g
		  For Each p As RenderedPack In mPacks
		    If p.SizePx = sizePx Then p.Replace(g.Clone)
		  Next
		  UpdateEdits
		  cvPreview.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseEditChar(text As String) As Integer
		  // The code point to edit: "U+55BA", "55BA" (4 to 6 hex digits), or a character. -1 when empty
		  Dim t As String = text.Trim
		  If t = "" Then Return -1
		  Dim u As String = t.Uppercase
		  If u.Left(2) = "U+" Then u = u.Middle(2)
		  Dim allowed As String = "0123456789ABCDEF"
		  Dim isHex As Boolean = u.Length >= 4 And u.Length <= 6
		  If isHex Then
		    For Each c As String In u.Characters
		      If allowed.IndexOf(c) < 0 Then
		        isHex = False
		        Exit
		      End If
		    Next
		  End If
		  If isHex Then Return Integer.FromHex(u)
		  Return t.Left(1).Asc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateEdits()
		  If mEdits.KeyCount = 0 Then
		    lblEdits.Text = "No edited glyphs"
		  Else
		    lblEdits.Text = Str(mEdits.KeyCount) + If(mEdits.KeyCount = 1, " edited glyph", " edited glyphs")
		  End If
		End Sub
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
		Private Sub LoadFont(f As FolderItem, license As String, source As String, sizePx As Integer)
		  // Makes the font usable (CoreText) and takes its first face
		  Dim faces() As String
		  mFontName = ""
		  mEdits.RemoveAll // edits belong to the font they were made on
		  UpdateEdits
		  mPacks.RemoveAll
		  mPreviewPack = Nil
		  btnSave.Enabled = False
		  If f = Nil Or Not FontRenderer.RegisterFontFile(f, faces) Then
		    lblFontInfo.Text = "This font can't be used" + If(f <> Nil, ": " + f.Name, "")
		    UpdateSelection
		    cvPreview.Refresh
		    Return
		  End If
		  mFontName = faces(0)
		  mFontFile = f
		  mFontLicense = license
		  mFontSource = If(source <> "", source, f.Name)
		  lblFontInfo.Text = faces(0) + "  (" + f.Name + If(faces.Count > 1, ", " + Str(faces.Count) + " faces: the first is used", "") + ")"
		  If sizePx = 12 Then
		    chk12.Value = True
		    chk16.Value = False
		  ElseIf sizePx = 16 Then
		    chk12.Value = False
		    chk16.Value = True
		  End If
		  UpdateSelection
		  cvPreview.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SavePack(pack As RenderedPack, f As FolderItem)
		  // Writes a pack: the metadata as mkfontpack.py writes it (name, font, size, licence, source, creation, sets)
		  Dim packName As String = f.Name
		  If packName.Right(4) = ".mfp" Then packName = packName.Left(packName.Length - 4)
		  Dim sets() As String
		  For row As Integer = 0 To lbSets.RowCount - 1
		    If lbSets.CellCheckBoxValueAt(row, 0) Then sets.Add(CharSets.SetName(lbSets.RowTagAt(row)))
		  Next
		  Dim now As DateTime = DateTime.Now(New TimeZone(0))
		  Dim created As String = Str(now.Year) + "-" + Format(now.Month, "00") + "-" + Format(now.Day, "00") + "T" + _
		  Format(now.Hour, "00") + ":" + Format(now.Minute, "00") + ":" + Format(now.Second, "00") + "Z"
		  Dim lines() As String
		  lines.Add("name=" + packName)
		  lines.Add("font=" + pack.FontFile)
		  lines.Add("size=" + Str(pack.SizePx))
		  lines.Add("license=" + pack.License)
		  lines.Add("source=" + pack.Source)
		  lines.Add("created=" + created)
		  If sets.Count > 0 Then lines.Add("sets=" + String.FromArray(sets, ","))
		  
		  Dim m As MemoryBlock = MFPWriter.Build(pack.Glyphs, pack.LineHeight, pack.Baseline, String.FromArray(lines, Chr(10)))
		  If m = Nil Then
		    lblStatus.Text = f.Name + ": the glyphs don't fit the pack format"
		    Return
		  End If
		  Try
		    Dim b As BinaryStream = BinaryStream.Create(f, True)
		    b.Write(m.StringValue(0, m.Size))
		    b.Close
		    lblStatus.Text = "Saved " + f.Name + ": " + Format(pack.Glyphs.Count, "#,##0") + " glyphs, " + Format(m.Size, "#,##0") + " bytes"
		  Catch e As IOException
		    lblStatus.Text = "Can't write " + f.Name + ": " + e.Message
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SelectedCodePoints(ByRef rangesOK As Boolean) As Integer()
		  // The selected characters: checked sets and blocks, and the typed ranges; sorted, without duplicates, and
		  // without the control characters, surrogates and non-characters
		  Dim cps() As Integer
		  For row As Integer = 0 To lbSets.RowCount - 1
		    If lbSets.CellCheckBoxValueAt(row, 0) Then Call CharSets.ParseRanges(CharSets.SetRanges(lbSets.RowTagAt(row)), cps)
		  Next
		  For Each k As Variant In mCheckedBlocks.Keys
		    Dim i As Integer = k
		    For cp As Integer = CharSets.BlockFirst(i) To CharSets.BlockLast(i)
		      cps.Add(cp)
		    Next
		  Next
		  rangesOK = CharSets.ParseRanges(tfRanges.Text, cps)
		  CharSets.SortUnique(cps)
		  Dim out() As Integer
		  For Each cp As Integer In cps
		    If cp < &h20 Or (cp >= &h7F And cp < &hA0) Or (cp >= &hD800 And cp <= &hDFFF) Or (cp >= &hFDD0 And cp <= &hFDEF) _
		    Or (cp And &hFFFE) = &hFFFE Then Continue
		    out.Add(cp)
		  Next
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateSelection()
		  // The count of selected characters, and how many the font has
		  Dim ok As Boolean
		  Dim cps() As Integer = SelectedCodePoints(ok)
		  Dim inFont As Integer = 0
		  If mFontName <> "" Then
		    For Each cp As Integer In cps
		      If FontRenderer.HasGlyph(mFontName, cp) Then inFont = inFont + 1
		    Next
		  End If
		  lblSelection.Text = Format(cps.Count, "#,##0") + " characters selected, " + Format(inFont, "#,##0") + " in the font" + _
		  If(ok, "", "  (the ranges have an error)")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WorkerRun(sender As Thread)
		  // Renders the selected characters at each size (in the background)
		  Dim total As Integer = Max(1, mWorkCps.Count * mWorkSizes.Count)
		  Dim done As Integer = 0
		  Dim lastUpdate As Double = 0
		  For Each sizePx As Integer In mWorkSizes
		    Dim pack As New RenderedPack(sizePx)
		    pack.FontName = mFontName
		    pack.FontFile = mFontFile.Name
		    pack.License = mFontLicense
		    pack.Source = mFontSource
		    
		    // The line box comes from reference characters (as mkfontpack.py): their ink, else every glyph's
		    Dim top As Integer = 100000
		    Dim bottom As Integer = -100000
		    // H g j y, then 中 あ 한
		    For Each cp As Integer In Array(&h48, &h67, &h6A, &h79, &h4E2D, &h3042, &hD55C)
		      If Not FontRenderer.HasGlyph(mFontName, cp) Then Continue
		      Dim g As GlyphBitmap = FontRenderer.Render(mFontName, sizePx, cp)
		      If g.Height = 0 Then Continue
		      top = Min(top, g.YOffset)
		      bottom = Max(bottom, g.YOffset + g.Height)
		    Next
		    
		    For Each cp As Integer In mWorkCps
		      If mStop Then
		        sender.AddUserInterfaceUpdate(New Dictionary("stopped" : True))
		        Return
		      End If
		      If FontRenderer.HasGlyph(mFontName, cp) Then
		        pack.Add(FontRenderer.Render(mFontName, sizePx, cp))
		      Else
		        pack.Missing = pack.Missing + 1
		      End If
		      done = done + 1
		      If System.Microseconds - lastUpdate > 200000 Then
		        lastUpdate = System.Microseconds
		        sender.AddUserInterfaceUpdate(New Dictionary("progress" : done / total, _
		        "status" : Str(sizePx) + " px: " + Format(done, "#,##0") + " of " + Format(total, "#,##0")))
		      End If
		    Next
		    
		    If top > bottom Then
		      For Each g As GlyphBitmap In pack.Glyphs
		        If g.Height = 0 Then Continue
		        top = Min(top, g.YOffset)
		        bottom = Max(bottom, g.YOffset + g.Height)
		      Next
		    End If
		    If top > bottom Then
		      top = 0
		      bottom = sizePx
		    End If
		    For Each g As GlyphBitmap In pack.Glyphs
		      If g.Height > 0 Then g.YOffset = g.YOffset - top
		    Next
		    pack.LineHeight = bottom - top + 1 // one blank pixel between lines
		    pack.Baseline = FontRenderer.Ascent(mFontName, sizePx) - top
		    mNewPacks.Add(pack)
		  Next
		  sender.AddUserInterfaceUpdate(New Dictionary("done" : True))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WorkerUpdate(sender As Thread, data() As Dictionary)
		  #Pragma Unused sender
		  For Each d As Dictionary In data
		    If d.HasKey("progress") Then
		      pbProgress.Value = d.Value("progress").DoubleValue * 1000
		      lblStatus.Text = d.Value("status").StringValue
		    End If
		    If d.HasKey("stopped") Then
		      btnRender.Caption = "Render"
		      pbProgress.Value = 0
		      lblStatus.Text = "Stopped"
		    End If
		    If d.HasKey("done") Then
		      btnRender.Caption = "Render"
		      pbProgress.Value = 1000
		      mPacks = mNewPacks
		      Dim parts() As String
		      For Each p As RenderedPack In mPacks
		        // The edited glyphs of this size replace the new rendering
		        For Each k As Variant In mEdits.Keys
		          Dim g As GlyphBitmap = mEdits.Value(k)
		          If k.StringValue.Left(3) = Str(p.SizePx) + ":" Then p.Replace(g.Clone)
		        Next
		        parts.Add(Str(p.SizePx) + " px: " + Format(p.Glyphs.Count, "#,##0") + " glyphs" + _
		        If(p.Missing > 0, " (" + Format(p.Missing, "#,##0") + " not in the font)", "") + ", line height " + Str(p.LineHeight))
		        mPreviewPack = p
		      Next
		      lblStatus.Text = String.FromArray(parts, "; ")
		      btnSave.Enabled = mPacks.Count > 0
		      cvPreview.Refresh
		    End If
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCheckedBlocks As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEdits As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontLicense As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontSource As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNewPacks() As RenderedPack
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPacks() As RenderedPack
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviewPack As RenderedPack
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviousFontRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStop As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorkCps() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorker As Thread
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorkSizes() As Integer
	#tag EndProperty


	#tag Constant, Name = kOtherFont, Type = String, Dynamic = False, Default = \"Other font file...", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events pmFont
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  Dim row As Integer = pmFont.SelectedRowIndex
		  If row < 0 Then Return
		  Dim tag As Variant = pmFont.RowTagAt(row)
		  If tag IsA Dictionary Then
		    Dim d As Dictionary = tag
		    mPreviousFontRow = row
		    If d.HasKey("item") Then
		      LoadFont(d.Value("item"), d.Value("license"), d.Value("source"), d.Value("size"))
		    Else
		      Dim fonts As FolderItem = CharSets.ResourceFile("Fonts")
		      LoadFont(If(fonts <> Nil, fonts.Child(d.Value("file").StringValue), Nil), d.Value("license"), d.Value("source"), d.Value("size"))
		    End If
		    Return
		  End If
		  
		  // Other font file...: added above it, then selected
		  Dim ft As New FileType
		  ft.Name = "Fonts"
		  ft.Extensions = "ttf;otf;ttc;otc"
		  Dim f As FolderItem = FolderItem.ShowOpenFileDialog(ft)
		  If f = Nil Then
		    pmFont.SelectedRowIndex = mPreviousFontRow
		    Return
		  End If
		  Dim d As New Dictionary
		  d.Value("item") = f
		  d.Value("license") = ""
		  d.Value("source") = f.Name
		  d.Value("size") = 0
		  pmFont.AddRowAt(pmFont.RowCount - 1, f.Name)
		  pmFont.RowTagAt(pmFont.RowCount - 2) = d
		  pmFont.SelectedRowIndex = pmFont.RowCount - 2
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbSets
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  #Pragma Unused row
		  If column = 0 Then UpdateSelection
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbBlocks
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  If column <> 0 Then Return
		  Dim i As Integer = lbBlocks.RowTagAt(row)
		  If lbBlocks.CellCheckBoxValueAt(row, 0) Then
		    mCheckedBlocks.Value(i) = True
		  ElseIf mCheckedBlocks.HasKey(i) Then
		    mCheckedBlocks.Remove(i)
		  End If
		  UpdateSelection
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfBlockFilter
	#tag Event
		Sub TextChanged()
		  FillBlocks
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfRanges
	#tag Event
		Sub TextChanged()
		  UpdateSelection
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRender
	#tag Event
		Sub Pressed()
		  If mWorker <> Nil And mWorker.ThreadState <> Thread.ThreadStates.NotRunning Then
		    mStop = True
		    Return
		  End If
		  If mFontName = "" Then
		    lblStatus.Text = "Choose a font first"
		    Return
		  End If
		  Dim sizes() As Integer
		  If chk12.Value Then sizes.Add(12)
		  If chk16.Value Then sizes.Add(16)
		  If sizes.Count = 0 Then
		    lblStatus.Text = "Choose a size: 12 px, 16 px or both"
		    Return
		  End If
		  Dim ok As Boolean
		  Dim cps() As Integer = SelectedCodePoints(ok)
		  If Not ok Then
		    lblStatus.Text = "The ranges have an error: hex values or ranges, e.g. 1000-109F, 4E00"
		    Return
		  End If
		  If cps.Count = 0 Then
		    lblStatus.Text = "Select some characters: a set, a block or a range"
		    Return
		  End If
		  mWorkCps = cps
		  mWorkSizes = sizes
		  Dim fresh() As RenderedPack
		  mNewPacks = fresh
		  mStop = False
		  btnSave.Enabled = False
		  btnRender.Caption = "Stop"
		  pbProgress.Value = 0
		  mWorker = New Thread
		  AddHandler mWorker.Run, WeakAddressOf WorkerRun
		  AddHandler mWorker.UserInterfaceUpdate, WeakAddressOf WorkerUpdate
		  mWorker.Start
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSave
	#tag Event
		Sub Pressed()
		  If mPacks.Count = 0 Then Return
		  Dim name As String = tfPackName.Text.Trim
		  If name = "" Then name = "fontpack"
		  Dim mfp As New FileType
		  mfp.Name = "Meshtastic Font Pack"
		  mfp.Extensions = "mfp"
		  If mPacks.Count = 1 Then
		    Dim f As FolderItem = FolderItem.ShowSaveFileDialog(mfp, name + Str(mPacks(0).SizePx) + ".mfp")
		    If f <> Nil Then SavePack(mPacks(0), f)
		  Else
		    // One pack per size: name12.mfp, name16.mfp in the chosen folder
		    Dim dir As FolderItem = FolderItem.ShowSelectFolderDialog
		    If dir = Nil Then Return
		    For Each p As RenderedPack In mPacks
		      SavePack(p, dir.Child(name + Str(p.SizePx) + ".mfp"))
		    Next
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfPreview
	#tag Event
		Sub TextChanged()
		  cvPreview.Refresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvPreview
	#tag Event
		Sub Paint(g As Graphics, areas() As Rect)
		  #Pragma Unused areas
		  // The sample text with the rendered glyphs, magnified 2x; a box for a character the pack doesn't have
		  g.DrawingColor = &cFFFFFF
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  If mPreviewPack = Nil Then
		    g.DrawingColor = &c808080
		    g.DrawText("Render to see a preview", 8, 20)
		    Return
		  End If
		  Const scale = 2
		  Dim lh As Integer = mPreviewPack.LineHeight
		  Dim x As Integer = 4
		  Dim y As Integer = 4
		  For Each ch As String In tfPreview.Text.Characters
		    Dim cp As Integer = ch.Asc
		    Dim gl As GlyphBitmap = mPreviewPack.Glyph(cp)
		    Dim adv As Integer = If(gl <> Nil, gl.Advance, lh * 2 \ 3)
		    If x + adv * scale > g.Width - 4 Then
		      x = 4
		      y = y + lh * scale
		    End If
		    If y + lh * scale > g.Height Then Exit
		    If gl <> Nil Then
		      g.DrawingColor = &c000000
		      For row As Integer = 0 To gl.Height - 1
		        For col As Integer = 0 To gl.Width - 1
		          If gl.Pixel(col, row) Then g.FillRectangle(x + (gl.XOffset + col) * scale, y + (gl.YOffset + row) * scale, scale, scale)
		        Next
		      Next
		    ElseIf cp <> 32 Then
		      g.DrawingColor = &cA0A0A0
		      g.DrawRectangle(x + scale, y + (lh \ 4) * scale, (adv - 2) * scale, (lh - lh \ 4 - 2) * scale)
		    End If
		    x = x + adv * scale
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEdit
	#tag Event
		Sub Pressed()
		  If mPacks.Count = 0 Then
		    lblStatus.Text = "Render first, then edit"
		    Return
		  End If
		  Dim cp As Integer = ParseEditChar(tfEditChar.Text)
		  If cp < 0 Then
		    lblStatus.Text = "Type the character to edit, or its code point (U+55BA)"
		    Return
		  End If
		  // With two sizes rendered: which one
		  Dim pack As RenderedPack = mPacks(0)
		  If mPacks.Count > 1 Then
		    Dim d As New MessageDialog
		    d.Message = "Edit " + Chr(cp) + " at which size?"
		    d.ActionButton.Caption = Str(mPacks(0).SizePx) + " px"
		    d.AlternateActionButton.Visible = True
		    d.AlternateActionButton.Caption = Str(mPacks(1).SizePx) + " px"
		    d.CancelButton.Visible = True
		    Dim b As MessageDialogButton = d.ShowModal
		    If b = d.CancelButton Then Return
		    If b = d.AlternateActionButton Then pack = mPacks(1)
		  End If
		  // The glyph as it is now; a blank one when neither the font nor an edit has it
		  Dim current As GlyphBitmap = pack.Glyph(cp)
		  If current = Nil Then
		    current = New GlyphBitmap(0, 0)
		    current.CodePoint = cp
		    current.Advance = pack.SizePx
		  Else
		    current = current.Clone
		  End If
		  Dim w As New GlyphEditor
		  w.EditGlyph(Self, current, pack.Original(cp), pack.SizePx, pack.LineHeight, pack.Baseline)
		End Sub
	#tag EndEvent
#tag EndEvents
