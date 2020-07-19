# echo $args
# --vanilla --no-init-file 
$root = "$PSScriptRoot\..\bin"
Rscript.exe --vanilla $root\install.r $args
