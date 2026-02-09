event.type = "Process Creation"
AND (
    src.process.name = "powershell.exe"
    OR src.process.name = "powershell_ise.exe"
    OR src.process.name = "pwsh.exe"
    OR src.process.name = "certutil.exe"
    OR src.process.name = "bitsadmin.exe"
    OR src.process.name = "curl.exe"
    OR src.process.name = "wget.exe"
    OR tgt.process.name = "powershell.exe"
    OR tgt.process.name = "powershell_ise.exe"
    OR tgt.process.name = "pwsh.exe"
    OR tgt.process.name = "certutil.exe"
    OR tgt.process.name = "bitsadmin.exe"
    OR tgt.process.name = "curl.exe"
    OR tgt.process.name = "wget.exe"
)
AND (
    (
        src.process.cmdline contains "http"
        AND NOT (
            src.process.cmdline contains "isos.asti-usa.com"
            OR src.process.cmdline contains "10.1."
            OR src.process.cmdline contains "10.2."
            OR src.process.cmdline contains "10.11."
            OR src.process.cmdline contains "pdq.asti-usa.net"
            OR src.process.cmdline contains "vbr.asti-usa.net"
        )
        AND (
            src.process.cmdline contains "Invoke-WebRequest"
            OR src.process.cmdline contains "iwr"
            OR src.process.cmdline contains "Net.WebClient"
            OR src.process.cmdline contains "DownloadFile"
            OR src.process.cmdline contains "Start-BitsTransfer"
            OR src.process.cmdline contains "DownloadString"
            OR src.process.cmdline contains "-enc"
            OR src.process.cmdline contains "FromBase64String"
            OR src.process.cmdline contains "iex"
        )
    )
    OR (
        src.process.name = "certutil.exe"
        AND src.process.cmdline contains "-urlcache"
        AND src.process.cmdline contains "http"
    )
    OR (
        src.process.name = "bitsadmin.exe"
        AND src.process.cmdline contains "/transfer"
        AND src.process.cmdline contains "http"
    )
    OR (
        src.process.name = "curl.exe"
        AND src.process.cmdline contains "http"
    )
    OR (
        src.process.name = "wget.exe"
        AND src.process.cmdline contains "http"
    )
)
AND NOT (
    (src.process.publisher contains "Microsoft" AND src.process.signedStatus = "signed")
    OR (tgt.process.publisher contains "Microsoft" AND tgt.process.signedStatus = "signed")
    OR src.process.parent.cmdline contains "gpscript.exe"
    OR src.process.parent.name contains "PDQ"
    OR src.process.cmdline contains "PDQ"
    OR src.ip.address contains "10.1."
    OR src.ip.address contains "10.101."
    OR dst.ip.address contains "10.2."
    OR dst.ip.address contains "10.11."
)
