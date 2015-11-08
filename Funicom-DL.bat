@echo off
cd /D %~dp0
if exist "Funicom-DL.que.que" del Funicom-DL.que.que
copy Funicom-DL.que Funicom-DL.que.que
set G=-l e -fb
for /F "tokens=*" %%A in (Funicom-DL.que.que) do call :pro %%A
del Funicom-DL.que.que
goto :EOF
:pro
if "%~1"=="#" goto :EOF
if "%~1"=="--quit" del Funicom-DL.que.que
if "%~1"=="--quit" goto :EOF
if "%~1"=="-Q" del Funicom-DL.que.que
if "%~1"=="-Q" goto :EOF
if "%~1"=="--global" set G=%*
if "%~1"=="--global" set G=%G:~2%
if "%~1"=="--global" goto :EOF
if "%~1"=="-G" set G=%*
if "%~1"=="-G" set G=%G:~2%
if "%~1"=="-G" goto :EOF
if not exist "tmp" MD "tmp"
CD tmp
if exist "..\Funicom-DL.pyc" copy "..\Funicom-DL.pyc" "Funicom-DL.pyc"
if exist "..\Funicom-DL.py" copy "..\Funicom-DL.py" "Funicom-DL.py"
echo %*>cur.que
if exist "..\UserExcept.pyni" copy "..\UserExcept.pyni" UserExcept.py
if not exist "..\UserExcept.pyni" if exist "..\UserExcept.py.ini" copy "..\UserExcept.py.ini" UserExcept.py
if exist "..\PikaExcept.pyni" copy "..\PikaExcept.pyni" PikaExcept.py
if not exist "..\PikaExcept.pyni" if exist "..\PikaExcept.py.ini" copy "..\PikaExcept.py.ini" PikaExcept.py
if exist "..\Funicom-DL.py" Funicom-DL.py %* %g%
if not exist "..\Funicom-DL.py" if exist "..\Funicom-DL.pyc" Funicom-DL.pyc %* %g%
del cur.que
cd ..
RD /S /Q tmp
goto :EOF
