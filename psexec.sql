/* PSExec */
/* Blocks Psexec processes from running */
tgt.process.displayName contains 'psexec' OR 'psexesvc' OR src.process.displayName contains 'psexec' OR 'psexesvc'