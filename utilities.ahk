#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 3  ; Exact matching to avoid confusing T/B with Tab/Backspace.

; Google Search select text - Ctrl + Shift + C
 ^+c::
 {
  Send, ^c
  Sleep 50
  Run, http://www.google.co.uk/search?q=%clipboard%
  Return
 }
return

; Open PowreShell to curren Explorer dir
#IfWinActive ahk_class CabinetWClass ; for use in explorer.
^!h::
ClipSaved := ClipboardAll
Send !d
Sleep 10
Send ^c
Run, powershell.exe -NoExit "cd `"%clipboard%`""
Clipboard := ClipSaved
ClipSaved =
return
#IfWinActive