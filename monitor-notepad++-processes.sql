/* Monitor Notepad++ Process Creation of Suspicious Child Processes */
event.type='Process Creation' 
AND src.process.name = "notepad++.exe" 
AND tgt.process.name in (
    'cmd.exe', 'powershell.exe', ' pwsh.exe', 'wscript.exe', 'cscript.exe', 'mshta.exe', 'rundll32.exe'
    )