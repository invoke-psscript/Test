param(
  [Parameter(Mandatory=$true)]
  [string]$arg1,
  [Parameter(Mandatory=$true)]
  [string]$arg2
)

# arg1 is filepath, arg2 is filename

$file = Get-ChildItem $arg1 | Where Name -like ($arg2 + "*")

attachments = @()

attachments += ($file)

Send-MailMessage -SmtpServer ("mail." + (Get-WmiObject win32_computersystem)) -To "drush@evertz.com" -From "Reports@5288.IT" -Subject GetFile -Attachments $attachments
