try {
  If (-not (Test-Path C:\5288_IT$))
    {New-Item -Path "C:\5288_IT$\Logs" -ItemType Directory
    (Get-Item -Path "C:\5288_IT$").Attributes = "Hidden"}
}
catch {
  $ErrorOutput = $_.Exception.Message
}




$Domain = (Get-DnsClientGlobalSetting).SuffixSearchList[0]

nltest /DSGETDC:$Domain | Out-File -FilePath C:\5288_IT\Logs
