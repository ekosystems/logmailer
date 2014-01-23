; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
; Please observe that the Source and output paths are not relative
; so change them to your working directory

#define MyAppName "AE LogMailer"
#define MyAppVersion "1.0"
#define MyAppPublisher "Ekosystems"
#define MyAppURL "https://github.com/ekosystems/logmailer"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{942E8248-BBE8-4344-AE29-B92529482BF7}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Ekosystems\LogMailer
DisableDirPage=yes
DefaultGroupName=LogMailer
DisableProgramGroupPage=yes
OutputDir=C:\Antti\Git\logmailer\Example-Installer
OutputBaseFilename=AE-LogMailer demo
SetupIconFile=C:\Antti\Git\logmailer\Example-Installer\logmailer.ico
Compression=lzma
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64
PrivilegesRequired=none
InfoBeforeFile=C:\Antti\Git\logmailer\Example-Installer\LogMailer-preinstall-text.txt
AppContact=logmailer@ekonen.net
VersionInfoVersion=1.0
VersionInfoProductName=AE Logmailer
VersionInfoProductVersion=1.0

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Antti\Git\logmailer\Example-Installer\blat311_32.full\blat311-32\*"; DestDir: "{app}\blat32bit\"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Antti\Git\logmailer\Example-Installer\blat311_64.full\blat311-64\*"; DestDir: "{app}\blat64bit\"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "C:\Antti\Git\logmailer\Example-Installer\LogMailer.cmd"; DestDir: "{app}"
Source: "C:\Antti\Git\logmailer\Example-Installer\logmailer.ico"; DestDir: "{app}"
Source: "C:\Antti\Git\logmailer\Example-Installer\7za.exe"; DestDir: "{app}"
Source: "C:\Antti\Git\logmailer\Example-Installer\RunFirst.cmd"; DestDir: "{app}"
Source: "C:\Antti\Git\logmailer\Example-Installer\License.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Antti\Git\logmailer\Example-Installer\gpl.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{commondesktop}\AE LogMailer"; Filename: "{app}\LogMailer.cmd"; WorkingDir: "{app}"; IconFilename: "{app}\logmailer.ico"; IconIndex: 0

[Run]
Filename: "{app}\RunFirst.cmd"; WorkingDir: "{app}"; Description: "Edit the parameters on first run"
