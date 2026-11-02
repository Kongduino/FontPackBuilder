#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub MenuBarSelected()
		  // The Language menu's items are made in code: enabled here
		  If mLanguageMenu <> Nil Then
		    For i As Integer = 0 To mLanguageMenu.Count - 1
		      mLanguageMenu.MenuAt(i).Enabled = True
		    Next
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  // The UI language (Strings): the user's choice, else the system's when there's a file for it, else English
		  Strings.Load
		  BuildLanguageMenu
		  ApplyMenus
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ApplyMenus()
		  // The menu bar in the current language, and the check mark on it in the Language menu
		  Dim bar As DesktopMenuItem = Self.MenuBar
		  If bar = Nil Then Return
		  SetMenuText(bar, "FileMenu", "menu.file")
		  SetMenuText(bar.Child("FileMenu"), "FileQuit", "menu.quit")
		  SetMenuText(bar, "EditMenu", "menu.edit")
		  Dim edit As DesktopMenuItem = bar.Child("EditMenu")
		  SetMenuText(edit, "EditUndo", "menu.undo")
		  SetMenuText(edit, "EditCut", "menu.cut")
		  SetMenuText(edit, "EditCopy", "menu.copy")
		  SetMenuText(edit, "EditPaste", "menu.paste")
		  SetMenuText(edit, "EditClear", "menu.delete")
		  SetMenuText(edit, "EditSelectAll", "menu.selectAll")
		  SetMenuText(bar, "WindowMenu", "menu.window")
		  SetMenuText(bar, "HelpMenu", "menu.help")
		  If mLanguageMenu <> Nil Then
		    mLanguageMenu.Text = T("menu.language")
		    For i As Integer = 0 To mLanguageMenu.Count - 1
		      Dim item As DesktopMenuItem = mLanguageMenu.MenuAt(i)
		      item.HasCheckMark = (item.Tag.StringValue = Strings.Current)
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildLanguageMenu()
		  // Language: one item per language file (Strings.LanguageCodes), named in its own script; before Window
		  Dim bar As DesktopMenuItem = Self.MenuBar
		  If bar = Nil Then Return
		  mLanguageMenu = New DesktopMenuItem(T("menu.language"))
		  For Each code As String In Strings.LanguageCodes
		    Dim item As New DesktopMenuItem(Strings.LanguageName(code))
		    item.Tag = code
		    AddHandler item.MenuItemSelected, WeakAddressOf LanguageChosen
		    mLanguageMenu.AddMenu(item)
		  Next
		  Dim at As Integer = bar.Count
		  For i As Integer = 0 To bar.Count - 1
		    If bar.MenuAt(i).Name = "WindowMenu" Then
		      at = i
		      Exit
		    End If
		  Next
		  bar.AddMenuAt(at, mLanguageMenu)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function LanguageChosen(sender As DesktopMenuItem) As Boolean
		  Strings.SetLanguage(sender.Tag.StringValue)
		  ApplyMenus
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetMenuText(parent As DesktopMenuItem, name As String, key As String)
		  If parent = Nil Then Return
		  Dim item As DesktopMenuItem = parent.Child(name)
		  If item <> Nil Then item.Text = T(key)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLanguageMenu As DesktopMenuItem
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


End Class
#tag EndClass
