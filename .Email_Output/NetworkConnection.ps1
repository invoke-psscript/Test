# Variables

$filepath = "C:\5288_IT$\Logs"

$hostname = hostname

$domain = (Get-DnsClientGlobalSetting).SuffixSearchList[0]

$attachments = @()


# Output
#-----------------------------------------------------------

# Create a directory for output

try {
    If (-not (Test-Path C:\5288_IT$))
        {New-Item -Path $filepath -ItemType Directory
        (Get-Item -Path "C:\5288_IT$").Attributes = "Hidden"}
}
catch {
  $ErrorOutput = $_.Exception.Message
  "directory error`n-----`n`n" + $ErrorOutput | Out-File -FilePath $filepath\errors.txt -Append
}


# Remove previous error log

If (Test-Path $filepath\errors.txt){
    Remove-Item $filepath\errors.txt
}


# nltest

try {
    $nltest = (nltest /DSGETDC:$domain) 2>> $filepath\errors.txt
    $nltest | Out-File -FilePath $filepath\nltest.txt -Append
    $attachments += "$filepath\nltest.txt"
}
catch{
    $ErrorOutput = $_.Exception.Message
    "nltest error`n-----`n`n" + $ErrorOutput | Out-File -FilePath $filepath\errors.txt -Append
}


# ipconfig

try {
    $ipconfig = (ipconfig /all) 2>> $filepath\errors.txt
    $ipconfig | Out-File -FilePath $filepath\ipconfig.txt -Append
    $attachments += "$filepath\ipconfig.txt"
}
catch{
    $ErrorOutput = $_.Exception.Message
    "ipconfig error`n-----`n`n" + $ErrorOutput | Out-File -FilePath $filepath\errors.txt -Append
}


# Add error log to attachments array

$attachments += "$filepath\errors.txt"


# Send email report
try{
    Send-MailMessage -SmtpServer mail.$domain -From Reports@5288_IT -To drush@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
}
catch{
    try{
        Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From Reports@5288_IT -To drush@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
    }
    catch{
        Send-MailMessage -SmtpServer mxb-008b7801.gslb.pphosted.com -From Reports@5288_IT -To drush@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
    }
}
