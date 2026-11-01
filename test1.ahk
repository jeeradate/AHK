#Requires AutoHotkey v2.0

; Initialize wake-up time
WakeUpTime := A_TickCount

; Function to calculate and format uptime
CalculateUptime() {
    ; Calculate elapsed time since wake-up
    ElapsedMilliseconds := A_TickCount - WakeUpTime
    
    ; Convert to various time units
    Seconds := Floor(ElapsedMilliseconds / 1000)
    Minutes := Floor(Seconds / 60)
    Hours := Floor(Minutes / 60)
    Days := Floor(Hours / 24)
    
    ; Calculate remaining units
    Seconds := Mod(Seconds, 60)
    Minutes := Mod(Minutes, 60)
    Hours := Mod(Hours, 24)
    
    ; Format the output string
    UptimeString := ""
    if (Days > 0)
        UptimeString .= Days " days, "
    if (Hours > 0)
        UptimeString .= Hours " hours, "
    if (Minutes > 0)
        UptimeString .= Minutes " minutes, "
    UptimeString .= Seconds " seconds"
    
    
    return UptimeString
}

; Hotkey to show current uptime (Ctrl+Shift+U)
^z::
{
    MsgBox("Computer has been awake for:`n" CalculateUptime())
}

; Detect when computer wakes from sleep
OnMessage(0x7E, WakeUpHandler)

WakeUpHandler(*) {
    global WakeUpTime
    WakeUpTime := A_TickCount
}

; Optional: Add a system tray tooltip that updates periodically
SetTimer UpdateUptimeTooltip, 1000  ; Update every second

UpdateUptimeTooltip() {
    A_IconTip := "Uptime: " CalculateUptime()
}