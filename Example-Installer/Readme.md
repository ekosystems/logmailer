Try logmailer!
---------------

1. Install it with the installer
2. Installer opens up notepad during the install to setup your mail server etc. to parameter area
Please note that if you have email server requiring authentication your need to check blat.net documentation

REM ----------------------Section2 Email options----------------------
REM Emails settings, pretty self explanatory
REM Use comma "," separated values on the the receiver names to define multiple receivers
SET EmailServer=smtp.yourmailserver.fi
SET Subject="Logs from host %computername%"
SET To=receiveraddress@domain.fi
SET Cc=
SET Bcc=
SET From=ae-logmailer@domain.com
SET MessageBody="Logs were sent on host's local time:|%DateEmail% %TimeEmail%||IP address:|%IPaddress%||Hostname:|%computername%||Username:|%username%||Domain:|%userdomain%||Ping result:|%PingTime%||Attached are the log files from:|%LogPath%|%LogPath2%|||--|Sent with AE LogMailer"
REM Pipe will be replaced with line break on the email
REM ----------------------Section2 Email options----------------------

3. Create folder and some files to c:\temp\logmailer-example\*
4. Double click the AE-LogMailer icon on the desktop

