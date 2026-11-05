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
   MaximumWidth    =   900
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
      LockBottom      =   True
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
      Height          =   435
      Index           =   -2147483648
      InitialValue    =   "checkbox	range	block name"
      Italic          =   False
      Left            =   425
      LockBottom      =   True
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      Top             =   531
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   427
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      Top             =   565
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   565
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
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
      Top             =   600
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   455
   End
   Begin DesktopButton btnUploadWindow
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Upload…"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   28
      Index           =   -2147483648
      Italic          =   False
      Left            =   800
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   565
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
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
		  AddFontRow("main.font.unifont", "unifont-18.0.01.otf", _
		  "OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0", "GNU Unifont 18.0.01", 16)
		  AddFontRow("main.font.fusion", "fusion-pixel-12px-proportional-zh_hk.ttf", _
		  "OFL-1.1", "Fusion Pixel Font 12px zh_hk (TakWolf)", 12)
		  pmFont.AddRow(T("main.font.other")) // its tag stays Nil
		  
		  lbSets.ColumnTypeAt(0) = DesktopListBox.CellTypes.CheckBox
		  lbSets.HasHeader = True
		  lbSets.HeaderAt(0) = " "
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
		  lbBlocks.ColumnWidths = "24,110,*"
		  FillBlocks
		  
		  tfPreview.Text = "你好，世界！佢哋喺度食緊飯 日本語のテスト 한국어 Привет"
		  tfPackName.Text = "cjk"
		  UpdateEdits
		  SetStatus("")
		  pbProgress.MaximumValue = 1000
		  pbProgress.Value = 0
		  btnSave.Enabled = False
		  ApplyLanguage
		  If CharSets.SetCount = 0 Then SetStatus("status.resourcesMissing")
		  
		  pmFont.SelectedRowIndex = 0
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddFontRow(key As String, fileName As String, license As String, source As String, sizePx As Integer)
		  // A bundled font (Resources/Fonts), its name the text of key (Strings)
		  pmFont.AddRow(T(key))
		  Dim d As New Dictionary
		  d.Value("key") = key
		  d.Value("file") = fileName
		  d.Value("license") = license
		  d.Value("source") = source
		  d.Value("size") = sizePx
		  pmFont.RowTagAt(pmFont.LastAddedRowIndex) = d
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ApplyLanguage()
		  // The window's texts in the current language (Strings): at opening, and when the user chooses another one
		  Self.Title = T("main.title")
		  lbSets.HeaderAt(1) = T("main.header.set")
		  lbSets.HeaderAt(2) = T("main.header.characters")
		  lbBlocks.HeaderAt(1) = T("main.header.range")
		  lbBlocks.HeaderAt(2) = T("main.header.block")
		  tfBlockFilter.Hint = T("main.hint.blockFilter")
		  tfRanges.Hint = T("main.hint.ranges")
		  tfPackName.Hint = T("main.hint.packName")
		  tfPreview.Hint = T("main.hint.sample")
		  tfEditChar.Hint = T("main.hint.editChar")
		  btnRender.Caption = If(mWorker <> Nil And mWorker.ThreadState <> Thread.ThreadStates.NotRunning, T("main.stop"), T("main.render"))
		  btnSave.Caption = T("main.save")
		  btnEdit.Caption = T("main.edit")
		  btnUploadWindow.Caption = T("main.upload")
		  // The font menu's own rows (the bundled fonts, Other font file...); a font file the user chose keeps its name
		  For row As Integer = 0 To pmFont.RowCount - 1
		    Dim tag As Variant = pmFont.RowTagAt(row)
		    If tag = Nil Then
		      RelabelFontRow(row, T("main.font.other"))
		    ElseIf tag IsA Dictionary Then
		      Dim d As Dictionary = tag
		      If d.HasKey("key") Then RelabelFontRow(row, T(d.Value("key").StringValue))
		    End If
		  Next
		  ShowFontInfo
		  UpdateEdits
		  UpdateSelection
		  ShowStatus
		  cvPreview.Refresh
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
		  mFontError = ""
		  mEdits.RemoveAll // edits belong to the font they were made on
		  UpdateEdits
		  mPacks.RemoveAll
		  mPreviewPack = Nil
		  btnSave.Enabled = False
		  If f = Nil Or Not FontRenderer.RegisterFontFile(f, faces) Then
		    mFontError = If(f <> Nil, f.Name, "?")
		    ShowFontInfo
		    UpdateSelection
		    cvPreview.Refresh
		    Return
		  End If
		  mFontName = faces(0)
		  mFontFile = f
		  mFontLicense = license
		  mFontSource = If(source <> "", source, f.Name)
		  mFaceCount = faces.Count
		  ShowFontInfo
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

	#tag Method, Flags = &h0
		Function PackBytes(pack As RenderedPack, packName As String) As MemoryBlock
		  // A pack as a file: the metadata as mkfontpack.py writes it (name, font, size, licence, source, creation, sets).
		  // Nil when the glyphs don't fit the format
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
		  Return MFPWriter.Build(pack.Glyphs, pack.LineHeight, pack.Baseline, String.FromArray(lines, Chr(10)))
		End Function
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
		Private Sub RelabelFontRow(row As Integer, text As String)
		  // A popup row's text can't be changed in place: the row is removed and added again, with its tag and the
		  // selection, without loading the font again (mRelabeling)
		  Dim tag As Variant = pmFont.RowTagAt(row)
		  Dim selected As Integer = pmFont.SelectedRowIndex
		  mRelabeling = True
		  pmFont.RemoveRowAt(row)
		  pmFont.AddRowAt(row, text)
		  pmFont.RowTagAt(row) = tag
		  pmFont.SelectedRowIndex = selected
		  mRelabeling = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderedPacks() As RenderedPack()
		  // The packs rendered (with the edits), for the upload window
		  Return mPacks
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SavePack(pack As RenderedPack, f As FolderItem)
		  // Writes a pack, named after its file
		  Dim packName As String = f.Name
		  If packName.Right(4) = ".mfp" Then packName = packName.Left(packName.Length - 4)
		  Dim m As MemoryBlock = PackBytes(pack, packName)
		  If m = Nil Then
		    SetStatus("status.notFit", "file", f.Name)
		    Return
		  End If
		  Try
		    Dim b As BinaryStream = BinaryStream.Create(f, True)
		    b.Write(m.StringValue(0, m.Size))
		    b.Close
		    SetStatus("status.saved", "file", f.Name, "glyphs", Format(pack.Glyphs.Count, "#,##0"), "bytes", Format(m.Size, "#,##0"))
		  Catch e As IOException
		    SetStatus("status.cantWrite", "file", f.Name, "error", e.Message)
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
		Private Sub SetStatus(key As String, ParamArray args() As String)
		  // The status line: a text of Strings, kept as its key and values so that it's shown again in another language
		  // (kRenderedStatus: the packs just rendered); "" clears it
		  mStatusKey = key
		  mStatusArgs = args
		  If key = "" Then
		    lblStatus.Text = ""
		  Else
		    ShowStatus
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowFontInfo()
		  // The font in use (its first face, the file, the faces it has), or why it can't be used
		  If mFontError = "?" Then
		    lblFontInfo.Text = T("main.font.unusable")
		  ElseIf mFontError <> "" Then
		    lblFontInfo.Text = T("main.font.unusableFile", "file", mFontError)
		  ElseIf mFontName = "" Or mFontFile = Nil Then
		    lblFontInfo.Text = ""
		  ElseIf mFaceCount > 1 Then
		    lblFontInfo.Text = T("main.font.infoFaces", "face", mFontName, "file", mFontFile.Name, "count", Str(mFaceCount))
		  Else
		    lblFontInfo.Text = T("main.font.info", "face", mFontName, "file", mFontFile.Name)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowStatus()
		  // The status line in the current language
		  If mStatusKey = "" Then
		    Return // empty, or progress (the render's next update replaces it)
		  ElseIf mStatusKey = kRenderedStatus Then
		    Dim parts() As String
		    For Each p As RenderedPack In mPacks
		      If p.Missing > 0 Then
		        parts.Add(T("status.renderedMissing", "size", Str(p.SizePx), "glyphs", Format(p.Glyphs.Count, "#,##0"), _
		        "missing", Format(p.Missing, "#,##0"), "lineHeight", Str(p.LineHeight)))
		      Else
		        parts.Add(T("status.rendered", "size", Str(p.SizePx), "glyphs", Format(p.Glyphs.Count, "#,##0"), _
		        "lineHeight", Str(p.LineHeight)))
		      End If
		    Next
		    lblStatus.Text = String.FromArray(parts, "; ")
		  Else
		    lblStatus.Text = TA(mStatusKey, mStatusArgs)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateEdits()
		  If mEdits.KeyCount = 0 Then
		    lblEdits.Text = T("main.edits.none")
		  ElseIf mEdits.KeyCount = 1 Then
		    lblEdits.Text = T("main.edits.one")
		  Else
		    lblEdits.Text = T("main.edits.many", "count", Str(mEdits.KeyCount))
		  End If
		End Sub
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
		  lblSelection.Text = T(If(ok, "main.selection", "main.selection.rangeError"), "count", Format(cps.Count, "#,##0"), _
		  "inFont", Format(inFont, "#,##0"))
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
		        "status" : T("status.progress", "size", Str(sizePx), "done", Format(done, "#,##0"), "total", Format(total, "#,##0"))))
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
		      SetStatus("")
		      lblStatus.Text = d.Value("status").StringValue // the next update replaces it
		    End If
		    If d.HasKey("stopped") Then
		      btnRender.Caption = T("main.render")
		      pbProgress.Value = 0
		      SetStatus("status.stopped")
		    End If
		    If d.HasKey("done") Then
		      btnRender.Caption = T("main.render")
		      pbProgress.Value = 1000
		      mPacks = mNewPacks
		      For Each p As RenderedPack In mPacks
		        // The edited glyphs of this size replace the new rendering
		        For Each k As Variant In mEdits.Keys
		          Dim g As GlyphBitmap = mEdits.Value(k)
		          If k.StringValue.Left(3) = Str(p.SizePx) + ":" Then p.Replace(g.Clone)
		        Next
		        mPreviewPack = p
		      Next
		      SetStatus(kRenderedStatus)
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
		Private mFaceCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFontError As String
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
		Private mRelabeling As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStatusArgs() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStatusKey As String
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


	#tag Constant, Name = kRenderedStatus, Type = String, Dynamic = False, Default = \"*rendered", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events pmFont
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  If mRelabeling Then Return
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
		  ft.Name = T("main.fileType.fonts")
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
		    SetStatus("status.chooseFont")
		    Return
		  End If
		  Dim sizes() As Integer
		  If chk12.Value Then sizes.Add(12)
		  If chk16.Value Then sizes.Add(16)
		  If sizes.Count = 0 Then
		    SetStatus("status.chooseSize")
		    Return
		  End If
		  Dim ok As Boolean
		  Dim cps() As Integer = SelectedCodePoints(ok)
		  If Not ok Then
		    SetStatus("status.rangesError")
		    Return
		  End If
		  If cps.Count = 0 Then
		    SetStatus("status.selectChars")
		    Return
		  End If
		  mWorkCps = cps
		  mWorkSizes = sizes
		  Dim fresh() As RenderedPack
		  mNewPacks = fresh
		  mStop = False
		  btnSave.Enabled = False
		  btnRender.Caption = T("main.stop")
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
		  mfp.Name = T("main.fileType.pack")
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
		    g.DrawText(T("main.preview.empty"), 8, 20)
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
		    SetStatus("status.renderFirstEdit")
		    Return
		  End If
		  Dim cp As Integer = ParseEditChar(tfEditChar.Text)
		  If cp < 0 Then
		    SetStatus("status.typeChar")
		    Return
		  End If
		  // With two sizes rendered: which one
		  Dim pack As RenderedPack = mPacks(0)
		  If mPacks.Count > 1 Then
		    Dim d As New MessageDialog
		    d.Message = T("main.editSize", "char", Chr(cp))
		    d.ActionButton.Caption = Str(mPacks(0).SizePx) + " px"
		    d.AlternateActionButton.Visible = True
		    d.AlternateActionButton.Caption = Str(mPacks(1).SizePx) + " px"
		    d.CancelButton.Visible = True
		    d.CancelButton.Caption = T("button.cancel")
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
#tag Events btnUploadWindow
	#tag Event
		Sub Pressed()
		  If mPacks.Count = 0 Then
		    SetStatus("status.renderFirstUpload")
		  End If
		  Dim w As New UploadWindow
		  w.ShowFor(Self)
		End Sub
	#tag EndEvent
#tag EndEvents
