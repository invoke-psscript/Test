taskkill /IM outlook.exe /T /F
taskkill /IM teams.exe /T /F

REM Clear the signed in identity
rmdir C:\Users\%username%\AppData\Local\Microsoft\TokenBroker /S /Q

REM Remove the sign in loop 
rmdir C:\Users\%username%\AppData\Local\Packages\Microsoft.AAD.BrokerPlugin_cw5n1h2txyewy /S /Q

REM Remove Teams Cache
rmdir C:\Users\%username%\AppData\Roaming\Microsoft\Teams /S /Q

REM Remove Identity Cache
rmdir C:\Users\%username%\AppData\Local\Microsoft\IdentityCache /S /Q

start "" "C:\Program Files\Microsoft Office\root\Office16\outlook.exe"
