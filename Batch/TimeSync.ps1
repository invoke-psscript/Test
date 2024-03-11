Write-Host (Get-Date)

$dnsserver = (get-dnsclientserveraddress (get-netadapter -physical | where {$_.Status -eq "Up"}).Name | where addressfamily -eq 2).serveraddresses

Write-Host ("DNS Servers are $dnsserver")

$ntp = $dnsserver[0]

Write-Host "Using $ntp as ntp server"

net stop w32time

w32tm /config /syncfromflags:manual /manualpeerlist:$ntp

net start w32time

w32tm /config /update

w32tm /resync /rediscover

Write-Host(Get-Date)
