#SingleInstance Force
#Requires Autohotkey v2.0+

; hotString area

::hks::เขียน AutoHotkey Version 2 script
:o:jk::jeeradate Kaowkanchana
; hot string your home address
:o:jkh::บ้านเลขที่ xx/xx `nหมู่ x หมู่บ้านxxxxxxx zz `nตำบลสัตหีบ อำเภอสัตหีบ `nจังหวัดชลบุรี 20180
; hot string for home map
:o:jkm::https://maps.app.goo.gl/sPcJGmUJB8D19Nxv5
::จรด::จีระเดช แก้วกาญจนา
::cdt::{
    A_Clipboard := "" ; Clear the clipboard
    SendInput "{Text}" FormatTime(, "yyyy-MM-dd HH:mm")
}

; Hotkeys

^!l:: Clipchamp()
^!c:: CapCut()
^!s:: SinppingTool()
^!v:: VScode()
^!m:: GMailInChrome()
^!o:: Obsidian()
^!u:: Youtube() ; Youtube & Udemy
^!n:: NotePadPP()
^!h:: HotKeysList()
^!Space:: SleepPC()
^!e:: SciTE4AutoHotkey()
^!F1:: AutoHotkeyHelp() ; Lunch AutoHotkey Help
^!d:: ShutdownPC()

MButton:: CopyAtCursor()

 variable1 := 'test'
; Function area
^F1:: ChromeTabJump()
ChromeTabJump(){
    WinVar:="ahk_class Chrome_WidgetWin_1"
    if ! WinExist(WinVar){
        run("chrome.exe")
        sleep 100

    }
    else{
        if WinActivate("ahk_exe chrome.exe"){
          send("^{tab}")
        }
        else{
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
    Send "^a"
    Sleep("200")
    Send " "
    Sleep("200")
    Send "^v"


    AutoCloseMsgBox("Copy and Paste done", 500, 's30')
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
    run("chrome.exe https://www.udemy.com/course/master-svelte-framework-the-complete-course-2023/learn/lecture/37131978#overview")
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


AutoCloseMsgBox("AutoHotkey load successfully", 1000, 's30')

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