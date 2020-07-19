$indir = [Environment]::GetFolderPath("MyDocuments") 
$file_org = "$indir\.Rprofile"
$file_new = "$indir\Rprofile"

mv $file_org $file_new

# mv $file_new $file_org
