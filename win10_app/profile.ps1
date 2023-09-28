#!code $PROFILE

# Import-Module posh-git
# Import-Module oh-my-posh
# # Set-Theme PowerLine
# Set-Theme Agnoster
# chcp 936

function ssh-copy-id([string]$userAtMachine){   
  $publicKey = "$ENV:USERPROFILE" + "/.ssh/id_rsa.pub"
  if (!(Test-Path "$publicKey")){
    Write-Error "ERROR: failed to open ID file '$publicKey': No such file"            
  }
  else {
    & cat "$publicKey" | ssh $userAtMachine "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys || exit 1"      
  }
}

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Chocolatey profile
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }

function realpath {
  $dir = $pwd.Path
  
  $dir = $dir.Replace("\\kong-nas\CMIP6", "z:")
  $dir = $dir.Replace("\\kong-nas\GitHub", "x:")
  $dir = $dir.Replace("\\kong-nas\usbshare3-1", "I:")

  $real = Convert-Path $dir
  Set-Location $real
  # $PSVersionTable.PSVersion
}
realpath

# linux style path
function path {
  $dir = $pwd.Path
  $path2 = $dir.Replace("\", "/")
  Set-Clipboard -Value $path2
  return $path2
}

function bi($name) {
    $name | bito
}
