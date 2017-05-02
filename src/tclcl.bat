@echo off

echo Automatizer prevodjenja TCL programa za 
echo Vindouz platformu
echo.
echo Napisao Rastko Petrovic
echo.
echo.
echo Upotreba
echo --------
echo.
echo tclcl ime-kompajlera folder-sa-tclom
echo.
echo Razmaci u putanjama nisu trenutno podrzani.
echo Mozete navesti i puno ime tclkit komande




set TKITAPPNAME=%~n2
set TKITAPPPATH=.\%TKITAPPNAME%

if not exist .\sdx.kit goto NoSdx
if not exist %2\main.tcl goto NoMain

mkdir %TKITAPPPATH%

if not exist .\basekit copy .\%1 .\basekit
copy %2\*.tcl %TKITAPPPATH%

move %TKITAPPPATH% "%TKITAPPPATH%.vfs"

.\%1 sdx.kit wrap %TKITAPPNAME% -runtime basekit

if exist .\%TKITAPPNAME% move .\%TKITAPPNAME% %2\%TKITAPPNAME%.exe
if exist .\%TKITAPPNAME%.vfs rmdir /q /s .\%TKITAPPNAME%.vfs

goto Endme


:NoSdx
echo.
echo Ne mogu pronaci 'sdx.kit'
goto Endme

:NoMain
echo.
echo Jedan od modula mora biti 'main.tcl'
goto Endme


:Endme
echo.
echo Kraj
echo.
pause




