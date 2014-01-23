@echo off
title AE LogMailer
color 0A
Mode con: cols=80 lines=50

REM Working example emailing c:\temp\logmailer-example\*
REM So you need to create that folder and add some files there.

REM -------------CLOSE THIS AND THE INSTALLATION WILL FINNISH-----------------------------
REM This opens up during installation so you can configure stuff down at the parameter area
REM              ADMINS AT LEAST CHANGE THE EMAIL SETTINGS!!!
REM -------------CLOSE THIS AND THE INSTALLATION WILL FINNISH-----------------------------

REM           * ********************* 2013 ********************** *
REM           * * Simple "AE LogMailer" script :) by A. Ekonen*** *
REM           * *Free to use and distribute, blat according to ** *
REM           * ********http://www.blat.net/ and 7Zip************ *
REM           * ********* according to http://7zip.org ********** *
REM           * Installs to c:\Program files\Ekosystems\logmailer *
REM           * Please read the comments carefully before editing *
REM           * Unless you know what you are doing only edit the  *
REM           * parameter area. Happy mailing, hopefully it helps *
REM           *****************************************************

REM Defining some general variables
REM define %dt% for file names to be in form of dd-mm-yyyy_hh-mm
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set dt=%dt:~6,2%%dt:~4,2%%dt:~0,4%_%dt:~8,2%%dt:~10,2%

REM To find log file when folder name is based on date, create variable day containing day number e.g. 27 
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set day=%%a
set day=%day:~6,2%

REM create variable DateEmail containing date in dd.mm.yyyy
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set DateEmail=%%a
set DateEmail=%DateEmail:~6,2%.%DateEmail:~4,2%.%DateEmail:~0,4%

REM create variable TimeEmail containing time in hh:mm
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set TimeEmail=%%a
set TimeEmail=%TimeEmail:~8,2%:%TimeEmail:~10,2%

REM To find log files in a folder which name is based on date, create variable day containing day number e.g. 27 
REM So with this one can find logs files on the 27th in e.g. c:\temp\logs\27\
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set day=%%a
set day=%day:~6,2%

REM Find out computer IP address
for /f "delims=[] tokens=2" %%a in ('ping -4 %computername% -n 1 ^| findstr "["') do (set IPaddress=%%a)

REM Set temp folder to store the logs, whole folder will be zipped sent and then deleted
SET CopyLogsToFolder=c:\temp\Log-%computername%\
MKDIR %CopyLogsToFolder%
REM SET CopyLogsToFolder2=PathToSecondFiles

REM        EDIT-HERE-EDIT-HERE-EDIT-HERE-EDIT-HERE-EDIT-HERE-EDIT-HERE
REM      ********************!!!!!!!!!!!!!!!!****************************
REM      !!!!!!!!!!!!!!!!! Parameter area - Edit below !!!!!!!!!!!!!!!!!!
REM      ********************!!!!!!!!!!!!!!!!****************************
REM      

REM Ping time to a chosen host will be written to PingTime, comment out and you wont send it
SET PingHost=www.google.com

for /f "delims=" %%a in ('ping -4 %PingHost% -n 1 -w 3000 ^| findstr "Reply"') do (set PingTime=%%a)
ping -4 %PingHost% -n 1 -w 3000 >nul 
if %errorlevel%==1 set PingTime=No response from %PingHost% ! Ping timeout was set to 3 seconds, maybe there are network problems or %PingHost% is not available from this host or network.

REM ----------------------Section1 log file paths and copy-------------
REM Usually logs needs to be copied first if the process is running, so we copy everything to temp folder
REM %CopyLogsToFolder% and zip the whole folder and send it.

REM Simple log example below I want to rename the file with computername and date+time on the name

SET LogPath=c:\temp\logmailer-example\*
Copy %LogPath% %CopyLogsToFolder%log-%computername%_%dt%.log

REM Another logs to copy, when copying a folder add * after back slash
REM Note this is an example where the log is in a folder which name is date
REM SET LogPath2=c:\temp\LogLocation\%day%\*
REM Copy %LogPath2% %CopyLogsToFolder%

REM ----------------------Section1 log file paths and copy-------------

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

REM      ****************************************************************
REM      !!!!!!!!!!!!! Parameter area - Editing stops here !!!!!!!!!!!!!!
REM      ****************************************************************

REM AttachmentPath is the path to the attachment to the file we want to attach to the email
REM NOTE if you change something here, you need to change the %Zipper% and %CopyLogsToFolder% too
REM Use comma "," separated values AttachmentPath to define multiple files
REM NOTE that if you want to attach text file Blat command -attacht should be used instead of -attach like on the script now

SET AttachmentPath=c:\temp\logs-%computername%_%dt%.zip

REM ----------------------Section3 Blat and 7Zip variables------------
REM 7Zip and Blat settings
REM Below chooses the correct blat.exe version between 32bit and 64bit, default 32bit
SET WinVersion=32
IF DEFINED PROGRAMFILES(x86) SET X64=TRUE
IF DEFINED X64 SET WinVersion=64

REM ProgramPath is the path to Blat runtime based on the WinVersion
SET ProgramPath="%PROGRAMFILES%\Ekosystems\LogMailer\blat%WinVersion%bit\full\blat.exe"

REM Zipper is the command to 7zipa.exe and filename and to use zip-format
REM Creates a logs zip c:\temp\logs-%computername%.zip add multiple with examples below
SET Zipper="%PROGRAMFILES%\Ekosystems\LogMailer\7za.exe" a -r -tzip %AttachmentPath% %CopyLogsToFolder%
REM SET Zipper2="%PROGRAMFILES%\Ekosystems\LogMailer\7za.exe a -tzip c:\temp\logs-%computername%-2.zip CopyLogsToFolder2"
REM ----------------------Section3 Blat and 7Zip variables------------


cls
REM Show the user that something is happening.....

echo ---------------------Picking up logs------------------------
echo.
echo.
echo Logs are picked up from: 
echo %LogPath%
echo %LogPath2%
echo.
echo to %AttachmentPath%
echo.
echo Logs will be sent to:
echo %To%
echo.
echo.
echo -------------------Done Picking up logs---------------------

REM Stupid wait command but does the trick for three seconds :)
ping 10.99.99.99 -n 1 -w 3000 > nul

echo.
echo -------------------Zipping the log files--------------------
REM Actual magic happens below
%Zipper%
REM %Zipper2%
echo.
echo ----------------Done Zipping the log files------------------
echo.
REM Stupid wait command but does the trick for two seconds :)
ping 10.99.99.99 -n 1 -w 2000 > nul
echo.
echo -------------------Sending the log files--------------------
echo.
REM Blat commands, add  -cc %To% -bcc %Bcc% if you want to use those on the mail
%ProgramPath%  -to %To% -subject %Subject% -body %MessageBody% -serverSMTP %EmailServer% -attach %AttachmentPath% -mailfrom %From%
echo.
echo ----------------Done Sending the log files------------------
echo.
echo.
echo  ------------------------------------------------------------
echo   Great! Sending is done, continuing will close the window..
echo  ------------------------------------------------------------
echo.

REM Clean up
RMDIR /S /Q %CopyLogsToFolder%
DEL %AttachmentPath%
Pause
cls
color 0F
exit