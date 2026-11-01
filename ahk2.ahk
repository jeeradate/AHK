#Requires AutoHotkey v2
#SingleInstance Force

; ==========================================
; Include เดิมของคุณ (ถ้ามีไฟล์นี้อยู่)
; ==========================================
#Include UIA.ahk

; ==========================================
; ปิด CapsLock ตามระบบเดิมของคุณ
; ==========================================
SetCapsLockState "AlwaysOff"

; ==========================================
; Language Settings (ของเดิมคุณ)
; ==========================================
languageCode1 := 0x0409  ; English (US)
languageCode2 := 0x041E  ; Thai
currentLanguage := languageCode1

; ==========================================
; ตั้งค่าไฟล์ Log
; ==========================================
LogFile := A_ScriptDir "\ComputerUsageLog.txt"

Global StartTime := A_Now
Global SumUse := 0

; ==========================================
; ฟังก์ชันเวลา
; ==========================================
FormatTimeNow() {
    return FormatTime(A_Now, "yyyy-MM-dd HH:mm:ss")
}

; ==========================================
; บันทึกตอนเปิดเครื่อง
; ==========================================
FileAppend("Start Computer at: " FormatTimeNow() "`n", LogFile, "UTF-8")

; ==========================================
; ดักจับ Sleep / Wake
; ==========================================
OnMessage(0x0218, PowerEvent)

PowerEvent(wParam, lParam, msg, hwnd)
{
    Global StartTime, LogFile, SumUse
    
    if (wParam = 0x0004) ; Sleep
    {
        EndTime := A_Now
        UsageDuration := DateDiff(EndTime, StartTime, "Minutes")
        SumUse += UsageDuration

        FileAppend("Sleep - Used: " UsageDuration 
            " Minutes at: " FormatTime(EndTime, "yyyy-MM-dd HH:mm:ss") "`n",
            LogFile, "UTF-8")
    }

    if (wParam = 0x0007) ; Wake
    {
        StartTime := A_Now
        FileAppend("Wake at: " FormatTime(StartTime, "yyyy-MM-dd HH:mm:ss") "`n",
            LogFile, "UTF-8")
    }
}

; ==========================================
; ดักจับ Shutdown / Restart / Logoff
; ==========================================
OnMessage(0x0011, OnShutdown)
OnMessage(0x0016, OnShutdown)

OnShutdown(wParam, lParam, msg, hwnd)
{
    Global StartTime, LogFile, SumUse

    EndTime := A_Now
    UsageDuration := DateDiff(EndTime, StartTime, "Minutes")
    SumUse += UsageDuration

    FileAppend("Shutdown - Used: " UsageDuration 
        " Minutes at: " FormatTime(EndTime, "yyyy-MM-dd HH:mm:ss") "`n",
        LogFile, "UTF-8")

    Sleep 200
}

; ==========================================
; Hotkey เดิมของคุณ (ตัวอย่าง)
; ==========================================
Esc::ExitApp()

; ถ้าคุณมี hotkey สลับภาษาเดิม ให้ใส่ต่อจากนี้
; เช่น:
; ^Space::
; {
;     ToggleLanguage()
; }
