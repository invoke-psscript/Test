$ntp = (Get-DnsClientServerAddress).ServerAddresses | Where {$_ -like "10.*"}

Write-Host "Using $ntp[0] as ntp server"

net stop w32time

w32tm /config /syncfromflags:manual /manualpeerlist:$ntp[0]

net start w32time

w32tm /config /update

w32tm /resync /rediscover
