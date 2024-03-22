Start-Job -ScriptBlock {
  & powershell.exe -executionpolicy bypass -file "C:\Users\Administrator\Desktop\monitoring.ps1"
}

Exit
