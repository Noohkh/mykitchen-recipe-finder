@echo off
echo 🧪 Test Build Script - MyKitchen Recipe Finder
echo ===============================================

echo.
echo 📋 This script tests if your project can build successfully
echo.

echo 🔍 Checking project structure...
if not exist "www\index.html" (
    echo ❌ Error: www/index.html not found
    echo Please ensure your Cordova project structure is correct
    pause
    exit /b 1
)

if not exist "config.xml" (
    echo ❌ Error: config.xml not found
    echo Please ensure you have a valid Cordova configuration
    pause
    exit /b 1
)

echo ✅ Project structure looks good

echo.
echo 🔧 Checking Cordova installation...
cordova --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Cordova not found. Installing globally...
    npm install -g cordova
    if %errorlevel% neq 0 (
        echo ❌ Failed to install Cordova
        pause
        exit /b 1
    )
)

echo ✅ Cordova is available

echo.
echo 📦 Installing dependencies (without prepare script)...
npm install --ignore-scripts

echo.
echo 🏗️ Testing Cordova platform addition...
cordova platform add browser --no-telemetry

if %errorlevel% neq 0 (
    echo ❌ Failed to add browser platform
    pause
    exit /b 1
)

echo.
echo 🔨 Testing build...
cordova build browser --no-telemetry

if %errorlevel% equ 0 (
    echo ✅ Build test successful!
    echo.
    echo 🚀 Your project should build successfully on GitHub Actions
    echo You can now push your code to trigger the automated build
    echo.
    echo 📤 To push your changes:
    echo git add .
    echo git commit -m "Fix build configuration for GitHub Actions"
    echo git push origin main
) else (
    echo ❌ Build test failed
    echo Please check the error messages above
    echo.
    echo 🔧 Common fixes:
    echo 1. Make sure config.xml is valid
    echo 2. Check that www/index.html exists
    echo 3. Verify all required files are present
)

echo.
echo 🧹 Cleaning up test files...
cordova platform remove browser --no-telemetry >nul 2>&1

echo.
pause