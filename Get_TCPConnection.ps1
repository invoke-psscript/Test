Get-NetTcpConnection | Where-Object RemoteAddress -notin @("0.0.0.0", "127.0.0.1", "::") > C:\TcpConnection.txt
