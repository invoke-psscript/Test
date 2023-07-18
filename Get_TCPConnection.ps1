foreach ($address in (get-nettcpconnection | where remoteaddress -notin @("0.0.0.0", "127.0.0.1", "::", "::1") | select -expandproperty remoteaddress)) {nslookup $address} > C:\TcpConnection.txt
