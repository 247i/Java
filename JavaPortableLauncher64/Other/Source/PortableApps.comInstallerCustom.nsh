!macro CustomCodePreInstall
	${GetParent} $INSTDIR $0
		
	${IfNot} ${FileExists} "$0\JavaPortableLauncher\*.*"
		CreateDirectory  "$0\JavaPortableLauncher"
		CreateDirectory  "$0\JavaPortableLauncher\Data"
		${If} ${FileExists}  "$INSTDIR\Data\AppData\*.*"
			CreateDirectory  "$0\JavaPortableLauncher\Data\AppData"
			CopyFiles /SILENT "$INSTDIR\Data\AppData\*.*" "$0\JavaPortableLauncher\Data\AppData"
		${EndIf}
		CreateDirectory  "$0\JavaPortableLauncher\App"
		CreateDirectory  "$0\JavaPortableLauncher\App\AppInfo"
		CopyFiles /SILENT "$INSTDIR\App\AppInfo\appinfo.ini" "$0\JavaPortableLauncher\App\AppInfo"
		WriteINIStr "$0\JavaPortableLauncher\App\AppInfo\appinfo.ini" "Details" "Name" "jPortable Launcher"
		WriteINIStr "$0\JavaPortableLauncher\App\AppInfo\appinfo.ini" "Details" "AppId" "JavaPortableLauncher"
		WriteINIStr "$0\JavaPortableLauncher\App\AppInfo\appinfo.ini" "Version" "DisplayVersion" "Awaiting Upgrade"
		CopyFiles /SILENT "$INSTDIR\JavaPortableLauncher.exe" "$0\JavaPortableLauncher\JavaPortableLauncher.exe"
	${ElseIf} ${FileExists}  "$INSTDIR\Data\AppData\*.*"
		CreateDirectory  "$0\JavaPortableLauncher\Data"
		CreateDirectory  "$0\JavaPortableLauncher\Data\AppData"
		CopyFiles /SILENT "$INSTDIR\Data\AppData\*.*" "$0\JavaPortableLauncher\Data\AppData"
	${EndIf}
!macroend

!macro CustomCodePostInstall
	${GetParent} $INSTDIR $0

	${IfNot} ${FileExists} "$0\JavaPortableLauncher\JavaPortableLauncher.exe"
		Rename "$INSTDIR\JavaPortableLauncher.exe" "$0\JavaPortableLauncher\JavaPortableLauncher.exe"
	${EndIf}
	Delete "$INSTDIR\help.html"
	Delete "$INSTDIR\JavaPortableLauncher.exe"
!macroend
