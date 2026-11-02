@echo off
TITLE Merks Converter Installer
echo ==================================================
echo       Installing Merks Converter CLI Command
echo ==================================================

echo [1/4] Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python is not installed or not added to PATH!
    echo Please install Python from https://www.python.org/ and check "Add Python to PATH".
    pause
    exit /b
)

echo [2/4] Installing requirements (Pillow)...
python -m pip install --upgrade pip
python -m pip install -r "%~dp0requirements.txt"
if %errorlevel% neq 0 (
    echo.
    echo [WARNING] Direct package installation via requirements.txt failed.
    echo Attempting direct install of Pillow...
    python -m pip install Pillow
)

echo [3/4] Creating executable batch command...
set "TARGET_DIR=%LOCALAPPDATA%\Microsoft\WindowsApps"
set "CMD_FILE=%TARGET_DIR%\convert-merks.bat"

(
    echo @echo off
    echo python "%~dp0main.py" %%*
) > "%CMD_FILE%"

echo [4/4] Registering alternative command without hyphens...
set "CMD_FILE_ALT=%TARGET_DIR%\convert_merks.bat"
(
    echo @echo off
    echo python "%~dp0main.py" %%*
) > "%CMD_FILE_ALT%"

echo.
echo ==================================================
echo   Installation Complete!
echo ==================================================
echo You can now open ANY command prompt or terminal window
echo anywhere on your computer and type:
echo.
echo     convert-merks  (or convert_merks)
echo.
echo to launch the app instantly!
echo.
pause
