::https://gist.github.com/imgVOID/35e1c463ce187fac9f793e06a6688649#file-jetbrains-license-3-bat
cd %APPDATA%\JetBrains
del "PermanentDeviceId"
del "PermanentUserId"
rmdir "consentOptions" /s /q
cd %APPDATA%\JetBrains\IntelliJIdea2021.1*
rmdir "eval" /s /q
del "options\other.xml"
reg delete "HKEY_CURRENT_USER\Software\JavaSoft\Prefs\jetbrains"

:: Delete eval folder with licence key and options.xml which contains a reference  to it
for %%I in ("WebStorm", "IntelliJ", "CLion", "Rider", "GoLand", "PhpStorm") do (
  for /d %%a in ("%USERPROFILE%\.%%I*") do (
    rd /s /q "%%a/config/eval"
    del /q "%%a\config\options\other.xml"
  )
)

:: Delete registry key and jetbrains folder (not sure if needet but however)
rmdir /s /q "%APPDATA%\JetBrains"
reg delete "HKEY_CURRENT_USER\Software\JavaSoft" /f