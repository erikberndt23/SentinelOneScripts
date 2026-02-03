/* Block commonly abused remote access tools */
event.type = "Process Creation"
AND (
  src.process.name contains:anycase "anydesk"
  OR src.process.name contains:anycase "rustdesk"
  OR src.process.name contains:anycase "splashtop"
  OR src.process.name contains:anycase "screenconnect"
  OR src.process.name contains:anycase "logmein"
  OR src.process.name contains:anycase "gotomypc"
  OR src.process.name contains:anycase "dwrcc"
  OR src.process.name contains:anycase "nxserver"
  OR src.process.name contains:anycase "zaservice"
  OR src.process.name contains:anycase "thincast"
)
AND (
  src.process.path contains:anycase "\\Users\\"
  OR src.process.path contains:anycase "\\Downloads\\"
  OR src.process.path contains:anycase "\\Desktop\\"
  OR src.process.path contains:anycase "\\Temp\\"
  OR src.process.path contains:anycase "\\AppData\\"
)
AND NOT (
  src.process.path contains:anycase "\\Program Files\\"
  OR src.process.path contains:anycase "\\Program Files (x86)\\"
)
AND NOT (
  src.process.name contains:anycase "teamviewer"
  OR src.process.name contains:anycase "pdqconnect"
  OR src.process.name contains:anycase "pdqagent"
)

/* Block commonly abused remote access tools launched from scripting engines */
event.type = "Process Creation"
AND (
  src.process.name contains:anycase "anydesk"
  OR src.process.name contains:anycase "rustdesk"
  OR src.process.name contains:anycase "splashtop"
  OR src.process.name contains:anycase "screenconnect"
)
AND src.parent.process.name contains:anycase (
  "powershell",
  "cmd",
  "wscript",
  "cscript",
  "mshta"
)