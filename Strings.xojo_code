#tag Module
Protected Module Strings
	#tag Method, Flags = &h1
		Sub ApplyToWindows()
		  // Every open window shows its texts in the current language again
		  For i As Integer = 0 To App.WindowCount - 1
		    Dim w As DesktopWindow = App.WindowAt(i)
		    If w IsA MainWindow Then
		      MainWindow(w).ApplyLanguage
		    ElseIf w IsA UploadWindow Then
		      UploadWindow(w).ApplyLanguage
		    ElseIf w IsA GlyphEditor Then
		      GlyphEditor(w).ApplyLanguage
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Function Current() As String
		  // The code of the language in use (the name of its file without .json): "en", "zh-Hant", "ko"...
		  Return mCurrent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FilesFolders() As FolderItem()
		  // Where language files are: the app's Languages folder, then the user's (which wins for the same code)
		  Dim out() As FolderItem
		  Dim builtIn As FolderItem = CharSets.ResourceFile("Languages")
		  If builtIn <> Nil And builtIn.IsFolder Then out.Add(builtIn)
		  Dim user As FolderItem = UserFolder.Child("Languages")
		  If user <> Nil And user.Exists And user.IsFolder Then out.Add(user)
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Function LanguageCodes() As String()
		  // The languages there are a file for, English first, then by code
		  Scan
		  Dim codes() As String
		  For Each k As Variant In mFiles.Keys
		    If k.StringValue <> "en" Then codes.Add(k.StringValue)
		  Next
		  codes.Sort
		  codes.AddAt(0, "en")
		  Return codes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Function LanguageName(code As String) As String
		  // A language's name in its own script, from its file ("_language"), else its code
		  Dim d As Dictionary = ReadFile(code)
		  If d <> Nil And d.HasKey("_language") Then Return d.Value("_language").StringValue
		  Return code
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Sub Load()
		  // At startup: the language chosen before (settings.json), else the system's when there's a file for it, else
		  // English
		  Scan
		  Dim chosen As String
		  Dim settings As FolderItem = UserFolder.Child("settings.json")
		  If settings <> Nil And settings.Exists Then
		    Try
		      Dim t As TextInputStream = TextInputStream.Open(settings)
		      Dim d As Dictionary = ParseJSON(t.ReadAll(Encodings.UTF8))
		      t.Close
		      If d.HasKey("language") Then chosen = d.Value("language").StringValue
		    Catch e As RuntimeException
		      chosen = ""
		    End Try
		  End If
		  If chosen = "" Or Not mFiles.HasKey(chosen) Then chosen = SystemLanguage
		  Use(chosen)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadFile(code As String) As Dictionary
		  // The texts of a language file, or Nil
		  Scan
		  If Not mFiles.HasKey(code) Then Return Nil
		  Dim f As FolderItem = mFiles.Value(code)
		  Try
		    Dim t As TextInputStream = TextInputStream.Open(f)
		    Dim text As String = t.ReadAll(Encodings.UTF8)
		    t.Close
		    Dim d As Dictionary = ParseJSON(text)
		    Return d
		  Catch e As RuntimeException
		    System.DebugLog("Strings: can't read " + f.NativePath + ": " + e.Message)
		    Return Nil
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SaveChoice(code As String)
		  Dim dir As FolderItem = UserFolder
		  Try
		    If Not dir.Exists Then dir.CreateFolder
		    Dim d As New Dictionary
		    d.Value("language") = code
		    Dim t As TextOutputStream = TextOutputStream.Create(dir.Child("settings.json"))
		    t.Write(GenerateJSON(d))
		    t.Close
		  Catch e As RuntimeException
		    System.DebugLog("Strings: can't save the language choice: " + e.Message)
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Scan()
		  // The language files: {code: FolderItem}; a user file replaces a built-in one of the same code
		  If mFiles <> Nil Then Return
		  mFiles = New Dictionary
		  For Each dir As FolderItem In FilesFolders
		    For Each f As FolderItem In dir.Children
		      If f = Nil Or f.IsFolder Then Continue
		      Dim name As String = f.Name
		      If name.Right(5) <> ".json" Or name.Left(1) = "." Then Continue
		      mFiles.Value(name.Left(name.Length - 5)) = f
		    Next
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Sub SetLanguage(code As String)
		  // The user's choice: used now, saved for the next launches, and shown by every open window
		  Use(code)
		  SaveChoice(mCurrent)
		  ApplyToWindows
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SystemLanguage() As String
		  // The system's language when there's a file for it: "zh_Hant_HK" tries zh-Hant-HK, zh-Hant, then zh; Hong Kong,
		  // Macau and Taiwan Chinese without a script read as zh-Hant
		  Dim id As String = Locale.Current.Identifier.ReplaceAll("_", "-")
		  Dim parts() As String = id.Split("-")
		  If parts.Count >= 2 And parts(0) = "zh" And (parts(1) = "HK" Or parts(1) = "MO" Or parts(1) = "TW") Then
		    parts.AddAt(1, "Hant")
		  End If
		  While parts.Count > 0
		    Dim code As String = String.FromArray(parts, "-")
		    For Each k As Variant In mFiles.Keys
		      If k.StringValue.Lowercase = code.Lowercase Then Return k.StringValue
		    Next
		    parts.RemoveAt(parts.LastIndex)
		  Wend
		  Return "en"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function T(key As String, ParamArray args() As String) As String
		  // The text of key in the current language, else in English, else the key itself; args are pairs of a
		  // placeholder name and its value: T("status.saved", "file", f.Name) fills {file}
		  If mTexts = Nil Then Load
		  Dim text As String = key
		  If mTexts.HasKey(key) Then
		    text = mTexts.Value(key).StringValue
		  ElseIf mEnglish.HasKey(key) Then
		    text = mEnglish.Value(key).StringValue
		  End If
		  For i As Integer = 0 To args.LastIndex - 1 Step 2
		    text = text.ReplaceAll("{" + args(i) + "}", args(i + 1))
		  Next
		  Return text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Use(code As String)
		  // English is always loaded: the texts a translation doesn't have come from it
		  mEnglish = ReadFile("en")
		  If mEnglish = Nil Then mEnglish = New Dictionary
		  If code <> "en" Then mTexts = ReadFile(code)
		  If code = "en" Or mTexts = Nil Then
		    mTexts = mEnglish
		    code = "en"
		  End If
		  mCurrent = code
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function UserFolder() As FolderItem
		  // ~/Library/Application Support/FontPackBuilder: the settings, and a Languages folder for more languages
		  Return SpecialFolder.ApplicationData.Child("FontPackBuilder")
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCurrent As String = "en"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnglish As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFiles As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTexts As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
