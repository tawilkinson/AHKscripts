EnvGet, upenv, USERPROFILE

MsgBox, 64, Done, %USERPROFILE%\Downloads
counter := 0

loop, %USERPROFILE%\Downloads\*.*, 1, 0
{
    today = %A_Now%
    EnvSub, today, %A_LoopFileTimeModified%, days
    if (today > 60)
    {
        FileRecycle, %A_LoopFileLongPath%
        counter++
    }	
}
MsgBox, 64, Done, Scan completed`, %counter% files recycled 
Return