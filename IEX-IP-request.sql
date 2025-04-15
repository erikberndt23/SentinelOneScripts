/* PowerShell - IEX & IP Addresses */
/* Detects PowerShell Invoke-Expression and IP address requests */
SrcProcCmdLine Contains Anycase "IEX" AND SrcProcName = "powershell.exe" AND DstIP EXISTS