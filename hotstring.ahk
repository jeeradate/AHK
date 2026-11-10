#Requires Autohotkey v2.0+
#SingleInstance Force
; caplock for switch language
SetCapsLockState "AlwaysOff"
languageCode1 := 0x0409  ; English (US)
languageCode2 := 0x041E  ; Thai
currentLanguage := languageCode1
CapsLock:: SwitchLanguage()
SwitchLanguage() {
    global currentLanguage, languageCode1, languageCode2
    if (currentLanguage == languageCode1) {
        currentLanguage := languageCode2
    } else {
        currentLanguage := languageCode1
    }
    PostMessage(0x0050, 0, currentLanguage, , "A")
    ; บังคับปิดสถานะ CapsLock ไม่ให้ค้างเป็นตัวใหญ่
    SetCapsLockState("AlwaysOff")
}
;end of switch language
global IsOnlinePrev := true
global hsGui
CheckInterval := 60000 ; ตรวจสอบทุกๆ 1 นาที (สามารถปรับเวลาได้ตามต้องการ เช่น 60000 = 1 นาที)

; เริ่มต้นการทำงานแบบ Loop ตรวจสอบตามเวลาที่กำหนด
SetTimer(CheckInternetConnection, CheckInterval)
CheckInternetConnection() ; ตรวจสอบทันทีเมื่อเปิดสคริปต์

/**
 * ฟังก์ชันตรวจสอบสถานะการเชื่อมต่ออินเทอร์เน็ตและแจ้งเตือนผ่าน Pop-up ขนาดใหญ่
 * @returns {void}
 */
CheckInternetConnection() {
    global IsOnlinePrev
    TestUrl := "https://www.google.com"
    isOnlineCurrent := false

    try {
        whr := ComObject("WinHttp.WinHttpRequest.5.1")
        whr.Open("GET", TestUrl, true)
        whr.Send()
        whr.WaitForResponse(3) ; รอผลลัพธ์ไม่เกิน 3 วินาที

        if (whr.Status == 200) {
            isOnlineCurrent := true
        }
    } catch {
        isOnlineCurrent := false
    }

    ; ตรวจสอบว่าสถานะการเชื่อมต่อมีการเปลี่ยนแปลงจากรอบก่อนหน้าหรือไม่
    if (isOnlineCurrent != IsOnlinePrev) {
        if (isOnlineCurrent) {
            ; กรณี: อินเทอร์เน็ตกลับมาใช้งานได้แล้ว (แสดง MsgBox เด้งบอก แล้วปิดเองใน 3 วินาที)
            MsgBox("✅ อินเทอร์เน็ตเชื่อมต่อเรียบร้อยแล้ว!", "Network Status", "T3 64")
        } else {
            ; กรณี: อินเทอร์เน็ตหลุด (แสดง MsgBox เตือนตัวใหญ่กลางจอ ต้องกด OK ถึงจะหาย)
            MsgBox("⚠️ อินเทอร์เน็ตหลุด! กรุณาตรวจสอบการเชื่อมต่อของคุณ", "Network Warning", "T3 64")
        }
        ; อัปเดตสถานะปัจจุบันเก็บไว้เทียบในรอบถัดไป
        IsOnlinePrev := isOnlineCurrent
    }
}
#HotIf WinActive("ahk_exe LINE.exe") or WinActive("ahk_exe brave.exe") or WinActive("ahk_exe google.exe")

$Enter:: Send "+{Enter}"
$RCtrl:: Send "{Enter}"

#HotIf
; -------------------------------------------------------------
; สร้างหน้าต่าง GUI สำหรับแสดงรายการ Hotstring
; -------------------------------------------------------------
hsGui := Gui("+AlwaysOnTop +ToolWindow", "💡 Hotstring Cheat Sheet")
hsGui.SetFont("s10 Bold", "Segoe UI")
hsGui.Add("Text", "w420 cBlue", "CTRL+ Spacebar เพื่อเปิด/ปิด จอนี้(กด Esc /enter เพื่อปิด):")

; เปลี่ยนกลับมาใช้ฟอนต์ปกติสำหรับ ListBox ด้านล่าง
hsGui.SetFont("s15 Norm", "Segoe UI")
lv := hsGui.Add("ListView", "w520 h900 -Multi Grid", ["Hotstring / คำสั่ง", "คำอธิบาย / รายละเอียด"])

; เพิ่มข้อมูลลงใน ListView (แยกเป็น 2 คอลัมน์อย่างเป็นระเบียบ)
lv.Add(, "..tk", "พิมพ์ข้อความ '🆒 Thank you very much 💞😀'")
lv.Add(, "..w", "คืออะไร ไว้ทำอะไร มีประโยชน์อะไรใน Python")
lv.Add(, "..list", "แสดงรายการ Hotstring ")
lv.Add(, "..ct", "พิมพ์วันที่และเวลาปัจจุบัน")
lv.Add(, "..jkt", "พิมพ์ชื่อ 'จีระเดช แก้วกาญจนา'")
lv.Add(, "..jke", "พิมพ์ชื่อ 'Jeeradate Kaewkanjana'")
lv.Add(, "..hat", "พิมพ์ที่อยู่บ้านไทย")
lv.Add(, "..hae", "พิมพ์ที่อยู่บ้านอังกฤษ")
lv.Add(, "..oha", "พิมพ์ที่อยู่บ้านที่ระยอง")
lv.Add(, "..map", "พิมพ์ Google Maps ของบ้าน")
lv.Add(, "..mail", "พิมพ์ Gmail")
lv.Add(, "..tel", "พิมพ์ เบอร์โทรศัพท์")
lv.Add(, "..fwp", "เปิด Fastwork Profile")
lv.Add(, "..r", "พิมพ์ uv run python")
lv.Add(, "..a", "พิมพ์ .venv\Scripts\activate")
lv.Add(, "..od", "เปิดโปรแกรม Obsidian ")
lv.Add(, "..c", "เปิดโปรแกรม VSCode")
lv.Add(, "..p", "เปิด Paint วาดรูป")
lv.Add(, "..calc", "เปิดโปรแกรม Calculator")
lv.Add(, "..np", "เปิดโปรแกรม Notepad++")
lv.Add(, "..st", "เปิด Snipping Tool")
lv.Add(, "..yt", "เปิด YouTube")
lv.Add(, "..m", "เปิด Gmail")
lv.Add(, "..mc", "เปิด Gmail และ Google Calendar")
lv.Add(, "..fwp", "เปิด Fastwork Profile")
lv.Add(, "..fwf", "เปิด Fastwork FreelancerProfile (อีกอัน)")
lv.Add(, "..web", "เปิดเว็บไซต์ Google")
lv.Add(, "..ahkh", "เปิด AutoHotkey v2 help")
lv.Add(, "..hkl", "เปิด HotKeysList")
lv.Add(, "..hs", "เปิด Autohotkey ใน VSCode")
lv.Add(, "..sp", "เปิด asample ใน VSCode")
lv.Add(, "..cs", "ปิดหน้าจอ Monitor (Sleep Monitor)")
lv.Add(, "..caa", "Close active app ALT+F4")
lv.add(, "..it", "ตรวจสอบสถานะอินเทอร์เน็ต )")
lv.Add(, "Ctrl+Space", "เปิด/ปิดหน้าต่าง Hotstring Cheat Sheet")
lv.Add(, "Ctrl+,", "Right arrow เฉพาะใน VSCode")
lv.Add(, "Shift+Ctrl+,", "Down arrow เฉพาะใน VSCode")
lv.Add(, "ctrl+Alt+Space", "Sleep the computer")
lv.Add(, "ctrl+Alt+Q", "Shutdown the computer (force)")
btnReload := hsGui.Add("Button", "Default w200 x170", "Reload Hotstring")
btnReload.OnEvent("Click", (*) => reload())
; เมื่อกดปุ่ม Esc ให้ซ่อนหน้าต่างทันที
hsGui.OnEvent("Escape", (*) => hsGui.Hide())
; -------------------------------------------------------------
; วิธีเรียกใช้งานหน้าต่าง
; -------------------------------------------------------------
; Hotkeys
#Hotstring ?*
cL() {
    ;  ; จำลองการกด Ctrl ลง -> กด Shift ลง -> ปล่อย Shift -> ปล่อย Ctrl
    Send("{Ctrl down}{Shift down}")
    Sleep(50) ; หน่วงเวลาสั้น ๆ 50 มิลลิวินาที เพื่อให้ Windows รับรู้
    Send("{Shift up}{Ctrl up}")
}

::ใใ:: {
    cL()
    MsgBox("⚠️ พิมพ์ใหม่", "Network Warning", "T1 64")
}

; ฟังก์ชันสำหรับสลับภาษาด้วยปุ่ม Ctrl + Shift
; switchLanguage2() {
;     ; ส่งคำสั่งกดปุ่ม Ctrl และ Shift พร้อมกันแล้วปล่อย
;     Send("^{Shift}")
; }


#HotIf WinActive("ahk_exe Code.exe")
+^,:: {
    ; ส่งสัญญาณปุ่มลูกศรลง (Down Arrow) ไปยัง VS Code
    Send("{Down}")
}
^,:: {
    ; ส่งสัญญาณปุ่มลูกศรขวา (Right Arrow) ไปยัง VS Code
    Send("{Right}")
}
#HotIf
::..w::คืออะไร ไว้ทำอะไร มีประโยชน์อะไรใน Python
::..c:: {
    vsCodeExe := "code.exe"
    if WinExist("ahk_exe " vsCodeExe) {
        ; ถ้าเปิดอยู่แล้ว ให้ดึงหน้าต่างนั้นขึ้นมาแสดงด้านหน้าสุด (Activate)
        WinActivate("ahk_exe " vsCodeExe)
    } else {
        ; ถ้ายังไม่ได้เปิด ให้สั่งรันโปรแกรม VS Code ขึ้นมาใหม่
        ; (ระบบจะค้นหาตำแหน่ง code.exe จากตัวแปร Environment ของ Windows โดยอัตโนมัติ)
        Run(vsCodeExe)
    }
}
::..tk:: 🆒 Thank you very much 💞😀
::..tel::081-865-7103
::..r::uv run python
::..a::.venv\Scripts\activate
::..p:: {
    Run("mspaint.exe")
}
::..hs:: {
    Run('"C:\Users\Developer\AppData\Local\Programs\Microsoft VS Code\Code.exe" "D:\ahk"')
}
::..sp:: {
    Run('"C:\Users\Developer\AppData\Local\Programs\Microsoft VS Code\Code.exe" "D:\asample"')
}

::..cs:: {
    {
        ; ส่งคำสั่งไปที่ Windows เพื่อปิดหน้าจอ (SendMessage ไปยัง HWND_BROADCAST ด้วย WM_SYSCOMMAND และ SC_MONITORPOWER)
        Sleep 500 ; หน่วงเวลาเล็กน้อยกันการค้างของปุ่มคีย์บอร์ด
        DllCall("SendMessage", "Ptr", 0xFFFF, "UInt", 0x0112, "Ptr", 0xF170, "Ptr", 2)
    }
    ;AutoCloseMsgBox("Copy and Paste done", 500, 's30')
}
^!q:: {

    ; ตรวจสอบว่ามีหน้าต่าง Foxit เปิดอยู่หรือไม่
    if WinExist("ahk_exe FoxitPDFReader.exe")
    {
        WinClose "ahk_exe FoxitPDFReader.exe"
    }


    ; Force shutdown without waiting for applications to close
    Run "shutdown.exe /s /f /t 0"
}
^!Space:: {
    Sleep 1000
    DllCall("PowrProf.dll\SetSuspendState", "Int", 0, "Int", 0, "Int", 0)
}
; Change key enter to Shift+Enter and Right CTRL to Enter
; ทำงานทุก App ยกเว้น VSCode และ Obsidian
::..fwf::
{
    run("https://fastwork.co/user/jeeradate")
}
::..it:: {
    global IsOnlinePrev
    statusText := IsOnlinePrev ? "ออนไลน์อยู่ (Online)" : "ออฟไลน์ (Offline)"
    MsgBox("สถานะอินเทอร์เน็ตปัจจุบัน: " . statusText, "Network Status Check", "T2 100")
}
::caa::
{
    Send("!{F4}")
}
:o:..oha::486/63 ถ.สุขขุมวิท ต.เนินพระ อ.เมือง จ.ระยอง 21000
:o:..hat::บ้านเลขที่ 58/33 หมู่ 5 หมู่บ้านรามนุช 18 ตำบลสัตหีบ อำเภอสัตหีบ จังหวัดชลบุรี 20180
:o:..hae::58/33 Moo 5, Ramnuch 18 Village Sattahip Sub-district, Sattahip District Chon Buri 20180, Thailand
:o:..map::https://maps.app.goo.gl/sPcJGmUJB8D19Nxv5
:o:..mail::jeeradate@gmail.com
:o:..fwp::
{
    run("https://www.fastwork.com/user/jk.dev")
}
::..st:: ;Snipping Tool1
{
    if WinExist("ahk_class XamlWindow") { ;ahk_exe SnippingTool.exe
        WinActivate
    }
    else {
        ;run "C:\Users\Developer\AppData\Local\Microsoft\WindowsApps\Snipping Tool.exe"

        run "C:\Users\Developer\AppData\Local\Microsoft\WindowsApps\Snippingtool.exe"
    }
}
::..m:: ;เปิด Gmail
{
    run("https://mail.google.com/mail/u/0/?shva=1#inbox")
}
::..mc:: ;Gmail and calendar
{
    run("https://mail.google.com/mail/u/0/?shva=1#inbox")
    Run("https://calendar.google.com")
}
::..list::
{
    hsGui.Show()

}
^Space::
{
    global hsGui
    if WinExist("💡 Hotstring Cheat Sheet")
        hsGui.Hide()
    else
        hsGui.Show()
}
; --- Hotstring ทำงานต่างๆ ---
::..calc::
{
    Run("calc.exe")
}
::..np::
{
    if (notepadWindow := WinExist("ahk_class Notepad++")) {
        WinActivate notepadWindow
    } else {
        Run "C:\Program Files\Notepad++\notepad++.exe"
        WinWaitActive ("ahk_class Notepad++")

    }

}
::..web::
{
    Run("https://www.google.com")
}
::..yt::
{
    Run("https://www.youtube.com/")
}
:o:..jkt::จีระเดช แก้วกาญจนา
:o:..jke::Jeeradate Kaewkanchana
:o:..ct::
{
    A_Clipboard := "" ; Clear the clipboard
    SendInput "{Text}" FormatTime(, "yyyy-MM-dd HH:mm")
}
::..ahkh::
{
    if (AWindow := WinExist("ahk_class HH Parent")) {
        WinActivate AWindow
    } else {
        Run("https://www.autohotkey.com/docs/v2/")
        ;Run "C:\Program Files\AutoHotkey\V2\AutoHotkey.chm"
    }
}
::..hkl::
{
    if WinExist("HotKeysList") {
        WinActivate
    } else {
        Run "C:\Program Files\AutoHotkey\HotkeyList\HotKeysList.exe"
        ;run 'https://www.nirsoft.net/utils/hot_keys_list.html'
    }
}
::..od::
{
    if WinExist("ahk_exe Obsidian.exe") {
        WinActivate
    }
    else {
        Run "C:\Users\Developer\AppData\Local\Programs\Obsidian\Obsidian.exe  'G:\My Drive\DriveSyncFiles\Obsidian\Jk'"

    }
}