## powershell箭头补全


```powershell
# code $profile
# https:/go.microsoft.com/fwlink/?LinkID=135170
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# https://stackoverflow.com/questions/8264655/how-to-make-powershell-tab-completion-work-like-bash
# code $profile
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
```
