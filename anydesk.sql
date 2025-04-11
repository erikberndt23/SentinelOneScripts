/* AnyDesk*/
/* Blocks AnyDesk processes from running */

tgt.process.displayName contains 'anydesk' OR src.process.displayName contains 'anydesk' OR src.process.cmdline contains "AnyDesk.exe"