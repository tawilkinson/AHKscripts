#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 3 ; Exact matching to avoid confusing T/B with Tab/Backspace.

; Media keys
^!Space::Send {Media_Play_Pause}
^!Left::Send {Media_Prev}
^!Right::Send {Media_Next}

; Google Search select text - Ctrl + Shift + C
^+c::
    {
        Send, ^c
        Sleep 50
        Run, http://www.google.co.uk/search?q=%clipboard%
        Return
    }
return

; Clean Downloads call, requires cleanDownloads.ahk
; Ctrl + Alt + 0
^!x::
    Run %A_ScriptDir%\cleanDownloads.ahk
return

; Open PowerShell to current Explorer dir - Ctrl + Alt + H
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