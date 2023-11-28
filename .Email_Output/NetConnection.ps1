# Variables
#--------------------

$filepath = "C:\5288_IT$\Logs"
$hostname = hostname
$domain = (Get-DnsClientGlobalSetting).SuffixSearchList[0]
$attachments = @()


# Output Folder
#--------------------

If (-not (Test-Path C:\5288_IT$))
        {New-Item -Path $filepath -ItemType Directory
        (Get-Item -Path "C:\5288_IT$").Attributes = "Hidden"}


# nltest
#--------------------

$nltest = (nltest /DSGETDC:$domain) 2>> $filepath\errors.txt
$nltest | Out-File -FilePath $filepath\nltest.txt -Append
$attachments += "$filepath\nltest.txt"


# ipconfig
#--------------------

$ipconfig = (ipconfig /all) 2>> $filepath\errors.txt
$ipconfig | Out-File -FilePath $filepath\ipconfig.txt -Append
$attachments += "$filepath\ipconfig.txt"


If (Test-Connection mail.$domain -Quiet){Send-MailMessage -SmtpServer mail.$domain -From Reports@5288_IT -To drush@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname}

Else {Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From Reports@5288_IT -To drush@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname}
