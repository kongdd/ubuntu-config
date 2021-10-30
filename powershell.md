## powershell箭头补全


```powershell
# https://stackoverflow.com/questions/8264655/how-to-make-powershell-tab-completion-work-like-bash
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
```
