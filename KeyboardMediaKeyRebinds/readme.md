# Media Key Action Customisation and Rebinds
Media keys have their own keycodes and default actions that we can't change without remapping things (look up scan mapping).

We can override the default action using the registry by adding a new action in the media key's registry key here:
`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\<n>`
> `<n>` is the physical key's number specified in a Windows constant (see Ref 1)

These are the methods available to us:
**Association**
> Open program/default action for specified file type (`.txt`) or protocol handle (`ms-settings:`, `http:`)
**ShellExecute**
> Run a command in shell/cmd context (`control`, `explorer "C:\Scripts"`)

# Example
`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\15` on my keyboard was originally `Start Mail`. I replaced my keycaps and the new set had `Volume Down` instead.
To swap this functionality, I made `VolDown.vbs` which sends keycode `0xAE` (see Ref 2) and added this registry value:
> Key: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\15`\
> Value: `ShellExecute`\
> Type: `REG_SZ`\
> Data: `C:\Scripts\KeyboardMediaKeyRebinds\VolDown.vbs`

Now when I press that physical key, `VolDown.vbs` runs and lowers the volume in Windows by 2 stages (100 -> 98).

I also added a string value called `Key` as a descriptor for easier identification later (`3 - Vol Down`, as in `3rd key along - icon is Vol Down`).


## My registry changes
```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey]

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\15]
"ShellExecute"="C:\\Scripts\\KeyboardMediaKeyRebinds\\VolDown.vbs"
"Key"="3 - Vol Down"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\17]
"ShellExecute"="C:\\Scripts\\KeyboardMediaKeyRebinds\\VolMute.vbs"
"Key"="2 - Vol Mute"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\18]
"Key"="1 - Calc"

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\7]
"ShellExecute"="C:\\Scripts\\KeyboardMediaKeyRebinds\\VolUp.vbs"
"Key"="4 - Vol Up"
```

# References
- Inspired by: https://www.adamnierzad.com/2019/remapping-media-keys/
- Windows APPCOMMAND documentation (get physical key constants/number handles from here): https://learn.microsoft.com/en-us/windows/win32/inputdev/wm-appcommand
- Windows Virtual Keyboard keycodes: https://learn.microsoft.com/en-gb/windows/win32/inputdev/virtual-key-codes
