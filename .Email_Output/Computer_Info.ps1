hostname > C:\Computer_Info.txt
Start-Sleep -Seconds 5
Get-WmiObject win32_bios | Select serialnumber >> C:\Computer_Info.txt
Start-Sleep -Seconds 5
Get-WmiObject win32_computersystem | Select * >> C:\Computer_Info.txt
Start-Sleep -Seconds 5

Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From track@systm.local -To drush@evertz.com -Subject "ComputerInfo" -Attachments C:\Computer_Info.txt -Body "ComputerInfo"
