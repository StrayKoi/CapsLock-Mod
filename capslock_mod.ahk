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
CapsLock & -::Volume_Down
CapsLock & =::Volume_Up

; Additional Volume Control (uses Mouse Scroll wheel)
CapsLock & WheelUp::Volume_Up
CapsLock & WheelDown::Volume_Down

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
