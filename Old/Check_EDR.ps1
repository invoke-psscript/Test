Get-Process | Where-Object {$_.ProcessName -like "FortiEDR*"} > C:\Check_EDR.txt
