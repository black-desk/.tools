Dim WShell
Set WShell = CreateObject("WScript.Shell")
WShell.Run "C:\Windows\System32\wsl.exe ~ -e zsh -c " &"""DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 st""",0
Set WShell = Nothing
