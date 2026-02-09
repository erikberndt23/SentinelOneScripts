event.type = "Behavioral Indicators"
AND indicator.name matches "(?i)Metasploit|CobaltStrike|Meterpreter|PoshC2|PowerSploit|PenetrationFramework|Koadic|Empyre" 
AND src.process.user != "SYSTEM" 
AND tgt.process.integrityLevel != "Low"