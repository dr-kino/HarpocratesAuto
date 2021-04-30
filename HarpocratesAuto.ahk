;----------------------------------------------------------------------------------
; HarpocratesAuto: HarpocratesAuto settings for AutoHotKey
;----------------------------------------------------------------------------------

;----------------------------------------------------------------------------------
; Including sub folders
;----------------------------------------------------------------------------------
#Include *i %A_Script%\Settings\HarpocratesAuto_Settings.ahk
;----------------------------------------------------------------------------------

;----------------------------------------------------------------------------------
; Suspends all hotkeys and hotstrings except those explained in the Remarks section
; <Ctrl+Alt+S>
;----------------------------------------------------------------------------------
^!s::Suspend
;----------------------------------------------------------------------------------

;----------------------------------------------------------------------------------
; Getting Passwords - My Password
; <pswd@test+TAB>
;----------------------------------------------------------------------------------
::pswd@ha::
TempVar := "Error"
RunWait Scripts\HarpocratesAuto_GetMyPassword.bat
FileReadLine, Contents, tmp.txt, 1
if ErrorLevel {
	MsgBox Keybind Failed: Data base doesn't exist or wrong master key 
	return
}
else
{
	SendRaw %Contents%
	file := FileOpen("tmp.txt", "w")
	file.write("!Wrinting some garbage into the file!")
	file.close()
	FileDelete, tmp.txt
}
return
;----------------------------------------------------------------------------------