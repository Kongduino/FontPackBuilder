#tag Class
Protected Class PackUploader
	#tag Method, Flags = &h21
		Private Sub Advance()
		  // The device has the current packet: the next one, or the end of the transfer
		  mRetries = 0
		  mTimedOut = False
		  Dim total As Integer = mData.Bytes
		  Dim sent As Integer = Min(mSeq * kChunk, total)
		  RaiseEvent Progress(sent, total)
		  If sent >= total Then
		    mStage = kStageEnd
		  Else
		    mSeq = mSeq + 1
		  End If
		  Send
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cancel()
		  // Stops the transfer: the device discards what it received
		  If mStage = kStageIdle Then Return
		  mLink.SendXModem(kCAN, 0)
		  Finish(False, T("transfer.cancelled"))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(link As MeshDeviceLink)
		  // Sends a font pack to a device over its client API (MeshDeviceLink, serial or TCP), with the XModem transfer of
		  // the firmware (xmodem.cpp): SOH and the file name /fonts/<name>.mfp, the pack in 128-byte packets, then EOT.
		  // The device checks the pack (structure, CRC) before it acknowledges the end, and installs it then
		  mLink = link
		  AddHandler mLink.XModemReceived, WeakAddressOf LinkXModemReceived
		  mTimer = New Timer
		  mTimer.RunMode = Timer.RunModes.Off
		  AddHandler mTimer.Action, WeakAddressOf TimerAction
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Fail(message As String)
		  Finish(False, message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Finish(ok As Boolean, message As String)
		  mTimer.RunMode = Timer.RunModes.Off
		  mStage = kStageIdle
		  RaiseEvent Finished(ok, message)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsBusy() As Boolean
		  Return mStage <> kStageIdle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LinkXModemReceived(sender As MeshDeviceLink, control As Integer, seq As Integer)
		  #Pragma Unused sender
		  #Pragma Unused seq
		  If mStage = kStageIdle Then Return
		  mTimer.RunMode = Timer.RunModes.Off
		  Select Case mStage
		  Case kStageStart
		    If control = kACK Then
		      mStage = kStageData
		      mSeq = 1
		      Send
		    Else
		      Fail(T("transfer.refused", "target", mTarget))
		    End If
		  Case kStageData
		    If control = kACK Then
		      Advance
		    ElseIf control = kCAN Then
		      StoppedByDevice = True
		      Fail(T("transfer.stopped"))
		    ElseIf control = kNAK And mTimedOut Then
		      // A NAK for a packet resent after a timeout: the device already had it (the sequence no longer matches),
		      // and its acknowledgement was lost on the way back
		      mLostAcks = mLostAcks + 1
		      Advance
		    Else
		      Retry
		    End If
		  Case kStageEnd
		    Dim seconds As Double = (System.Microseconds - mStarted) / 1000000
		    If control = kACK Then
		      Finish(True, T(If(mLostAcks > 0, "transfer.doneRecovered", "transfer.done"), "target", mTarget, _
		      "bytes", Format(mData.Bytes, "#,##0"), "seconds", Format(seconds, "0"), "lost", Str(mLostAcks)))
		    ElseIf control = kNAK Then
		      Fail(T("transfer.checkRefused"))
		    Else
		      Fail(T("transfer.endNotAcked"))
		    End If
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Retry()
		  mRetries = mRetries + 1
		  If mRetries >= kRetries Then
		    mLink.SendXModem(kCAN, 0)
		    Fail(T("transfer.packetNotAcked", "seq", Str(mSeq)))
		    Return
		  End If
		  Send
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Send()
		  // The packet of the current stage, and its timeout
		  Select Case mStage
		  Case kStageStart
		    mLink.SendXModem(kSOH, 0, mTarget)
		    mTimer.Period = kTimeoutMs
		  Case kStageData
		    Dim chunk As String = mData.MiddleBytes((mSeq - 1) * kChunk, kChunk)
		    mLink.SendXModem(kSOH, mSeq Mod 65536, chunk)
		    mTimer.Period = kTimeoutMs
		  Case kStageEnd
		    mLink.SendXModem(kEOT, 0)
		    mTimer.Period = kEndTimeoutMs // the device checks the whole pack first
		  End Select
		  mTimer.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start(packBytes As String, fileName As String)
		  // Sends a pack to /fonts/<fileName> (e.g. "cjk16.mfp"); the result comes with Finished
		  If mStage <> kStageIdle Then Return
		  mData = packBytes
		  mTarget = "/fonts/" + fileName
		  mSeq = 0
		  mRetries = 0
		  mLostAcks = 0
		  mTimedOut = False
		  StoppedByDevice = False
		  mStarted = System.Microseconds
		  mStage = kStageStart
		  RaiseEvent Progress(0, mData.Bytes)
		  Send
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TimerAction(sender As Timer)
		  #Pragma Unused sender
		  // No reply in time: a data packet is resent (its acknowledgement may have been lost); the start or the end fails
		  Select Case mStage
		  Case kStageData
		    mTimedOut = True
		    Retry
		  Case kStageStart
		    Fail(T("transfer.noAnswer"))
		  Case kStageEnd
		    Fail(T("transfer.noAnswerEnd"))
		  End Select
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Finished(ok As Boolean, message As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(sent As Integer, total As Integer)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mData As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			True when the last transfer failed because the device cancelled it (CAN): no room for the pack, most often
		#tag EndNote
		StoppedByDevice As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLink As MeshDeviceLink
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLostAcks As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRetries As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSeq As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStage As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStarted As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTarget As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimedOut As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTimer As Timer
	#tag EndProperty


	#tag Constant, Name = kACK, Type = Double, Dynamic = False, Default = \"6", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kCAN, Type = Double, Dynamic = False, Default = \"24", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kChunk, Type = Double, Dynamic = False, Default = \"128", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEndTimeoutMs, Type = Double, Dynamic = False, Default = \"30000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kEOT, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kNAK, Type = Double, Dynamic = False, Default = \"21", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kRetries, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kSOH, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kStageData, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kStageEnd, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kStageIdle, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kStageStart, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kTimeoutMs, Type = Double, Dynamic = False, Default = \"3000", Scope = Private
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
End Class
#tag EndClass
