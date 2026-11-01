#SingleInstance Force
#Requires Autohotkey v2.0+

;AutoGUI 2.5.8 creator: Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter creator: github.com/mmikeww/AHK-v2-script-converter
;Easy_AutoGUI_for_AHKv2 github.com/samfisherirl/Easy-Auto-GUI-for-AHK-v2

main := Gui()
main.OnEvent('Close', (*) => ExitApp())
main.Title := "What is your name"
Lv := main.Add("ListView", "w300 r20",["Don","Dang","Dum","Oke", "Tong", "Tang", "1","2"]).OnEvent("Click" , lvHandle)

main.Add("Button","w75","OK").OnEvent("Click", okHandle)
main.Add("Button","x+m w75","Cancel").OnEvent("Click",cancelHandle)
main.Show("w620 h420")
lvHandle(*){ 
    MsgBox(Lv.Value)
}
okHandle(*){
    MsgBox("You click OK ")
}

cancelHandle(*){
    MsgBox("You click cancle")
}