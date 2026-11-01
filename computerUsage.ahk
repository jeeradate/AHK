#Requires AutoHotkey v2.0
#SingleInstance Force

Global StartTime := A_Now
Global SleepTime := A_Now
Global ComStart := A_Now
Global SumUse := 0
Global SumBrake := 0
Global LogFile := "D:\AHK\ComputerUsageLog.txt"


; --- ส่วนใหม่: ล้างไฟล์ถ้าเป็นวันใหม่ ---
CheckAndClearLog() {
    Global LogFile
    if FileExist(LogFile) {
        ; ดึงเวลาที่แก้ไขไฟล์ล่าสุดมาดู (YYYYMMDD...)
        FileTime := FileGetTime(LogFile, "M")
        ; เปรียบเทียบเฉพาะ "วันที่" (8 หลักแรก)
        if (SubStr(FileTime, 1, 8) != SubStr(A_Now, 1, 8)) {
            FileDelete(LogFile) ; ถ้าคนละวัน ให้ลบทิ้งเพื่อเริ่มใหม่
        }
    }
}

; เรียกใช้ฟังก์ชันตรวจสอบทันทีที่รันสคริปต์
CheckAndClearLog()
; ... โค้ดส่วน OnMessage และ WindowProc อื่นๆ เหมือนเดิมที่คุณอาทำไว้ครับ ...
; เริ่มต้นวัน
LogEntry := "===== Start A Days : " . FormatTime(StartTime, "dd/MM/yyyy HH:mm:ss") . " =====`n"
FileAppend(LogEntry, LogFile, "UTF-8")

WindowProc(wParam, lParam, msg, hwnd) {
    Global StartTime, LogFile, SumUse, SumBrake, SleepTime

    if (wParam = 0x0004) { ; Sleep
        SleepTime := A_Now
        UsageDuration := DateDiff(SleepTime, StartTime, "Minutes")
        SumUse += UsageDuration

        ; {:3} หมายถึง จองพื้นที่ 3 ตัวอักษร
        UsageStr := Format("{:4}/{:4}", UsageDuration, SumUse)
        LogEntry := "Use  : " . UsageStr . " Minutes Sleep at : " . FormatTime(SleepTime, "HH:mm:ss") . "`n"
        FileAppend(LogEntry, LogFile, "UTF-8")
    }

    if (wParam = 0x0007) { ; WakeUp
        WakeTime := A_Now
        BrakeTime := DateDiff(WakeTime, SleepTime, "Minutes")
        SumBrake += BrakeTime
        StartTime := WakeTime

        BrakeStr := Format("{:4}/{:4}", BrakeTime, SumBrake)
        LogEntry := "Brake: " . BrakeStr . " Minutes Wakeup at: " . FormatTime(WakeTime, "HH:mm:ss") . "`n"
        FileAppend(LogEntry, LogFile, "UTF-8")
    }
}

OnMessage(0x0218, WindowProc)

^Down::
{
    CurrentDuration := DateDiff(A_Now, StartTime, "Minutes")
    ; ใช้ Format ใน MsgBox ด้วยเพื่อให้ดูสวยงาม
    MsgBox "รอบปัจจุบัน: " . CurrentDuration . " นาที`nสะสม (งาน/พัก): " . Format("{:d}/{:d}", SumUse, SumBrake) . " นาที", "Working Time"
}