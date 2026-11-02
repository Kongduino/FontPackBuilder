#tag DesktopWindow
Begin DesktopWindow UploadWindow
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
   Height          =   420
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   520
   MenuBar         =   ""
   MenuBarVisible  =   False
   MinimumHeight   =   420
   MinimumWidth    =   520
   Resizeable      =   True
   Title           =   "Upload Window"
   Type            =   0
   Visible         =   False
   Width           =   520
   Begin DesktopPopupMenu pmPort
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
      Width           =   181
   End
   Begin DesktopTextField tfHost
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
      Hint            =   "IP address, e.g. 10.0.1.2"
      Index           =   -2147483648
      Italic          =   False
      Left            =   213
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   287
   End
   Begin DesktopButton btnConnect
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Connect"
      Default         =   False
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
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopLabel lblDevice
      AllowAutoDeactivate=   True
      Bold            =   False
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
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   52
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   388
   End
   Begin DesktopPopupMenu pmPack
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   84
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   181
   End
   Begin DesktopTextField tfTargetName
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
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   213
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   84
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   287
   End
   Begin DesktopButton btnUpload
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Upload"
      Default         =   False
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
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   116
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopProgressBar pbUpload
      Active          =   False
      AllowAutoDeactivate=   True
      AllowTabStop    =   True
      Enabled         =   True
      Height          =   20
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   112
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumValue    =   100
      PanelIndex      =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   116
      Transparent     =   False
      Value           =   50.0
      Visible         =   True
      Width           =   388
      _mIndex         =   0
      _mInitialParent =   ""
      _mName          =   ""
      _mPanelIndex    =   0
   End
   Begin DesktopTextArea taLog
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   220
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   148
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   1
      ValidationMask  =   ""
      Visible         =   True
      Width           =   480
   End
   Begin DesktopButton btnClose
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Close"
      Default         =   False
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
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin DesktopButton btnRemoveAll
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Remove All Packs…"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   352
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
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   148
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Closing()
		  If mUploader <> Nil And mUploader.IsBusy Then mUploader.Cancel
		  If mLink <> Nil Then mLink.Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // The serial ports (USB devices first), then the network
		  pmPort.RemoveAllRows
		  Dim preferred As Integer = -1
		  For i As Integer = 0 To SerialDevice.Count - 1
		    Dim d As SerialDevice = SerialDevice.At(i)
		    pmPort.AddRow(d.Name)
		    pmPort.RowTagAt(pmPort.LastAddedRowIndex) = d
		    If preferred < 0 And (d.Name.IndexOf("usbmodem") >= 0 Or d.Name.IndexOf("usbserial") >= 0) Then preferred = pmPort.LastAddedRowIndex
		  Next
		  pmPort.AddRow(T("upload.network")) // its tag stays Nil
		  pmPort.SelectedRowIndex = If(preferred >= 0, preferred, 0)
		  pbUpload.MaximumValue = 1000
		  pbUpload.Value = 0
		  taLog.ReadOnly = True
		  ApplyLanguage
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ApplyLanguage()
		  // The window's texts in the current language (Strings): at opening, and when the user chooses another one
		  Self.Title = T("upload.title")
		  tfHost.Hint = T("upload.hint.host")
		  btnClose.Caption = T("upload.close")
		  btnRemoveAll.Caption = T("upload.removeAll")
		  // The menus' own rows: Network (TCP)..., the rendered packs, Pack file...; a port or a file keeps its name
		  For row As Integer = 0 To pmPort.RowCount - 1
		    If pmPort.RowTagAt(row) = Nil Then Relabel(pmPort, row, T("upload.network"))
		  Next
		  For row As Integer = 0 To pmPack.RowCount - 1
		    Dim tag As Variant = pmPack.RowTagAt(row)
		    If tag = Nil Then
		      Relabel(pmPack, row, T("upload.packFile"))
		    ElseIf tag IsA RenderedPack Then
		      Dim rp As RenderedPack = tag
		      Relabel(pmPack, row, RenderedPackText(rp))
		    End If
		  Next
		  UpdateControls
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkClosed(sender As MeshDeviceLink, reason As String)
		  #Pragma Unused sender
		  Log(If(reason <> "", T("upload.log.disconnectedReason", "reason", reason), T("upload.log.disconnected")))
		  If mUploader <> Nil And mUploader.IsBusy Then mUploader.Cancel
		  mConnected = False
		  lblDevice.Text = ""
		  UpdateControls
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkConfigComplete(sender As MeshDeviceLink)
		  lblDevice.Text = sender.LongName + "  (" + sender.MyNodeID + ")"
		  Log(T("upload.log.connected", "device", lblDevice.Text))
		  mConnected = True
		  Dim packs() As String = PackFiles
		  If packs.Count > 0 Then Log(T("upload.log.packsOnDevice", "packs", String.FromArray(packs, ", ")))
		  UpdateControls
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkLogLine(sender As MeshDeviceLink, text As String)
		  #Pragma Unused sender
		  // The device's own messages about packs (when its API log is on), and the link's
		  If text.IndexOf("FontPacks") >= 0 Or text.IndexOf("abandon") >= 0 Or text.IndexOf("Opening") = 0 Or _
		  text.IndexOf("Connecting") = 0 Then Log(text.Trim)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Log(text As String)
		  Dim now As DateTime = DateTime.Now
		  Dim stamp As String = Format(now.Hour, "00") + ":" + Format(now.Minute, "00") + ":" + Format(now.Second, "00")
		  taLog.AddText(stamp + "  " + text + EndOfLine)
		  taLog.VerticalScrollPosition = 100000
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PackFiles() As String()
		  // The packs in the device's filesystem, from the file list it sent when the link connected: "cjk16.mfp (529,202
		  // bytes)"
		  Dim packs() As String
		  If mLink = Nil Then Return packs
		  For i As Integer = 0 To mLink.FileCount - 1
		    Dim path As String = mLink.FileNameAt(i)
		    If path.IndexOf("fonts/") >= 0 And path.Right(4) = ".mfp" Then
		      Dim name As String = path.NthField("/", path.CountFields("/"))
		      packs.Add(T("upload.packSize", "name", name, "bytes", Format(mLink.FileSizeAt(i), "#,##0")))
		    End If
		  Next
		  Return packs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Relabel(pm As DesktopPopupMenu, row As Integer, text As String)
		  // A popup row's text can't be changed in place: the row is removed and added again, with its tag and the
		  // selection, without the selection's side effects (mRelabeling)
		  Dim tag As Variant = pm.RowTagAt(row)
		  Dim selected As Integer = pm.SelectedRowIndex
		  mRelabeling = True
		  pm.RemoveRowAt(row)
		  pm.AddRowAt(row, text)
		  pm.RowTagAt(row) = tag
		  pm.SelectedRowIndex = selected
		  mRelabeling = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RenderedPackText(p As RenderedPack) As String
		  Return T("upload.renderedPack", "size", Str(p.SizePx), "glyphs", Format(p.Glyphs.Count, "#,##0"))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RetryAction(sender As Timer)
		  #Pragma Unused sender
		  // The old pack is removed: the new one again
		  If Not mConnected Then Return
		  Log(T("upload.log.sendingAgain", "target", mLastTarget))
		  mRetriedAfterRemove = True
		  mUploader.Start(mLastData, mLastTarget)
		  UpdateControls
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowFor(owner As MainWindow)
		  // Opens the window on the main window's rendered packs
		  mOwner = owner
		  pmPack.RemoveAllRows
		  For Each p As RenderedPack In owner.RenderedPacks
		    pmPack.AddRow(RenderedPackText(p))
		    pmPack.RowTagAt(pmPack.LastAddedRowIndex) = p
		  Next
		  pmPack.AddRow(T("upload.packFile")) // its tag stays Nil
		  If pmPack.RowCount > 1 Then pmPack.SelectedRowIndex = 0
		  Self.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateControls()
		  Dim tcp As Boolean = pmPort.SelectedRowIndex >= 0 And pmPort.RowTagAt(pmPort.SelectedRowIndex) = Nil
		  Dim busy As Boolean = mUploader <> Nil And mUploader.IsBusy
		  Dim open As Boolean = mLink <> Nil And mLink.IsOpen
		  tfHost.Enabled = tcp And Not open
		  pmPort.Enabled = Not open
		  btnConnect.Caption = If(open, T("upload.disconnect"), T("upload.connect"))
		  btnConnect.Enabled = Not busy
		  btnUpload.Caption = If(busy, T("button.cancel"), T("upload.upload"))
		  btnUpload.Enabled = mConnected
		  pmPack.Enabled = Not busy
		  tfTargetName.Enabled = Not busy
		  btnRemoveAll.Enabled = mConnected And Not busy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UploaderFinished(sender As PackUploader, ok As Boolean, message As String)
		  Log(If(ok, message, T("upload.log.failed", "message", message)))
		  If Not ok Then pbUpload.Value = 0
		  UpdateControls
		  // No room beside the old pack (a small filesystem): offer to remove it, then send the new one
		  If ok Or Not sender.StoppedByDevice Or mRetriedAfterRemove Then Return
		  Dim d As New MessageDialog
		  d.Message = T("upload.noRoom.message")
		  d.Explanation = T("upload.noRoom.explanation", "path", "/fonts/" + mLastTarget)
		  d.ActionButton.Caption = T("upload.noRoom.action")
		  d.CancelButton.Visible = True
		  d.CancelButton.Caption = T("button.cancel")
		  If d.ShowModal(Self) <> d.ActionButton Then Return
		  Call mLink.DeleteFile("/fonts/" + mLastTarget)
		  Log(T("upload.log.askedRemove", "path", "/fonts/" + mLastTarget))
		  If mRetryTimer = Nil Then
		    mRetryTimer = New Timer
		    AddHandler mRetryTimer.Action, WeakAddressOf RetryAction
		  End If
		  mRetryTimer.Period = 2000
		  mRetryTimer.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UploaderProgress(sender As PackUploader, sent As Integer, total As Integer)
		  #Pragma Unused sender
		  If total > 0 Then pbUpload.Value = sent * 1000 \ total
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mConnected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastData As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastTarget As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLink As MeshDeviceLink
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As MainWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPackFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviousPackRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRelabeling As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRetriedAfterRemove As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRetryTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploader As PackUploader
	#tag EndProperty




#tag EndWindowCode

#tag Events pmPort
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  If mRelabeling Then Return
		  UpdateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnConnect
	#tag Event
		Sub Pressed()
		  If mLink <> Nil And mLink.IsOpen Then
		    mLink.Close
		    mConnected = False
		    lblDevice.Text = ""
		    Log(T("upload.log.disconnected"))
		    UpdateControls
		    Return
		  End If
		  If pmPort.SelectedRowIndex < 0 Then Return
		  mLink = New MeshDeviceLink
		  AddHandler mLink.ConfigComplete, WeakAddressOf LinkConfigComplete
		  AddHandler mLink.LinkClosed, WeakAddressOf LinkClosed
		  AddHandler mLink.LogLine, WeakAddressOf LinkLogLine
		  mUploader = New PackUploader(mLink)
		  AddHandler mUploader.Progress, WeakAddressOf UploaderProgress
		  AddHandler mUploader.Finished, WeakAddressOf UploaderFinished
		  mConnected = False
		  Dim tag As Variant = pmPort.RowTagAt(pmPort.SelectedRowIndex)
		  If tag IsA SerialDevice Then
		    Dim dev As SerialDevice = tag
		    mLink.ConnectSerial(dev)
		  Else
		    Dim host As String = tfHost.Text.Trim
		    If host = "" Then
		      Log(T("upload.log.typeHost"))
		      Return
		    End If
		    mLink.ConnectTCP(host)
		  End If
		  UpdateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmPack
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  #Pragma Unused item
		  If mRelabeling Then Return
		  Dim row As Integer = pmPack.SelectedRowIndex
		  If row < 0 Then Return
		  Dim tag As Variant = pmPack.RowTagAt(row)
		  If tag IsA RenderedPack Then
		    mPreviousPackRow = row
		    Dim name As String = "cjk"
		    If mOwner <> Nil Then name = mOwner.tfPackName.Text.Trim
		    If name = "" Then name = "fontpack"
		    Dim rp As RenderedPack = tag
		    tfTargetName.Text = name + Str(rp.SizePx) + ".mfp"
		    Return
		  End If
		  If tag IsA FolderItem Then
		    mPreviousPackRow = row
		    Dim ff As FolderItem = tag
		    tfTargetName.Text = ff.Name
		    Return
		  End If
		  // Pack file...: added above it, then selected
		  Dim mfp As New FileType
		  mfp.Name = T("main.fileType.pack")
		  mfp.Extensions = "mfp"
		  Dim f As FolderItem = FolderItem.ShowOpenFileDialog(mfp)
		  If f = Nil Then
		    If mPreviousPackRow < pmPack.RowCount - 1 Then pmPack.SelectedRowIndex = mPreviousPackRow
		    Return
		  End If
		  pmPack.AddRowAt(pmPack.RowCount - 1, f.Name)
		  pmPack.RowTagAt(pmPack.RowCount - 2) = f
		  // Selecting it here doesn't raise SelectionChanged again: the name is set now
		  pmPack.SelectedRowIndex = pmPack.RowCount - 2
		  mPreviousPackRow = pmPack.SelectedRowIndex
		  tfTargetName.Text = f.Name
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpload
	#tag Event
		Sub Pressed()
		  If mUploader <> Nil And mUploader.IsBusy Then
		    mUploader.Cancel
		    Return
		  End If
		  If Not mConnected Then Return
		  Dim row As Integer = pmPack.SelectedRowIndex
		  If row < 0 Then
		    Log(T("upload.log.choosePack"))
		    Return
		  End If
		  Dim target As String = tfTargetName.Text.Trim
		  If target.Right(4) <> ".mfp" Or target.IndexOf("/") >= 0 Or target.Length < 5 Then
		    Log(T("upload.log.badName"))
		    Return
		  End If
		  // The pack's bytes: rendered (with the edits) or from a file
		  Dim data As String
		  Dim tag As Variant = pmPack.RowTagAt(row)
		  If tag IsA RenderedPack Then
		    Dim rp As RenderedPack = tag
		    Dim m As MemoryBlock = mOwner.PackBytes(rp, target.Left(target.Length - 4))
		    If m = Nil Then
		      Log(T("upload.log.notFit"))
		      Return
		    End If
		    data = m.StringValue(0, m.Size)
		  ElseIf tag IsA FolderItem Then
		    Try
		      Dim ff As FolderItem = tag
		      Dim b As BinaryStream = BinaryStream.Open(ff, False)
		      data = b.Read(b.Length)
		      b.Close
		    Catch e As IOException
		      Log(T("upload.log.cantRead", "error", e.Message))
		      Return
		    End Try
		  Else
		    Return
		  End If
		  Dim head As MemoryBlock = data
		  If data.Bytes < 80 Or data.LeftBytes(4) <> "MFPK" Or head.UInt16Value(4) <> 2 Then
		    Log(T("upload.log.notPack"))
		    Return
		  End If
		  Log(T("upload.log.sending", "target", target, "bytes", Format(data.Bytes, "#,##0")))
		  mLastData = data
		  mLastTarget = target
		  mRetriedAfterRemove = False
		  mUploader.Start(data, target)
		  UpdateControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClose
	#tag Event
		Sub Pressed()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRemoveAll
	#tag Event
		Sub Pressed()
		  // Every pack on the device: the firmware takes the pack folder itself for all of them, files and flash slots
		  If Not mConnected Or (mUploader <> Nil And mUploader.IsBusy) Then Return
		  Dim packs() As String = PackFiles
		  Dim d As New MessageDialog
		  d.Message = T("upload.removeAll.message")
		  If packs.Count > 0 Then
		    d.Explanation = T("upload.removeAll.hadPacks", "packs", String.FromArray(packs, ", ")) + " "
		  Else
		    d.Explanation = T("upload.removeAll.hadNone") + " "
		  End If
		  d.Explanation = d.Explanation + T("upload.removeAll.slots")
		  d.ActionButton.Caption = T("upload.removeAll.action")
		  d.CancelButton.Visible = True
		  d.CancelButton.Caption = T("button.cancel")
		  If d.ShowModal(Self) <> d.ActionButton Then Return
		  If mLink.DeleteFile("/fonts") = 0 Then
		    Log(T("upload.log.notConnected"))
		    Return
		  End If
		  Log(T("upload.log.askedRemoveAll"))
		End Sub
	#tag EndEvent
#tag EndEvents
