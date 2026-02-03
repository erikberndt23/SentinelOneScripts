/* Known Credential Dumping Tools by Name */
event.type = 'Process Creation' AND src.process.name = "mimikatz.exe" OR src.process.name = "pwdump.exe" OR src.process.name = "procdump.exe" OR src.process.name = "lsadump.exe" OR src.process.name = "procdump.exe" OR src.process.name = "nanodump.exe" OR src.process.name = "laZagne.exe"
/* Known Credential Dumping Tools by Behavior */
event.type = "Process Creation" AND src.process.cmdline CONTAINS "lsass" OR src.process.cmdline CONTAINS "sekurlsa" OR src.process.cmdline CONTAINS "logonpasswords" OR src.process.cmdline CONTAINS "minidump" AND src.process.name NOT IN ("taskmgr.exe") AND src.process.name NOT IN ("werfault.exe" )
/* LSASS Memory Dumping */
event.type = "Process Creation" AND src.process.cmdline CONTAINS "lsass" AND src.process.cmdline CONTAINS "dump" AND src.process.user != "SYSTEM"
/* Procdump Dumping LSASS */
event.type = "Process Creation" AND src.process.name = "procdump.exe" AND src.process.cmdline CONTAINS "lsass"