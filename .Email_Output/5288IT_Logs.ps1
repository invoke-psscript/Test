#----------
#OUTPUT PATH
#-----
If (Test-Path $env:UserProfile\Desktop\tracker) {Remove-Item -Path C:\Windows\Temp\tracker -Recurse}
New-Item -Path $env:UserProfile\Desktop -Name tracker -ItemType directory  | Out-Null
$folder = "$env:UserProfile\Desktop\tracker"
#-----
#----------

#----------
#SYSTEM INFORMATION
#-----
$compsys = Get-WmiObject win32_computersystem
#-----
#-----
$syshostname = "Hostname: " + $compsys.DnsHostname
$sysdomain = "Domain: " + $compsys.Domain
$sysmfctr = "Manufacturer: " + $compsys.Manufacturer
$sysmodel = "Model: " + $compsys.Model
$sysfamily = "Family: " + $compsys.SystemFamily
$syssku = "SKU: " + $compsys.SystemSKUNumber
$sysowner = "Owner: " + $compsys.PrimaryOwnerName
$sysuser = "User: " + $compsys.UserName
$systimezone = "Timezone Offset: " + $compsys.CurrentTimeZone
$sysnetserver = "Network Server Enabled: " + $compsys.NetworkServerModeEnabled
#-----
#----------

#----------
#SYSTEM OUTPUT
#-----
$win32_computersystem = $syshostname, $sysdomain, $sysmfctr, $sysmodel, $sysfamily, $syssku, $sysowner, $sysuser, $systimezone, $sysnetserver
#-----
#-----
$sysoutput =
"`nSYSTEM INFORMATION",
"`nwin32_computersystem`n--------------------", $win32_computersystem
"`n`n"
$sysoutput | Out-File $folder\"sysoutput.txt"
#-----
#----------

#----------
#LOGS
#-----
$faronics = @(C:\ProgramData\Faronics\StorageSpace\FRC\Logs\FRCAdapter.log, C:\ProgramData\Faronics\StorageSpace\FRC\Logs\VNCHelper.log,
C:\ProgramData\Faronics\StorageSpace\FWA\Logs\CloudAgentLogs.log, C:\ProgramData\Faronics\StorageSpace\FWA\Logs\FwaState.log, C:\ProgramData\Faronics\StorageSpace\FWA\Logs\FWASvc.log,
C:\ProgramData\Faronics\StorageSpace\FWA\Logs\ModulesMgrLogs.log, C:\ProgramData\Faronics\StorageSpace\FWA\Logs\TaskMgr.log, C:\ProgramData\Faronics\StorageSpace\FWA\Logs\WMIProviderLogs.log,
C:\ProgramData\Faronics\StorageSpace\SUC\Logs\ScriptLogs.txt, C:\ProgramData\Faronics\StorageSpace\SUC\Logs\SoftwareUpdaterDLL.log, C:\ProgramData\Faronics\StorageSpace\SUC\Logs\WULogs.log,
C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\FirewallLog.txt, C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\FaveServiceLog.txt, C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\FAVEProSvc.txt, C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\FaveCoreLog.txt,
C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\AvApi-FaveAgentLog.txt, C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\AvApi-FaveSvcLog.txt, C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\AvWmiProviderLog.txt, C:\ProgramData\Faronics\AntiVirusSpace\AVB\Logs\FAVEAgentLog.txt)
#-----
#----------

#----------
#EMAIL OUTPUT
#-----
$Body = (Get-Content $folder\"sysoutput.txt" -Raw)
$mail = "mail." + $compsys.Domain
Write-Host $Body
Send-MailMessage -SmtpServer $mail -To "drush@evertz.com" -From "Reports@5288.IT" -Body $Body -Attachments $faronics -Subject $compsys.DnsHostname
Remove-Item -Path $env:UserProfile\Desktop\tracker -Recurse
#-----
#----------
