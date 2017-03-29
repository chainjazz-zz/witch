
@echo off

REM webdir.bat
REM 
REM 	Skripta za generisanje HTTP linkova od listinga foldera
REM
REM 	Napisao Rastko
REM
REM SINTAKSA
REM
REM 	webdir.bat spec-filter [>izlazni-fajl]
REM 
REM 	spec-filter je filter ekstenzije, bez specijalnih znakova
REM
REM PONASANJE
REM
REM 	Skripta ispisuje u TEMP folder (namenjeno Windows-u)
REM 	

set kolekcija="dir /b /a /n /d /s *.%1"
set komanda=echo ^^^<A href='file://%%I' ^^^> %%~nI ^^^</A^^^> ^^^<BR^^^>
set izlaznifajl="%TEMP%\tmp-webdir-%1.html"
set pretrazivac="c:\Program Files (x86)\Mozilla Firefox\firefox.exe"
set ekstenzija="."


>%izlaznifajl% (


echo ^<HTML^>
echo ^<HEAD^>

REM okvir za HEAD stvarcice, tipa css, moze i 'cat' za eksterni fajl


echo ^<STYLE type='text/css'^>
echo A {
echo margin:0.1em;
echo border-top:1px black solid;
echo display:block
echo }
echo ^</STYLE^>

echo ^</HEAD^>
echo ^<BODY^>
echo ^<BR^>^<BR^>

for /f "usebackq delims==" %%I in (`%kolekcija%`) DO %komanda%

echo ^</BODY^>
echo ^</HTML^>

)

REM TODO obraditi gresku ako nema listinga

REM prikazati u pretrazivacu, da li?
REM echo %pretrazivac% %izlaznifajl%

echo Kreiram veb listing fajl...

copy %izlaznifajl% .\.webdir-%1.html
attrib +h .\.webdir-%1.html

echo Brisem privremeni fajl...

del %izlaznifajl%