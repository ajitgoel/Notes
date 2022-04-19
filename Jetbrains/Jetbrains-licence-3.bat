::https://gist.github.com/imgVOID/35e1c463ce187fac9f793e06a6688649#file-jetbrains-license-3-bat
cd %APPDATA%\JetBrains
del "PermanentDeviceId"
del "PermanentUserId"
rmdir "consentOptions" /s /q
cd %APPDATA%\JetBrains\PHPStorm2021.1*
rmdir "eval" /s /q
del "options\other.xml"
reg delete "HKEY_CURRENT_USER\Software\JavaSoft\Prefs\jetbrains"