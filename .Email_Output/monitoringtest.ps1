$netshinfo = netsh wlan sh d

$filedate = (Get-Date).ToString("MMddyyyy")

$hostname = hostname

$filename = $hostname + "_" + $filedate

$netshinfo > C:\Users\Administrator\Desktop\$filename.txt

$complete = (Get-Date).AddHours(18)

while ((Get-Date) -lt $complete){
    $pingtest = ""
    $pingtest += ping -n 1 -a 5288IT-TEST -4
    $date = (Get-Date).ToString("MM-dd-yyyy HH:mm:ss")
    $pingtesttime = $date + ":  " + $pingtest
    $netsh = ""
    $netsh += netsh wlan sh int
    $output = ""
    $output += "-----`n`n" + $netsh + "`n`n" + $pingtesttime + "`n`n"
   
    $output >> C:\Users\Administrator\Desktop\$filename.txt

    Start-Sleep -Seconds 30
}

while (-not (Test-NetConnection 5288IT-TEST)){

  "Waiting to send output" >> C:\Users\Administrator\Desktop\$filename.txt

}

Send-MailMessage -SmtpServer mail -To drush@evertz.com -From Reports@5288.IT -Attachments C:\Users\Administrator\Desktop\$filename.txt -Subject Monitoring -Body $hostname
