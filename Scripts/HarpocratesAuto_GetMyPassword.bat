@echo off
set Database=%1
set CompositeKey=%2
set KeePassDBName=%3
set ReferenceTitle=%4

if exist "%Database%" (
	echo ### Opening Database...
) else (
	echo ### Database does not exist
	pause
	goto :EOF
)

echo ### KeyPass %KeePassDBName% Database ###
set "psCommand=powershell -Command "$pword = read-host '### Enter Password' -AsSecureString ; ^
	$BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
       	[System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p

KPScript -c:GetEntryString "%Database%" -pw:%password% -keyfile:"%CompositeKey%" -Field:Password -ref-Title:"%ReferenceTitle%" > tmp.txt

KeePass.exe --exit-all

set/pz=<tmp.txt
echo %z%

if "%z%" == "The composite key is invalid!" (
	del tmp.txt
	pause
	goto :EOF
)