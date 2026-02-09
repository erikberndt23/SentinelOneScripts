/* Logs Writes to PerfLogs Directory */

(
  event.type = "FileCreate"
  OR event.type = "FileWrite"
  OR event.type = "FileModification"
)
AND tgt.file.path contains:anycase "C:\\PerfLogs\\"
AND NOT (
  src.process.name contains:anycase "perfmon"
  OR src.process.name contains:anycase "logman"
  OR src.process.name contains:anycase "svchost"
)
AND (
  src.process.path contains:anycase "\\Users\\"
  OR src.process.path contains:anycase "\\Temp\\"
  OR src.process.path contains:anycase "\\AppData\\"
)