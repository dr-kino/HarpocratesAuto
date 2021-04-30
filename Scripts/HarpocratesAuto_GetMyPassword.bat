@echo off
set DataBase=Database\HarpocratesAuto.kdbx
set CompositeKey=Database\HarpocratesAuto.key
set KeePassDB=Harpocrates Auto

if exist "%DataBase%" (
	echo ### Opening Data Base...
) else (
	echo ### Data Base does not exist
	pause
	goto :EOF
)

echo ### KeyPass %KeePassDB% Data Base ###
set "psCommand=powershell -Command "$pword = read-host '### Enter Password' -AsSecureString ; ^
	$BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
       	[System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p

KPScript -c:GetEntryString "%DataBase%" -pw:%password% -keyfile:"%CompositeKey%" -Field:Password -ref-Title:"HarpocratesAuto" > tmp.txt

KeePass.exe --exit-all

set/pz=<tmp.txt
echo %z%

if "%z%" == "The composite key is invalid!" (
	del tmp.txt
	pause
	goto :EOF
)