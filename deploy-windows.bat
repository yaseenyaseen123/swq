@echo off
cd /d "%~dp0"
echo =====================================================
echo Deploying Jordan Driving Academy to GitHub (swq)...
echo =====================================================

if not exist "index.html" (
    echo [ERROR] index.html not found!
    echo Please extract the ZIP file to a folder first before running this script.
    pause
    exit /b 1
)

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [WARNING] Git is not installed on your computer.
    echo Opening GitHub browser upload page instead...
    echo Please drag and drop index.html into the browser window that opens.
    start https://github.com/yaseenyaseen123/swq/upload/main
    pause
    exit /b 0
)

git init
git add index.html README.md .nojekyll .github/workflows/deploy.yml
git commit -m "Deploy Jordan Driving Academy 2026"
git branch -M main
git remote get-url origin >nul 2>nul
if %errorlevel% equ 0 (
    git remote set-url origin https://github.com/yaseenyaseen123/swq.git
) else (
    git remote add origin https://github.com/yaseenyaseen123/swq.git
)
git push -u origin main

echo.
echo =====================================================
echo Deployment finished!
echo Live URL: https://yaseenyaseen123.github.io/swq/
echo =====================================================
pause
