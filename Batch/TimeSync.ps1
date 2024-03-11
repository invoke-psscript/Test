$dnsserver = (Get-DnsClientServerAddress | where {$_.InterfaceAlias -eq (get-netadapter -physical | where {$_.status -eq "up"}).name -and $_.AddressFamily -eq 2}).serveraddresses

$ntp = $dnsserver[0]

Write-Host "Using $ntp as ntp server"

net stop w32time

w32tm /config /syncfromflags:manual /manualpeerlist:$ntp

net start w32time

w32tm /config /update

w32tm /resync /rediscover
