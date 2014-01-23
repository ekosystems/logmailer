AE-LogMailer
=========

Simple batch script to operate Blat and 7Zip to mail e.g. log files.
---------------------------------------------------------------------
I'm definitely NOT a developer, I can hardly write small scripts with good old batch being my weapon of choice.
I've created this script to help on many different projects I'm involved in. Almost all error checking always starts by support asking to send log files. To make this quick and easy for users that are enlightened enough to double click, I've created this.

Try it!
-------
Under the Example installer folder you can find a installer to quickly try out the script.

Installer
----------
AE-LogMailer installer is done with Inno Setup studio

Blat
------
Blat is a command line tool to send emails and attach files
http://www.blat.net/


7Zip standalone
----------------
One file 7Zip executable that can be operated from command line

Example email
--------------

Below is an example of the script in action. So when user has double clicked the icon on desktop to
trigger AE-LogMailer you'll receive this.

Subject: Logs from host WSnnyyzz

Logs were sent on host's local time:
02.12.2013 14:33

IP address:
1.1.1.2

Hostname:
WSnnyyzz

Username:
user 

Domain:
DOMAIN

Ping result:
Reply from 1.1.1.1: bytes=32 time=18ms TTL=55 



Attached are the log files from:
C:\Program Files\Software\logfile.log 

--
Sent with AE LogMailer