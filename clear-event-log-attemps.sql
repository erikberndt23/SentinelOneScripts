/* Clear event log attempts */
/* Detect attempts to clear event logs using powershell or wveutil */
EventType = "Process Creation" AND TgtProcName ContainsCIS "wevtutil.exe" AND CmdLine ContainsCIS "cl" AND CmdLine ContainsCIS "sec" or EventType = "Process Creation" AND TgtProcName ContainsCIS "powershell.exe" AND SrcProcCmdLine ContainsCIS "clear-eventlog"