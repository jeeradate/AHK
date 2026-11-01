#Requires AutoHotkey v2.0
#SingleInstance Force

; Global variables for tracking internet status
global IsOnlinePrev := true
CheckInterval := 10000 ; ตรวจสอบทุกๆ 10 วินาที (สามารถปรับเวลาได้ตามต้องการ เช่น 60000 = 1 นาที)

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
            MsgBox("⚠️ อินเทอร์เน็ตหลุด! กรุณาตรวจสอบการเชื่อมต่อของคุณ", "Network Warning", "16 4096")
        }
        ; อัปเดตสถานะปัจจุบันเก็บไว้เทียบในรอบถัดไป
        IsOnlinePrev := isOnlineCurrent
    }
}

/**
 * ปุ่มลัดสำหรับกดทดสอบสถานะอินเทอร์เน็ตด้วยตัวเอง (กด Ctrl + J)
 * @returns {void}
 */
^j:: {
    global IsOnlinePrev
    statusText := IsOnlinePrev ? "ออนไลน์อยู่ (Online)" : "ออฟไลน์ (Offline)"
    MsgBox("สถานะอินเทอร์เน็ตปัจจุบัน: " . statusText, "Network Status Check", "T2 64")
}