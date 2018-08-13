;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
clear=cls
cmderr=cd /d "%CMDER_ROOT%"
e.=explorer .
history=cat "%CMDER_ROOT%\config\.history"
ls=ls --show-control-chars -F --color $*
ll=ls -l $*
pwd=cd
unalias=alias /d $1
vi=vim $*

ccode=cd C:\Code
emunexus=emulator -avd Nexus_5X_API_26 -no-audio $*
githide=git update-index --assume-unchanged $*
gitf=git fetch $*
gitl=git log --oneline --all --graph --decorate  $*
gitmf=git merge --ff-only $*
gits=git status $*
gitunhide=git update-index --no-assume-unchanged $*
