hostname > C:\ComputerInfo.txt
Get-WmiObject win32bios | Select serialnumber >> C:\ComputerInfo.txt
Get-WmiObject win32computersystem | Select * >> C:\ComputerInfo.txt
Get-WmiObject win32_product >> C:\ComputerInfo.txt

Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From track@systm.local -To drush@evertz.com -Subject "Computer Info" -Attachments C:\ComputerInfo.txt -Body "ComputerInfo"
