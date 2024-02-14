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
#EMAIL OUTPUT
#-----
$Body = (Get-Content $folder\"sysoutput.txt" -Raw)
$mail = "mail." + $compsys.Domain
Write-Host $Body
Send-MailMessage -SmtpServer $mail -To "drush@evertz.com" -From "Reports@5288.IT" -Body $Body -Subject $compsys.DnsHostname
Remove-Item -Path $env:UserProfile\Desktop\tracker -Recurse
#-----
#----------
