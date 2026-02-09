event.type = "Process Creation"
AND tgt.process.name IN ("powershell.exe","pwsh.exe")
AND (
        src.process.cmdline CONTAINS "Invoke-WebRequest"
     OR src.process.cmdline CONTAINS "iwr "
     OR src.process.cmdline CONTAINS "Net.WebClient"
     OR src.process.cmdline CONTAINS "DownloadFile"
     OR src.process.cmdline CONTAINS "Start-BitsTransfer"
     OR src.process.cmdline CONTAINS "bitsadmin"
     OR src.process.cmdline CONTAINS "curl "
     OR src.process.cmdline CONTAINS "wget "
)
AND NOT (
        src.process.parent.name CONTAINS "PDQ"
     OR src.process.parent.displayName CONTAINS "PDQ"
     OR src.process.cmdline CONTAINS "Your-GPO-Script-Name.ps1"
)
