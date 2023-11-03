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

# Remove COM ports
try {
  $log = $filepath + "COMportsStart.txt"
  Get-PnpDevice >> $log
  $attachments += $log
  Get-PnpDevice | Where { $_.Class -eq "Ports" -and $_.Status -eq "Unknown" } | ForEach {pnputil /remove-device $_.DeviceId}
  $log = $filepath + "COMportsEnd.txt"
  Get-PnpDevice >> $log
  $attachments += $log
}
catch{
  $ErrorOutput = $_.Exception.Message
  "#task error`n-----`n`n" + $ErrorOutput | Out-File -FilePath $filepath\errors.txt -Append
}













-----
# Add error log to attachments array

$attachments += "$filepath\errors.txt"


# Send email report
try{
    Send-MailMessage -SmtpServer mail.$domain -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "COM Ports" -Attachments $attachments -Body $hostname
}
catch{
    try{
        Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
    }
    catch{
        Send-MailMessage -SmtpServer mxb-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
    }
}
