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
; Getting Passwords - My Password HarpocratesAuto A
; <pswd@haa+TAB>
;----------------------------------------------------------------------------------
::pswd@haa::
TempVar := "Error"
RunWait Scripts\HarpocratesAuto_GetMyPassword.bat Database\HarpocratesAuto.kdbx Database\HarpocratesAuto.key "Harpocrates Auto A" HarpocratesAuto_A
FileReadLine, ContentsA, tmp.txt, 1
if ErrorLevel {
	MsgBox Keybind Failed: Data base doesn't exist or wrong master key 
	return
}
else
{
	SendRaw %ContentsA%
	file := FileOpen("tmp.txt", "w")
	file.write("!Wrinting some garbage into the file!")
	file.close()
	FileDelete, tmp.txt
}
return
;----------------------------------------------------------------------------------

;----------------------------------------------------------------------------------
; Getting Passwords - My Password HarpocratesAuto B
; <pswd@hab+TAB>
;----------------------------------------------------------------------------------
::pswd@hab::
TempVar := "Error"
RunWait Scripts\HarpocratesAuto_GetMyPassword.bat Database\HarpocratesAuto.kdbx Database\HarpocratesAuto.key "Harpocrates Auto B" HarpocratesAuto_B
FileReadLine, ContentsB, tmp.txt, 1
if ErrorLevel {
	MsgBox Keybind Failed: Data base doesn't exist or wrong master key 
	return
}
else
{
	SendRaw %ContentsB%
	file := FileOpen("tmp.txt", "w")
	file.write("!Wrinting some garbage into the file!")
	file.close()
	FileDelete, tmp.txt
}
return
;----------------------------------------------------------------------------------