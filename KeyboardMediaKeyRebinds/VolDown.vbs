' Volume Up
Set WshShell = CreateObject("WScript.Shell")

' Send the character code for VK_VOLUME_DOWN
' &H = hex code
WshShell.SendKeys chr(&HAE)
