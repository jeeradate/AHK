CoordMode "Pixel"  ; Interprets the coordinates below as relative to the screen rather than the active window's client area.
try
{
    if ImageSearch(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, "skipImage.png" A_ProgramFiles "\SomeApp\SomeApp.exe")
        MsgBox "The icon was found at " FoundX "x" FoundY
    else
        MsgBox "Icon could not be found on the screen."
}
catch as exc
    MsgBox "Could not conduct the search due to the following error:`n" exc.Message

