foreach ($i in @("Administrators", "Remote Desktop Users")) {$Info = Get-LocalGroupMember $i ; Write-Host ("$i`n`n $Info`n" )}
