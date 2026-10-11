@echo off
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 goto no_node
where npm >nul 2>nul
if errorlevel 1 goto no_node
echo Installing HonKit in this book folder...
call npm install --no-audit --no-fund
if errorlevel 1 goto failed
call npm run check
if errorlevel 1 goto failed
call npm run build
if errorlevel 1 goto failed
echo Installation and book build completed. Run preview.cmd to preview.
pause
exit /b 0
:no_node
echo Node.js and npm are required. Install Node.js LTS from nodejs.org.
pause
exit /b 1
:failed
echo Installation or build failed. Read the message above and try again.
pause
exit /b 1
