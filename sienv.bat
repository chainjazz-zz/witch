
@echo off

REM Automatizacija pokretanja specijalizovanog komandnog okruženja
REM Oslanja se na tekuću putanju (prečice?) i postojanje komandnog streama
REM Written by Rastko

REM TODO Ažurirati ovaj skript tako da se smanji broj ulaznih podataka
REM TODO prebacivanjem ulaznih vrednosti u USCAD profil

REM Args
REM 	1 = name, 
REM 	2 = color, 
REM	3 = cmdtype, 
REM	4 = profile (USCAD)
REM
REM USCAD is a standard for arbitrary user datastore hierarchy
REM 	using the Windows Registry






COLOR %2
PROMPT %1$G

REM cls


REM Get registry data store values for eventual local envirnoment variable prerequisites
REM NOTE: We have to use "call set" instead of "set" here. It's a very particular case.
REM Start


for /F "usebackq tokens=1,2* delims= " %%i in (`reg query HKCU\USCAD\sienv\profiles\%4\env`) do call set %%i=%%k

REM End

cls


REM Print a listing of commands/tools within the 
REM Start

for %%j in (*.%3) do echo %%~nj
REM Equivalent to (except: extensions are printed):
REM dir *.%3 /D /A-D

REM echo.

REM End

