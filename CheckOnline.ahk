SetTimer(CheckInternet, 30000) ; Check every 30 seconds

CheckInternet() {
    static site := "www.google.com"
    static lastState := true
    currentState := Ping(site)
    
    if (currentState != lastState) {
        if (!currentState) {
            ; AutoCloseMsgBox('Internet is not available',50000,'s10')
            MsgBox "Internet connection is not available!"
        } else {
            MsgBox "Internet connection has been restored!"
            ; AutoCloseMsgBox('Internet has been restored',50000,'s10')
        }
        lastState := currentState
    }
}

Ping(site) {
    A_Clipboard := ""
    RunWait A_ComSpec ' /c ping -n 1 -w 1000 ' site ' | clip',, 'Hide'
    ClipWait 1
    return !!RegExMatch(A_Clipboard, 'time=\d+')
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