# echo $args
# --vanilla --no-init-file 
$root = "$PSScriptRoot\..\bin"
Rscript.exe --no-init-file $root\installr $args
