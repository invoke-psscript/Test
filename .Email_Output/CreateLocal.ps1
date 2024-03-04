New-LocalUser -Name user17 -NoPassword

Add-LocalGroupMember -Group 'Administrators' -Member 'user17'
