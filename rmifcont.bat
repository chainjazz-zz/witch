REM
@echo off
REM rmifcont - Remove if contains
REM
REM A batch script that performs a %3 (note: does whatever)
REM on all elements of %2 based on whether they contain %1
REM
REM Written by 
REM
REM Uses FINDSTR to list filenames, and backquote form of FOR

REM ====== NOTES =======
REM Assigning parameters to variables won't work; makes script hang
REM usebackq with actual backquotes (lang SR key AltGr + 7) is the
REM 	proper way to iterate through an output of a command
REM delims= must be specified if there a spaces in the command output
REM	since space is a default delimiter
REM
REM Parameters 4 and 5 are for passing options to the body command
REM 	(remember to use /a option if working on read-only or hidden files,
REM	 where applicable)
REM
REM ====== EXAMPLES ======
REM This script was conceived out of a need to 
REM 	remove a bunch of overwritten Desktop.ini files, while
REM 	keeping the Desktop.ini files that weren't overwritten intact


chcp 1250

for /F "usebackq delims=" %%I in (`findstr /I /S /M %1 %2`) DO %3 %4 %5 "%%I"


