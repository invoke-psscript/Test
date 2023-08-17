hostname > C:\ComputerInfo.txt
"----------" >> C:\ComputerInfo.txt
"" >> C:\ComputerInfo.txt
$env:logonserver >> C:\ComputerInfo.txt
nltest /DSGETDC:burlington.evertz.tv >> C:\ComputerInfo.txt
Get-WmiObject win32_bios | Select serialnumber >> C:\ComputerInfo.txt
"----------" >> C:\ComputerInfo.txt
Get-WmiObject win32_computersystem | Select * >> C:\ComputerInfo.txt
"----------" >> C:\ComputerInfo.txt
Get-WmiObject win32_product >> C:\ComputerInfo.txt
"----------" >> C:\ComputerInfo.txt
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 15 >> C:\ComputerInfo.txt
