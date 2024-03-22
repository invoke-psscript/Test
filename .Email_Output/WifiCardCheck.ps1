$netshinfo = netsh wlan sh d

$hostname = hostname

$netshinfo > C:\Users\Administrator\Desktop\output.txt

$netsh = netsh wlan sh int

$netsh >> C:\Users\Administrator\Desktop\output.txt

Send-MailMessage -SmtpServer mail -To drush@evertz.com -From Reports@5288.IT -Attachments C:\Users\Administrator\Desktop\output.txt -Subject WifiCardCheck -Body $hostname
