
#Requires Autohotkey v2
;AutoGUI 2.5.8 creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;Easy_AutoGUI_for_AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

myGui := Gui()
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := "Who are you"
myGui.Add("Text",,"First name:")
myGui.Add("Text",,"Last name:")
myGui.Add("Edit","w150 vFistName ym")
myGui.Add("Edit","vLastname")
myGui.Add("Button","default","Ok").OnEvent("Click",ProcessUserInput())
myGui.Show("w620 h420")

ProcessUserInput(*)
{
    save:= myGui.Submit()
    MsgBox("You entered : save.firstName  / save.Lastname ")
}