#Requires Autohotkey v2.0+
#SingleInstance Force

; -------------------------------------------------------------
; สร้างหน้าต่าง GUI สำหรับแสดงรายการ Hotstring แบบ 2 คอลัมน์
; -------------------------------------------------------------
hsGui := Gui("+AlwaysOnTop +ToolWindow", "💡 Hotstring Cheat Sheet (2 Columns)")
hsGui.SetFont("s10", "Segoe UI")

; เพิ่มข้อความหัวเรื่อง
hsGui.SetFont("s10 Bold", "Segoe UI")
hsGui.Add("Text", "w520 cBlue", "รายการ Hotstring ที่ใช้งานได้ (กด Esc หรือปุ่มปิดเพื่อซ่อน):")

; สร้าง ListView แบบมี 2 คอลัมน์ (กำหนดความกว้างแต่ละคอลัมน์ได้ เช่น 120 และ 380 พิกเซล)
hsGui.SetFont("s10 Norm", "Segoe UI")
lv := hsGui.Add("ListView", "w520 h200 -Multi Grid", ["Hotstring / คำสั่ง", "คำอธิบาย / รายละเอียด"])

; เพิ่มข้อมูลลงใน ListView (แยกเป็น 2 คอลัมน์อย่างเป็นระเบียบ)
lv.Add(, "..calc", "เปิดโปรแกรม Calculator")
lv.Add(, "..np", "เปิดโปรแกรม Notepad++")
lv.Add(, "..web", "เปิดเว็บไซต์ Google")
lv.Add(, "..yt", "เปิด YouTube Shorts")
lv.Add(, "..jkt", "พิมพ์ชื่อ 'จีระเดช แก้วกาญจนา'")

; ปุ่มปิดหน้าต่าง
btnClose := hsGui.Add("Button", "Default w100 x220 y260", "ปิดหน้าต่าง")
btnClose.OnEvent("Click", (*) => hsGui.Hide())

; เมื่อกดปุ่ม Esc ให้ซ่อนหน้าต่างทันที
hsGui.OnEvent("Escape", (*) => hsGui.Hide())


; -------------------------------------------------------------
; วิธีเรียกใช้งานหน้าต่าง
; -------------------------------------------------------------
::..list::
{
    hsGui.Show()
}

^Space::
{
    if WinExist("💡 Hotstring Cheat Sheet (2 Columns)")
        hsGui.Hide()
    else
        hsGui.Show()
}


; -------------------------------------------------------------
; ส่วนของ Hotstring การทำงานต่างๆ
; -------------------------------------------------------------
::..calc::
{
    Run("calc.exe")
}

::..np::
{
    Run("notepad++.exe")
}

::..web::
{
    Run("https://www.google.com")
}

::..yt::
{
    Run("https://www.youtube.com/shorts/-K5S3JFAi6g")
}

:o:..jkt::จีระเดช แก้วกาญจนา