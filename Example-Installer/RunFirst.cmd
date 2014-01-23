@echo off
Title Editing the AE LogMailer parameters

REM Create a folder and drop a file for the example mailer
mkdir c:\temp\logmailer-example\
echo This is your example log file mailed with the AE-LogMailer >>c:\temp\logmailer-example\logmailer-example.log
echo Someone who actually knows something about development ;) >>c:\temp\logmailer-example\logmailer-example.log
echo please visit https://github.com/ekosystems/logmailer >>c:\temp\logmailer-example\logmailer-example.log
echo Thank you for checking this POC! >>c:\temp\logmailer-example\logmailer-example.log

notepad "%PROGRAMFILES%\Ekosystems\LogMailer\LogMailer.cmd"
exit
