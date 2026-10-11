@echo off
cd /d "%~dp0"
if not exist "node_modules\.bin\honkit.cmd" goto missing
echo Open http://localhost:4000 in your browser after the server starts.
echo Keep this window open. Press Ctrl+C to stop the preview.
call npm start
pause
exit /b
:missing
echo HonKit is not installed yet. Run install.cmd first.
pause
exit /b 1
