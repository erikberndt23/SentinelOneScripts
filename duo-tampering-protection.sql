/* Someone deleting the Duo Security Directory */
/* Looking for PowerShell Script block or Process Creation events with Remove-Items and the Duo Security directory */
(event.type='Command Script' and cmdScript.content contains "Remove-Item" and cmdScript.content contains "Duo Security") or (event.type='Process Creation' and src.process.cmdline "Remove-Item" and src.process.cmdline contains "Duo Security")

/* Someone taking Ownership of Duo Security Directory */
/* Looking for PowerShell Script block or Process Creation events with takeown and the Duo Security directory */
(event.type='Command Script' and cmdScript.content contains "takeown" and cmdScript.content contains "Duo Security") or (event.type='Process Creation' and src.process.cmdline "takeown" and src.process.cmdline contains "Duo Security")

/* Someone changing the ACLs of Duo Security Directory */
/* Looking for PowerShell Script block or Process Creation events with takeown and the Duo Security directory */
(event.type='Command Script' and cmdScript.content contains "takeown" and cmdScript.content contains "Duo Security") or (event.type='Process Creation' and src.process.cmdline "takeown" and src.process.cmdline contains "Duo Security")

/* Someone changing the ACLs of Duo Security Directory */
/* Looking for PowerShell Script block or Process Creation events with icacls and the Duo Security directory */
(event.type='Command Script' and cmdScript.content contains "icacls" and cmdScript.content contains "Duo Security") or (event.type='Process Creation' and src.process.cmdline "icacls" and src.process.cmdline contains "Duo Security")	

/* PowerShell attemping to kill the Duo Service */
/* Looking for PowerShell Script block event where someone is attempting to stop the Duo Security processes */
event.type='Command Script' and cmdScript.content contains "Duo Security" and cmdScript.content contains "Stop-Process"

/* PowerShell attempting to find the Duo service */
/* Looking for PowerShell Script block event where someone is looking for processes with Duo Security */
event.type='Command Script' and cmdScript.content contains "Get-Process" and cmdScript.content contains "duo" and cmdScript.content contains"Program Files" and cmdScript.content contains "Duo Security"

/* PowerShell attempting to stop Duo service */
/* Looking for PowerShell Script block event looking for the duo process or trying to stop a process with the name duo */
event.type='Command Script' and (( cmdScript.content contains "Get-Service" and cmdScript.content contains "Name" and cmdScript.content contains "duo") or (cmdScript.content contains "duo" and cmdScript.content contains "Stop-Service"))

/* DUO Tamper Detection */
/* Detects attempts to unregister the DuoCredProv.dll */
tgt.process.cmdline ="cmd /c regsvr32 /u 'C:\\Program Files\\Duo Security\\WindowsLogon\\DuoCredProv.dll'" or tgt.process.cmdline="regsvr32  /u 'C:\\Program Files\\Duo Security\\WindowsLogon\\DuoCredProv.dll'"  or tgt.process.cmdline contains 'process call create "cmd /c regsvr32 /u \'C:\\Program Files\\Duo Security\\WindowsLogon\\DuoCredProv.dll\'"'
