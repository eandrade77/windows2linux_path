:: Convert current Windows filepath to Linux / Ubuntu filepath
:: Based on Stackoverflow discussion https://stackoverflow.com/questions/55138826/convert-windows-path-to-unix-friendly 
:: and https://stackoverflow.com/questions/61008701/batch-script-convert-path-to-linux-format-using-wslpath
:: 2021 - Edilton Andrade


@echo off

call ::toLinuxPath "%~dp0" tempF
echo %tempF%
exit /b 0

:toLinuxPath [returnVariable - the result will be stored in it; If omitted will be only echoed]
setlocal 

    set "_path=%~p1"
    set "name=%~nx1"
    set "drive=%~d1"

    CALL :toLower drive
    
    set "rtrn=%~2"

    set "result=//%drive:~0,1%%_path:\=/%%name%"


endlocal & (
    if "%~2" neq "" (
        set "%rtrn%=%result%"
    ) else (
        echo %result%
    )
)

GOTO :EOF

:toLower str -- converts uppercase character to lowercase
::           -- str [in,out] - valref of string variable to be converted
:$created 20060101 :$changed 20080219 :$categories StringManipulation
:$source https://www.dostips.com
if not defined %~1 EXIT /b
for %%a in ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i"
            "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r"
            "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z" "Ä=ä"
            "Ö=ö" "Ü=ü") do (
    call set %~1=%%%~1:%%~a%%
)
EXIT /b
