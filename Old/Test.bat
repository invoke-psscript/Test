Taskkill.exe /F /IM FWAService.exe
Timeout 600
sc stop FWAsvc
Timeout 60
sc start FWASvc

echo "Script Complete" > C:\Test_Results.txt
