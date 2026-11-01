#SingleInstance Force
#Requires Autohotkey v2.0+
#include UIA.ahk
; #include test.ahk
; The following program is in Autohotkey Version 2 for autamate things to do on Windows PC

; Disable the standard Caps Lock functionality for use it for keyboard language switching
SetCapsLockState "AlwaysOff"

; Following is the hot key
::ahks::create AutoHotkey v2 script to
::cts::Camtasia 2023
:o:จรด::จีระเดช แก้วกาญจนา
:o:jk::jeeradate Kaowkanchana
; hot string your home address
:o:บ้านจรด::บ้านเลขที่ 58/33 `nหมู่ 5 หมู่บ้านรามนุช 18 `nตำบลสัตหีบ อำเภอสัตหีบ `nจังหวัดชลบุรี 20180
:o:jkh::บ้านเลขที่ 58/33 `nหมู่ 5 หมู่บ้านรามนุช 18 `nตำบลสัตหีบ อำเภอสัตหีบ `nจังหวัดชลบุรี 20180
:o:jkhe::No. 58/33, Moo 5, Ramanuch Village 18, Sattahip Subdistrict, Sattahip District, Chon Buri Province 20180
; hot string for home map
:o:jkm::https://maps.app.goo.gl/7TKuWF8YfpZHhDeD9
::sq::We have Sveltekit with Skeleton ui and typescript how to
::aq::Related to Automation app from llamalab
::sp::page.svelte`n
::cdt:: {
    A_Clipboard := "" ; Clear the clipboard
    SendInput "{Text}" FormatTime(, "yyyy-MM-dd HH:mm")
}




::af::() =>
; ::ahk:: AutoHotkey
::jp::JkPlan01`n
:o:coz::<script>`n`n</script>`n`n`n<style>`n`n</style>
; Hotkeys

^Numpad1:: { 
    Send("1'")
} 
^Numpad2:: { 
    Send("2'")
} 
^Numpad3:: { 
    Send("3'")
} 
^Numpad4:: { 
    Send("4'")
} 
^Numpad5:: { 
    Send("5'")
} 
^Numpad6:: { 
    Send("6'")
} 
^#Numpad7:: { 
    Send("7'")
} 
#Numpad1:: { 
    Send("1.")
} 
#Numpad2:: { 
    Send("2.")
} 
#Numpad3:: { 
    Send("3.")
} 
#Numpad4:: { 
    Send("4.")
} 
#Numpad5:: { 
    Send("5.")
} 
#Numpad6:: { 
    Send("6.")
} 
#Numpad7:: { 
    Send("7.")
} 


^!l:: Clipchamp()
^!c:: CapCut()
^!s:: SinppingTool()
^!v:: VScode()
^!m:: GMailInChrome()
^!o:: Obsidian()
^!u:: Youtube() ; Youtube & Udemy
^!a:: UIA
^!h:: HotKeysList()
^!Space:: SleepPC()
^!e:: SciTE4AutoHotkey()
^!F1:: AutoHotkeyHelp() ; Lunch AutoHotkey Help
^!q:: ShutdownPC()

^Up:: CopyAtCursor()
^Down:: SwitchBraveBrowser()
CapsLock:: SwitchLanguage()
; ^Left:: SwitchChromeBrowser() ; Ctrl+Left Arrow hotkey
; ^Right:: SwitchEdgeBrowser()
;^!t::myGui()






; Hotkey to manually reset the timer (optional)
^!F12:: ResetAndStartTimer()  ; Ctrl+Alt+F12




; Function area

CloseLineMedia() {
    if WinExist("ahk_class Qt663QWindowIcon") {
        WinClose
    }
}

SwitchChromeBrowser() {
    if WinActive("ahk_exe chrome.exe")
    {
        if WinExist("ahk_exe msedge.exe")
            WinActivate
        else
            Run "msedge.exe"
    }
    else if WinActive("ahk_exe msedge.exe")
    {
        if WinExist("ahk_exe chrome.exe")
            WinActivate
        else
            Run "chrome.exe"
    }
    else
    {
        if WinExist("ahk_exe chrome.exe")
            WinActivate
        else if WinExist("ahk_exe msedge.exe")
            WinActivate
        else
            Run "chrome.exe"
    }
}
SwitchBraveBrowser() {
    if WinActive("ahk_exe brave.exe")
    {
        if WinExist("ahk_exe brave.exe")
            WinActivate
        else
            Run "msedge.exe"
    }
    else if WinActive("ahk_exe brave.exe")
    {
        if WinExist("ahk_exe brave.exe")
            WinActivate
        else
            Run "brave.exe"
    }
    else
    {
        if WinExist("ahk_exe brave.exe.exe")
            WinActivate
        else if WinExist("ahk_exe brave.exe")
            WinActivate
        else
            Run "brave.exe"
    }
}
SwitchEdgeBrowser() {
    if WinActive("ahk_exe msedge.exe")
    {
        if WinExist("ahk_exe msedge.exe")
            WinActivate
        else
            Run "msedge.exe"
    }
    else if WinActive("ahk_exe msedge.exe")
    {
        if WinExist("ahk_exe msedge.exe")
            WinActivate
        else
            Run "edge.exe"
    }
    else
    {
        if WinExist("ahk_exe msedge.exe")
            WinActivate
        else if WinExist("ahk_exe msedge.exe")
            WinActivate
        else
            Run "edge.exe"
    }
}

; Define the language codes
languageCode1 := 0x0409  ; English (US)
languageCode2 := 0x041E  ; Thai

; Initialize the current language
currentLanguage := languageCode1

; Work to long reminder


; กำหนดช่วงเวลาในการเตือน (เป็นมิลลิวินาที)
reminderInterval := 3000000  ; 50 นาที 3000000

; ฟังก์ชันแสดงข้อความเตือน
ShowReminder() {
;    MsgBox( "คุณได้ทำงานมา 50 นาทีแล้ว! ควรพักสายตาสักครู่", "เตือนความจำ", "OK T10" )
}

; รีเซ็ตและเริ่มต้นตัวจับเวลา
ResetAndStartTimer() {
    SetTimer( ShowReminder, 0)  ; Clear any existing timer
    SetTimer( ShowReminder, reminderInterval ) ; Set new timer
    MsgBox("Timer Reset","Set","OK T1" )
}

; ตรวจสอบเหตุการณ์ปลุกจากโหมดสลีป
If A_EventInfo = "Wake"
{
    ; รีเซ็ตและเริ่มต้นตัวจับเวลาเมื่อเครื่องคอมพิวเตอร์ตื่นจากโหมดสลีป
    ResetAndStartTimer()
}
; Monitor for system startup or wake from sleep
OnMessage(0x0218, WM_POWERBROADCAST)
WM_POWERBROADCAST(wParam, lParam, msg, hwnd) {
    if (wParam == 18) {  ; PBT_POWERSETTINGCHANGE
        ResetAndStartTimer()
    }
}

; Start the timer on script startup
ResetAndStartTimer()


UIAActivate() {
    try {

        ; Get the active window
        activeWindow := UIA.GetFocusedElement()

        ; Get the window title
        windowTitle := activeWindow.Name

        ; Display the window title
        MsgBox("Active window title: " . windowTitle)
    } catch as err {
        MsgBox("Error: " . err.Message)
    }
}
; Function to switch between languages
SwitchLanguage() {
    global currentLanguage, languageCode1, languageCode2
    if (currentLanguage == languageCode1) {
        currentLanguage := languageCode2
    } else {
        currentLanguage := languageCode1
    }
    PostMessage(0x0050, 0, currentLanguage, , "A")
}

; Bind Caps Lock key to switch language

^F12:: ChromeTabJump()
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

NotePad() {

    if (notepadWindow := WinExist("ahk_class Notepad")) {
        WinActivate notepadWindow
    } else {
        Run "notepad.exe"
        WinWaitActive ("ahk_class Notepad")

    }

}

CopyAtCursor() {

    ; Launch Notepad++ and delete all then paste from clip board
    NotePadPP()
    sleep("200")
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
        ; Force shutdown without waiting for applications to close
        Run "shutdown.exe /s /f /t 0"
    }
    else
    {
        ; Normal shutdown, allowing applications to close gracefully
        Run "shutdown.exe /s /t 0"
    }
}


Youtube()
{ ; open youtube in Chrome

    run("chrome.exe https://www.youtube.com")
    ;   run("chrome.exe https://www.udemy.com/course/master-svelte-framework-the-complete-course-2023/learn/lecture/37131978#overview")
    Run("chrome.exe https://www.udemy.com/course/flutter-nodejs-express-mongodb-build-multi-store-app/learn/lecture/43975326#overview")
}


CapCut()
{
    if (sciteWindow := WinExist("ahk_class Qt622QWindowIcon")) {
        WinActivate sciteWindow
    }
    else {
        run("C:\Users\Jeeradate\AppData\Local\CapCut\Apps\CapCut.exe --src3")
    }
}


SleepPC()
{
    DllCall("PowrProf.dll\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
}


SciTE4AutoHotKey()
{
    if (sciteWindow := WinExist("ahk_class SciTEWindow")) {
        WinActivate sciteWindow
    } else {
        Run("C:\Program Files\AutoHotkey\SciTE\SciTE.exe")
    }

}

AutoHotkeyHelp()
{
    if (AWindow := WinExist("ahk_class HH Parent")) {
        WinActivate AWindow
    } else {
        Run("https://www.autohotkey.com/docs/v2/")
        ;Run "C:\Program Files\AutoHotkey\V2\AutoHotkey.chm"
    }

}

; open Gmail in Chrome for unread mail
GMailInChrome() {
    run("chrome.exe https://mail.google.com/mail/u/0/?shva=1#inbox")
}

;{  sleep 100}
;    send("/")
;    sleep 75
;    send("is:unread {Enter}")
;}


;Hot key list

HotKeysList()
{
    if WinExist("HotKeysList") {
        WinActivate
    }
    else {
        Run "C:\Program Files\AutoHotkey\HotkeyList\HotKeysList.exe"
        ;run 'https://www.nirsoft.net/utils/hot_keys_list.html'
    }
}


Obsidian()    ; Ctrl+Alt+o
{

    if WinExist("ahk_exe Obsidian.exe") {
        WinActivate
    }
    else {
        Run "C:\Users\Jeeradate\AppData\Local\Programs\Obsidian\Obsidian.exe  'G:\My Drive\DriveSyncFiles\Obsidian\Jk'"

    }
}

Clipchamp() {
    if (clipchampWindow := WinExist("ahk_exe Clipchamp.exe")) {
        WinActivate clipchampWindow
    } else {
        Run "shell:AppsFolder\Clipchamp.Clipchamp_yxz26nhyzhsrt!App"
    }
}

SinppingTool()
{
    if WinExist("ahk_class XamlWindow") { ;ahk_exe SnippingTool.exe
        WinActivate
    }
    else {
        ;run "C:\Users\Jeeradate\AppData\Local\Microsoft\WindowsApps\Snipping Tool.exe"

        run "C:\Users\Jeeradate\AppData\Local\Microsoft\WindowsApps\Snippingtool.exe"
    }
}


VScode() {

    if WinExist("ahk_exe Code.exe") {
        WinActivate
    }
    else {
        Run "C:\Users\Jeeradate\AppData\Local\Programs\Microsoft VS Code\Code.exe"

    }
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


AutoCloseMsgBox("AutoHotkey load successfully", 1000, 's30')