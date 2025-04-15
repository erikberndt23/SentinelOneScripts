/* PSExec */
/* Blocks PSExec processes from running */
tgt.process.displayName contains 'psexec' OR 'psexesvc' OR src.process.displayName contains 'psexec' OR 'psexesvc' OR indicator.name = 'ServiceCreate' AND indicator.metadata contains 'PSEXESVC'