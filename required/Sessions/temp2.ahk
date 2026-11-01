#Warn All, Off

#Requires Autohotkey v2
;AutoGUI 2.5.8 creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;Easy_AutoGUI_for_AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

myGui := Gui()
ButtonNotePad := myGui.Add("Button", "x32 y192 w96 h36", "&NotePad++")
ButtonNotePad := myGui.Add("Button", "x32 y24 w96 h32", "&NotePad")
ButtonCalculator := myGui.Add("Button", "x32 y112 w96 h32", "&Calculator")
ButtonNotePad.OnEvent("Click", OnEventHandler)
ButtonCalculator.OnEvent("Click", OnEventHandler)
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Title := "Window"
myGui.Show("w620 h420")

OnEventHandler(*)
{
	ToolTip("Click! This is a sample action.`n"
	. "Active GUI element values include:`n"  
	. "ButtonNotePad => " ButtonNotePad.Text "`n" 
	. "ButtonNotePad => " ButtonNotePad.Text "`n" 
	. "ButtonCalculator => " ButtonCalculator.Text "`n", 77, 277)
	SetTimer () => ToolTip(), -3000 ; tooltip timer
}
