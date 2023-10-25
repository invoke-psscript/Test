# Variables

$filepath = "C:\5288_IT$\Logs"

$hostname = hostname

$domain = (Get-DnsClientGlobalSetting).SuffixSearchList[0]

$attachments = @()

$subject = "Folder Contents"

$user = Get-WmiObject win32_process -Filter "Name='explorer.exe'" | ForEach-Object {$_.GetOwner()} | Select-Object -Unique -Expand User

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
#-----


try{
  Get-ChildItem "C:\Users\$user\Downloads" > $filepath\downloads.txt
  $attachments += "$filepath\downloads.txt"
}
catch{
  $ErrorOutput = $_.Exception.Message
  "List Downloads error`n-----`n`n" + $ErrorOutput | Out-File -FilePath $filepath\errors.txt -Append
}













#-----
# Add error log to attachments array
If (Test-Path $filepath\errors.txt){
    $attachments += "$filepath\errors.txt"
}

# Send email report
try{
    Send-MailMessage -SmtpServer mail.$domain -From Reports@5288.IT -To 5288_IT@evertz.com -Subject $subject -Attachments $attachments -Body $hostname
}
catch{
    try{
        Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject $subject -Attachments $attachments -Body $hostname
    }
    catch{
        Send-MailMessage -SmtpServer mxb-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject $subject -Attachments $attachments -Body $hostname
    }
}
