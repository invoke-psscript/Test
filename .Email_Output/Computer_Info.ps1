hostname > C:\Computer_Info.txt
Start-Sleep -Seconds 2
Get-WmiObject win32bios | Select serialnumber >> C:\ComputerInfo.txt
Start-Sleep -Seconds 2
Get-WmiObject win32computersystem | Select * >> C:\ComputerInfo.txt
Start-Sleep -Seconds 2
Get-WmiObject win32_product >> C:\ComputerInfo.txt
Start-Sleep -Seconds 2

Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From track@systm.local -To drush@evertz.com -Subject "ComputerInfo" -Attachments C:\ComputerInfo.txt -Body "ComputerInfo"
