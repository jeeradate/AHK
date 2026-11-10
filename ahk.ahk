#SingleInstance Force
#Requires Autohotkey v2.0+
#include UIA.ahk
; Disable the standard Caps Lock functionality
; SetCapsLockState "AlwaysOff"

; Define the language codes
; languageCode1 := 0x0409  ; English (US)
; languageCode2 := 0x041E  ; Thai
Run("D:\AHK\computerUsage.ahk")
Run("D:\AHK\hotstring.ahk")
; Initialize the current language
; currentLanguage := languageCode1

AutoCloseMsgBox("AutoHotkey load successfully", 1000, 's30')

; ^!  = Ctrl+Alt + key

;^!Space:: SleepPC()
;^!q:: ShutdownPC()
^Up:: CopyAtCursor()
; CapsLock:: SwitchLanguage()


; Function area

; กด Alt + S เพื่อให้อ่านข้อความใน Clipboard

ActivateClock()
{
    ; กำหนดชื่อหรือคลาสของหน้าต่างให้ชัดเจน
    targetWin := "ahk_class ApplicationFrameWindow"
    targetTitle := "Clock" ; หรือ "นาฬิกา" ตามภาษาเครื่องของท่าน

    ; 1. เช็คว่าถ้าหน้าต่าง Clock กำลัง Active (แสดงอยู่หน้าสุด) ให้ Minimize ทันที
    if WinActive(targetWin, targetTitle)
    {
        WinMinimize
        return
    }

    ; 2. ถ้าไม่ได้ Active อยู่ ให้ใช้ Logic เดิมในการเรียกหรือเปิดใหม่
    if WinExist(targetWin, targetTitle)
    {
        WinActivate
    }
    else
    {
        Run "ms-clock:"
        if WinWait(targetWin, targetTitle, 5)
            WinActivate
        else
            return
        Sleep 500 ; รอแอปโหลด UI
    }

    ; คลิกไปที่หน้า Stopwatch (พิกัดที่ท่านปรับจูนมาแล้ว)
    CoordMode "Mouse", "Window"
    Click 79, 181
}
ResetStartClock()
{

    CoordMode "Mouse", "Window" ; ตั้งค่าให้เมาส์อ้างอิงตามพิกัดหน้าต่าง
    Click 836, 379
    Sleep 500 ; รอแอปโหลด UI

    CoordMode "Mouse", "Window" ; ตั้งค่าให้เมาส์อ้างอิงตามพิกัดหน้าต่าง
    Click 655, 379
    sleep 500
    WinMinimize("Clock")
}


; Function to switch between languages
; SwitchLanguage() {
;     global currentLanguage, languageCode1, languageCode2
;     if (currentLanguage == languageCode1) {
;         currentLanguage := languageCode2
;     } else {
;         currentLanguage := languageCode1
;     }
;     PostMessage(0x0050, 0, currentLanguage, , "A")
;     ; บังคับปิดสถานะ CapsLock ไม่ให้ค้างเป็นตัวใหญ่
;     SetCapsLockState("AlwaysOff")
; }


ChromeTabJump() {
    WinVar := "ahk_class Chrome_WidgetWin_1"
    if !WinExist(WinVar) {
        run("chrome.exe")
        sleep 100

    }
    else {
        if WinActivate("ahk_exe chrome.exe") {
            send("^{tab}")
        }
        else {
            WinActivate("ahk_exe chrome.exe")
            Sleep 100
            send("^{tab}")
        }
    }

}

NotePadPP() {
    if (notepadWindow := WinExist("ahk_class Notepad++")) {
        WinActivate notepadWindow
    } else {
        Run "C:\Program Files\Notepad++\notepad++.exe"
        WinWaitActive ("ahk_class Notepad++")

    }

}


CopyAtCursor() {
    ; Get the position of the mouse cursor

    MouseGetPos &OutputVarX, &OutputVarY

    ; Launch Notepad++ and delete all then paste from clip board
    NotePadPP()
    Send "^a"
    Sleep("200")
    Send " "
    Sleep("200")
    Send "^v"
    Sleep("700")
    Send "{Ctrl Down}"

    ; Small delay to ensure Ctrl is registered (adjust if needed)
    Sleep 10

    ; Press Home key down
    Send "{Home Down}"

    ; Small delay before releasing (adjust if needed)
    Sleep 10

    ; Release both keys
    Send "{Home Up}{Ctrl Up}"

    ;AutoCloseMsgBox("Copy and Paste done", 500, 's30')
}


ShutdownPC(force := false)
{
    if (force)
    {

        ; ตรวจสอบว่ามีหน้าต่าง Foxit เปิดอยู่หรือไม่
        if WinExist("ahk_exe FoxitPDFReader.exe")
        {
            WinClose "ahk_exe FoxitPDFReader.exe"
        }


        ; Force shutdown without waiting for applications to close
        Run "shutdown.exe /s /f /t 0"
    }
    else
    {
        ; Normal shutdown, allowing applications to close gracefully
        Run "shutdown.exe /s /t 0"
    }
}


SleepPC()
{
    Sleep 1000
    DllCall("PowrProf.dll\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
}


AutoCloseMsgBox(text, timeout := 50000, size := 's10') {
    ; Create a GUI window
    myGui := Gui()
    myGui.Opt("+AlwaysOnTop")
    myGui.SetFont(size)
    myGui.Add("Text", "x10 y10", text)

    ; Show the GUI window
    myGui.Show("w600 h100")

    ; Set a timer to close the GUI
    SetTimer () => myGui.Destroy(), -timeout

    ; Wait for the GUI to be closed
    WinWaitClose(myGui)
}