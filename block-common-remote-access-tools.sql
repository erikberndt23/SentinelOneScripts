/* Block commonly abused remote access tools */
event.type == "Process Creation" AND src.process.name matches:anycase ("splashtop", "screenconnect", "anydesk", "teamviewer","logmein")