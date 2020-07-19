# echo $args
Rscript.exe --no-init-file $PSScriptRoot\updatePackages.r $args

# %* for all command line parameters (excluding the script name itself). You might also find these useful:

# %0 - the command used to call the batch file (could be foo, ..\foo, c:\bats\foo.bat, etc.)
# %1 is the first command line parameter,
# %2 is the second command line parameter,
# and so on till %9 (and SHIFT can be used for those after the 9th).

# %~nx0 - the actual name of the batch file, regardless of calling method (some-batch.bat)
# %~dp0 - drive and path to the script (d:\scripts)
# %~dpnx0 - is the fully qualified path name of the script (d:\scripts\some-batch.bat)
