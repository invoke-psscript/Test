Get-ChildItem "C:\Users\$env:username\AppData\Local\Google\Chrome\User Data\Default\Extensions" > C:\Chrome_Extensions.txt

Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From track@systm.local -To drush@evertz.com -Subject "Chrome Extensions" -Attachments C:\Chrome_Extensions.txt -Body "Chrome Extensions"
