taskkill /IM outlook.exe /T /F
taskkill /IM teams.exe /T /F

REM Clear the signed in identity
rmdir C:\Users\%username%\AppData\Local\Microsoft\TokenBroker /S /Q

REM Remove the sign in loop 
rmdir C:\Users\%username%\AppData\Local\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy /S /Q

REM Microsoft Entra token broker plugin
REM Behind the scenes, the Microsoft Entra token broker plugin, represented by the Microsoft.AAD.BrokerPlugin.exe background process, facilitates 
REM authentication on behalf of the WinForms app.

REM Remove Teams Classic Cache
rmdir C:\Users\%username%\AppData\Roaming\Microsoft\Teams /S /Q

REM Remove New MS Teams Cache Files - Reference https://learn.microsoft.com/en-us/microsoftteams/troubleshoot/teams-administration/clear-teams-cache
rmdir %userprofile%\appdata\local\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams /S /Q

REM Remove Identity Cache - Logout of Windows and re-login is required thereafter.
rmdir C:\Users\%username%\AppData\Local\Microsoft\IdentityCache /S /Q
cls
REM Option Time if you want to be forced to logout. Any key to continue, or close this window to exit. But you will need to re-login for Identity Cache to work
