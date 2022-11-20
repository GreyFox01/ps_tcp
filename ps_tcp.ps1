#type tcp to see all current TCP connections
function tcp {Get-NetTCPConnection| Select LocalAddress, LocalPort, RemoteAddress, RemotePort, State, OwningProcess,@{n="ProcessName";e={(Get-Process -Id $_.OwningProcess).ProcessName}}, @{n="UserName";e={(Get-Process -Id $_.OwningProcess -IncludeUserName).UserName}}| Where {$_.State -eq"Established"} | FT -autosize -Force}
