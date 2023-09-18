Get-EventLog -LogName Application -After (Get-Date).AddDays(-2) | Select Time, Source, Message | Format-Table -AutoSize >> C:\ApplicationEvents.txt

Get-EventLog -LogName Security -After (Get-Date).AddDays(-2) | Select Time, Source, Message | Format-Table -AutoSize >> C:\SecurityEvents.txt

Get-EventLog -LogName System -After (Get-Date).AddDays(-2) | Select Time, Source, Message | Format-Table -AutoSize >> C:\SystemEvents.txt
