@echo off
setlocal EnableExtensions
cd /d "%~dp0"

if not exist "%~dp0tools\create_launcher_shortcut.ps1" (
  echo Missing: %~dp0tools\create_launcher_shortcut.ps1
  pause
  exit /b 1
)

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\create_launcher_shortcut.ps1"
set "EXIT_CODE=%ERRORLEVEL%"

if not "%EXIT_CODE%"=="0" (
  echo.
  echo Failed to recreate the NEXTDEBUT shortcut.
  pause
  exit /b %EXIT_CODE%
)

echo.
echo NEXTDEBUT shortcut was recreated on your Desktop.
pause
exit /b 0
