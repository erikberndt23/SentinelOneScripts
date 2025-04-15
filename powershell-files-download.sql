/* Powershell file downloads */
/* Detect files being downloaded with powershell */
( ( SrcProcCmdLine Contains Anycase "Net.Web" Or SrcProcCmdLine Contains Anycase "WebRequest" OR SrcProcCmdLine Contains Anycase "BitsTransfer" OR SrcProcCmdLine Contains Anycase "DownloadFile" ) AND EventType = "Command Script" )