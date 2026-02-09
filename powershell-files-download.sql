/* Powershell file downloads */
/* Detect files being downloaded with powershell */
( ( SrcProcCmdLine Contains Anycase "Net.Web" Or SrcProcCmdLine Contains Anycase "WebRequest" OR SrcProcCmdLine Contains Anycase "BitsTransfer" OR SrcProcCmdLine Contains Anycase "DownloadFile" ) AND EventType = "Command Script" )

event.type = "Process Creation" 
AND (src.process.Name = 'powershell.exe' 
OR src.process.name = 'powershell_ise.exe' 
OR src.process.name = 'pwsh.exe' 
OR tgt.process.name = 'powershell.exe' 
OR tgt.process.name = 'powershell_ise.exe' 
OR tgt.process.name = 'pwsh.exe') 
AND (src.process.cmdline contains 'Invoke-WebRequest' 
OR src.process.cmdline contains 'iwr' 
OR src.process.cmdline contains 'Net.WebClient' 
OR src.process.cmdline contains 'DownloadFile' 
OR src.process.cmdline contains 'Start-BitsTransfer' 
OR src.process.cmdline contains 'bitsadmin' 
OR src.process.cmdline contains 'curl' 
OR src.process.cmdline contains 'wget' 
OR src.process.cmdline contains '-enc' 
OR src.process.cmdline contains 'FromBase64String' 
OR src.process.cmdline contains 'iex')

AND NOT (src.process.publisher contains 'Microsoft' 
AND src.process.signedStatus = 'signed' 
OR (tgt.process.publisher contains 'Microsoft' 
AND tgt.process.signedStatus = 'signed')) 
OR src.process.parent.cmdline contains 'gpscript.exe'
OR src.process.parent.name contains 'PDQ'
or src.process.cmdline contains "PDQ"


