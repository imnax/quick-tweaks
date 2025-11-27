' Volume Up
Set WshShell = CreateObject("WScript.Shell")

' Send the character code for VK_VOLUME_UP
' &H = hex code
WshShell.SendKeys chr(&HAF)
