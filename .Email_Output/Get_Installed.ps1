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
-----

# Get installed apps
try {
  Get-WmiObject win32_product | Out-File -FilePath "$filepath\ComputerInfo.txt" -Append
  $attachments += "$filepath\ComputerInfo.txt"
}
catch{
  $ErrorOutput = $_.Exception.Message
  "Apps error`n-----`n`n" + $ErrorOutput | Out-File -FilePath "$filepath\errors.txt" -Append
}

-----
# Add error log to attachments array

$attachments += "$filepath\errors.txt"


# Send email report
try{
    Send-MailMessage -SmtpServer mail.$domain -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Installed Apps" -Attachments $attachments -Body $hostname
}
catch{
    try{
        Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Installed Apps" -Attachments $attachments -Body $hostname
    }
    catch{
        Send-MailMessage -SmtpServer mxb-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Installed Apps" -Attachments $attachments -Body $hostname
    }
}













