Get-EventLog -LogName Application -After (Get-Date).AddDays(-2) >> C:\ApplicationEvents.txt

Get-EventLog -LogName Security -After (Get-Date).AddDays(-2) >> C:\SecurityEvents.txt

Get-EventLog -LogName System -After (Get-Date).AddDays(-2) >> C:\SystemEvents.txt
