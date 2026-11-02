#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyFiles1
					AppliesTo = 0
					Architecture = 0
					Target = 0
					Destination = 1
					Subdirectory = 
					FolderItem = Li4vUmVzb3VyY2VzL0Jsb2Nrcy50eHQ=
					FolderItem = Li4vUmVzb3VyY2VzL0NoYXJTZXRzLnR4dA==
					FolderItem = Li4vUmVzb3VyY2VzL0ZvbnRzLw==
					FolderItem = Li4vUmVzb3VyY2VzL0xhbmd1YWdlcy8=
				End
				Begin SignProjectStep Sign
				  DeveloperID=
				  macOSEntitlements={"App Sandbox":"False","Hardened Runtime":"False","Notarize":"False","UserEntitlements":""}
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
