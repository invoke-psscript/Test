$hostname = hostname

Send-MailMessage -To drush@evertz.com -From Reports@5288.IT -Subject Hostname -Body $hostname -SmtpServer mxa-008b7801.gslb.pphosted.com
