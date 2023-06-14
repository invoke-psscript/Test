Get-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Office\\ClickToRun\\Configuration' | Select-Object -ExpandProperty VersionToReport >> C:\OfficeBuild.txt
