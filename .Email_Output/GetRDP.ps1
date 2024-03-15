Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Recurse > "C:\rdp.txt"

$Body = (Get-Content "C:\rdp.txt" -Raw)

$hostname = hostname

$mail = "mail." + (Get-WmiObject win32_computersystem ).Domain

Send-MailMessage -SmtpServer $mail -To "drush@evertz.com" -From "Reports@5288.IT" -Body $Body -Subject $hostname
