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

https://superuser.com/questions/1342411/setting-ssh-keys-on-windows-10-openssh-server

Note that if you are setting up keys for an administrator user, putting the public key to %USERPROFILE%/.ssh/authorized_keys will not work. You must append the public key to %PROGRAMDATA%/ssh/administrators_authorized_keys instead.

And you have to set permission with this script run in powershell admin:

```powershell
$acl = Get-Acl C:\ProgramData\ssh\administrators_authorized_keys
$acl.SetAccessRuleProtection($true, $false)
$administratorsRule = New-Object system.security.accesscontrol.filesystemaccessrule("Administrators","FullControl","Allow")
$systemRule = New-Object system.security.accesscontrol.filesystemaccessrule("SYSTEM","FullControl","Allow")
$acl.SetAccessRule($administratorsRule)
$acl.SetAccessRule($systemRule)
$acl | Set-Acl
```
