
#Requires AutoHotkey v2.0
#SingleInstance Force

; Create the main GUI
myGui := Gui()
myGui.Title := "ป้อนชื่อของคุณ"

; Add an edit control for name input
nameInput := myGui.Add("Edit", "w200 vName", "")

; Add a button
okButton := myGui.Add("Button", "w75", "OK")
onRun:= myGui.Add("Button","x+m w75", "Run")

; Event handler for the OK button
okButton.OnEvent("Click", ShowName)
onRun.OnEvent("Click", NotePadPP)

; Show the GUI
myGui.Show()

; Function to show the entered name
ShowName(*)
{
    ; Get the value from the input field
    ;enteredName := myGui.Submit(false)["Name"]
    enteredName:= nameInput.Value
    
    ; Check if the name is not empty
    if (enteredName != "")
    {
        ; Show a message box with the entered name
        MsgBox("สวัสดี " . enteredName . "!", "ข้อความทักทาย")
    }
    else
    {
        ; Show an error message if no name was entered
        MsgBox("กรุณาป้อนชื่อของคุณ", "ข้อผิดพลาด", 16)
    }
}

NotePadPP(*) {
    if (notepadWindow := WinExist("ahk_class Notepad++")) {
        WinActivate notepadWindow
    } else {
        Run "C:\Program Files\Notepad++\notepad++.exe"
        WinWaitActive ("ahk_class Notepad++")

    }

}
; Keep the script running
return