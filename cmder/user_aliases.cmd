;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
cd=cd $* && ls --color
cp=cp -v $*
clear=cls
gl=git log --oneline --all --graph --decorate $*
ls=ls --show-control-chars -F --color --almost-all $*
pw=cd
rm=rm -v $*

history=cat -n "%CMDER_ROOT%\config\.history"
unalias=alias /d $1

vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
todo=ultralist $*
e.=explorer .

cconfig=cd %userprofile%/scoop/apps/cmder/current/config
