' Volume Mute
Set WshShell = CreateObject("WScript.Shell")

' Send the character code for VK_VOLUME_MUTE
' &H = hex code
WshShell.SendKeys chr(&HAD)
