/* Detects if a user is added using the 'net add' command */
cmdline matches '(?s)net\\s+user(?!.*\\s+/add).*?\\s+/add'