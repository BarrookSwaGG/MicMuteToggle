
; MicMuteToggle GUI with NirCmd and improved UX

#SingleInstance Force
#Persistent

global userHotkey := "F8"
global NirCmdPath := A_ScriptDir . "\nircmd.exe"

if !FileExist(NirCmdPath) {
    MsgBox, 16, Error, NirCmd.exe not found in the script folder! Please download it from:`nhttps://www.nirsoft.net/utils/nircmd.html
    ExitApp
}

Gui +AlwaysOnTop +Resize +MinSize
Gui, Add, Text,, Mic Mute/Unmute Controller
Gui, Add, Button, gMuteMic w100 h30, Mute
Gui, Add, Button, gUnmuteMic w100 h30, Unmute
Gui, Add, Button, gSetHotkey w100, Set Hotkey
Gui, Add, Edit, vHotkeyInput w100
GuiControl,, HotkeyInput, %userHotkey%
Gui, Add, Button, gExitApp w100, Exit
Gui, Show,, Mic Mute Controller
return

GuiEscape:
GuiClose:
ExitApp

MuteMic:
Run, %NirCmdPath% mutesysvolume 1 default_record
return

UnmuteMic:
Run, %NirCmdPath% mutesysvolume 0 default_record
return

SetHotkey:
Gui, Submit, NoHide
Hotkey, %userHotkey%, ToggleMic, Off
Hotkey, %HotkeyInput%, ToggleMic, On
userHotkey := HotkeyInput
return

ToggleMic:
Run, %NirCmdPath% mutesysvolume 2 default_record
return

ExitApp:
ExitApp
