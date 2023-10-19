$hostname = hostname

$body = @()

try{
    & winget install TheDocumentFoundation.LibreOffice
    & winget install Notepad++.Notepad++
    & winget install Zoom.Zoom
}
catch{
    $_
}
