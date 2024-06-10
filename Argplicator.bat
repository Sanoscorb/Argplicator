@rem MIT License

@rem Copyright (c) 2024 Aleksandr Skorobogatov

@rem Permission is hereby granted, free of charge, to any person obtaining a copy
@rem of this software and associated documentation files (the "Software"), to deal
@rem in the Software without restriction, including without limitation the rights
@rem to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
@rem copies of the Software, and to permit persons to whom the Software is
@rem furnished to do so, subject to the following conditions:

@rem The above copyright notice and this permission notice shall be included in all
@rem copies or substantial portions of the Software.

@rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
@rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
@rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
@rem AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
@rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
@rem OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
@rem SOFTWARE.

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