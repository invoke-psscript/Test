cat $Args[0] > C:\Users\$env:username\Documents\logs.txt

$hostname = hostname

$domain = (Get-WmiObject win32_computersystem).domain

Send-MailMessage -SmtpServer mail.$domain -From Reports@5288_IT -To drush@evertz.com -Subject "Logs" -Attachments C:\Users\$env:username\Documents\logs.txt -Body $hostname
