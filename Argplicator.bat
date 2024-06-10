@echo off
chcp 65001 > nul

echo.
echo Select a list:
echo.
for /r %~dp0\Lists %%f in (*.txt) do echo %%~nf
echo.
set /p list="> "
echo.

setlocal enabledelayedexpansion
for /f "tokens=*" %%f in (%~dp0\Lists\%list%.txt) do (
  for /f "usebackq tokens=1,* delims==" %%i in ("%~dp0\Configs\%%f.ini") do if not "%%j"=="" set %%i=%%j
  set file="%~dp0\Apps\!file!"
  echo Installing !name!...
  start "" /i /wait "!file!" !args!
  set name=
  set file=
  set args=
)
endlocal

set name=
set file=
set args=
set list=