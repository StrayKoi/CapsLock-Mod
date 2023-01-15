#Requires AutoHotkey v2.0
#SingleInstance Force               ; https://www.autohotkey.com/docs/v2/lib/_SingleInstance.htm
SetWorkingDir A_InitialWorkingDir   ; https://www.autohotkey.com/docs/v2/lib/SetWorkingDir.htm
Persistent                          ; https://www.autohotkey.com/docs/v2/lib/Persistent.htm

;-------------------------------------------------------------------------------

; Disable CapsLock at start
SetCapsLockState "AlwaysOff"

;-------------------------------------------------------------------------------

; Toggle Suspend AutoHotKey
CapsLock & Esc::Suspend

;-------------------------------------------------------------------------------

; Toggle CapsLock Mod On/Off
; When this mod is off, CapsLock key will resume its default function 
#CapsLock::
{
    if GetKeyState("CapsLock", "T") = 1
    ; If original CapsLock is enabled, disable
    {
        SetCapsLockState "AlwaysOff"
    }
    else
    ; Else, enable CapsLock
    {
        SetCapsLockState "AlwaysOn"
    }
    return
}

;-------------------------------------------------------------------------------

; Toggle pin active window (Always On Top)
CapsLock & \::WinSetAlwaysOnTop -1, WinExist("A")

;-------------------------------------------------------------------------------

; Media Keys (Volume and Playlist Controls)

CapsLock & 7::Media_Prev 
CapsLock & 8::Media_Play_Pause 
CapsLock & 9::Media_Next 
CapsLock & 0::Volume_Mute
; Volume Control by increments of 2
CapsLock & -::Volume_Down
CapsLock & =::Volume_Up

; Additional Volume Control (uses Mouse Scroll wheel)
; By increments of 1
CapsLock & WheelUp::
{
    VolumeOSD("+1")
}

CapsLock & WheelDown::
{
    VolumeOSD("-1")
}

VolumeOSD(v)
{
    SoundSetVolume v ; Use a string "+1" or "-1"
    try if shellProvider := ComObject("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}")
        try if flyoutDisp := ComObjQuery(shellProvider, "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}", "{41f9d2fb-7834-4ab6-8b1b-73e74064b465}")
            ComCall(3, flyoutDisp, "int", 0, "uint", 0)
}

;-------------------------------------------------------------------------------
; NumPad (Must hold CapsLock)

CapsLock & ]:: SendInput "{Numpad9}"
CapsLock & [:: SendInput "{Numpad8}"
CapsLock & p:: SendInput "{Numpad7}"

CapsLock & ':: SendInput "{Numpad6}"
CapsLock & SC027:: SendInput "{Numpad5}" ;SC027 = semi-colon
CapsLock & l:: SendInput "{Numpad4}"

CapsLock & /:: SendInput "{Numpad3}"
CapsLock & .:: SendInput "{Numpad2}"
CapsLock & ,:: SendInput "{Numpad1}"
CapsLock & m:: SendInput "{Numpad0}"
