v:cat $Args[0] > $env:TEMP\logs.txt

$hostname = hostname

$domain = (Get-WmiObject win32_computersystem).domain

Send-MailMessage -SmtpServer mail.$domain -From Reports@5288_IT -To drush@evertz.com -Subject "Logs" -Attachments $env:TEMP\logs.txt -Body $hostname
