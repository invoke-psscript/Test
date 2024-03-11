Write-Host (Get-Date)
""
Write-Host (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "DynamicDaylightTimeDisabled")
""
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "DynamicDaylightTimeDisabled" -Value 0

Write-Host (Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "DynamicDaylightTimeDisabled")
""
$dnsserver = @()

$dnsserver += (get-dnsclientserveraddress (get-netadapter -physical | where {$_.Status -eq "Up"}).Name | where addressfamily -eq 2).serveraddresses

Write-Host ("DNS Servers are $dnsserver")
""
$ntp = $dnsserver[0]

Write-Host ("Using $ntp as ntp server")

net stop w32time

w32tm /config /syncfromflags:manual /manualpeerlist:$ntp

net start w32time

w32tm /config /update

w32tm /resync /rediscover

Write-Host(Get-Date)
