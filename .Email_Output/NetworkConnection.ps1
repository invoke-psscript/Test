try {
  If (-not (Test-Path C:\5288_IT$))
    {New-Item -Path "C:\5288_IT$\Logs" -ItemType Directory
    (Get-Item -Path "C:\5288_IT$").Attributes = "Hidden"}
}
catch {
  $ErrorOutput = $_.Exception.Message
}

$Hostname = hostname


$Domain = (Get-DnsClientGlobalSetting).SuffixSearchList[0]
nltest /DSGETDC:$Domain | Out-File -FilePath C:\5288_IT\Logs\nltest.txt


Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From Reports@5288.IT -To drush@evertz.com -Subject "Network Connection" -Attachments C:\5288_IT\Logs\nltest.txt -Body $Hostname
