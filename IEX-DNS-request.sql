/* PowerShell - IEX & DNS */
/* Detects PowerShell Invoke-Expression and DNS requests */
SrcProcCmdLine Contains Anycase "IEX" AND SrcProcName = "powershell.exe" AND DnsRequest Exists