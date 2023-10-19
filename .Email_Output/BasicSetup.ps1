# Variables

$filepath = "C:\5288_IT$\Logs"

$hostname = hostname

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


# Attempt to install applications using winget

$wingetapps = @("TheDocumentFoundation.LibreOffice", "Notepad++.Notepad++", "Zoom.Zoom")

try{
    ForEach ($app in $wingetapps){
    $output = & winget install $app 2>> $filepath\errors.txt
    $output | Out-File -FilePath $filepath\winget.txt -Append
    }
}
catch{
    $ErrorOutput = $_.Exception.Message
    "winget error`n-----`n`n" + $ErrorOutput | Out-File -FilePath $filepath\errors.txt -Append
}

If (Test-Path "$filepath\winget.txt"){
    $attachments += "$filepath\winget.txt"
}

$attachments += "$filepath\errors.txt"


# Send email report

try{
    Send-MailMessage -SmtpServer mail.((Get-DnsClientGlobalSetting).SuffixSearchList[0]) -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
}
catch{
    try{
        Send-MailMessage -SmtpServer mxa-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
    }
    catch{
        Send-MailMessage -SmtpServer mxb-008b7801.gslb.pphosted.com -From Reports@5288.IT -To 5288_IT@evertz.com -Subject "Network Connection" -Attachments $attachments -Body $hostname
    }
}
