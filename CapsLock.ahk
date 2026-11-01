#SingleInstance Force
#Requires Autohotkey v2.0+
; Disable the standard Caps Lock functionality
SetCapsLockState "AlwaysOff"

; Define the language codes
languageCode1 := 0x0409  ; English (US)
languageCode2 := 0x041E  ; Thai

; Initialize the current language
currentLanguage := languageCode1

CapsLock::SwitchLanguage()

; Function to switch between languages
SwitchLanguage() {
    global currentLanguage, languageCode1, languageCode2
    if (currentLanguage == languageCode1) {
        currentLanguage := languageCode2
    } else {
        currentLanguage := languageCode1
    }
    PostMessage(0x0050, 0, currentLanguage,, "A")
}
        