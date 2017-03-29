
@echo off

REM REM REM REM REM REM REM REM REM REM REM REM REM
REM wav2mp3
REM written by Rastko Petrovic
REM
REM Automatizacija konverzije WAV formata u mp3
REM
REM PREDUSLOV
REM Funkcionalna instalacija ffmpeg
REM Alatke ffmpeg na izvršnoj putanji
REM
REM ULAZ
REM n(eobavezan) Lokacija ffmpeg komande
REM o(bavezan)	 Ime ulaznog fajla
REM
REM REM REM REM REM REM REM REM REM REM REM REM REM

SET TOOL=ffmpeg.exe

IF DEFINED FFMPEG (SET TOOL="%FFMPEG%\ffmpeg.exe") ELSE ECHO assuming path set
IF "%2"=="" (SET BITR=192000) ELSE SET BITR=%2000
ECHO Bitrate: %BITR% B/s

PAUSE
%TOOL% -hide_banner -i "%1" -c:a libmp3lame -b:a %BITR% "%~dpn1.mp3"
IF ERRORLEVEL 1 (ECHO FAILED - IS FFMPEG IN PATH?) ELSE GOTO Coolio

PAUSE
GOTO Endie

:Coolio
ECHO Success, yawl ;)

PAUSE
GOTO Endie

:Endie
