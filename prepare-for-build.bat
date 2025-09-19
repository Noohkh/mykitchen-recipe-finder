@echo off
echo 🔧 Prepare Project for Cordova Build
echo ==================================

echo.
echo 📋 Ensuring proper Cordova project structure...

echo 🔍 Checking config.xml...
if not exist "config.xml" (
    echo ❌ Error: config.xml not found
    echo Please ensure you have a valid Cordova configuration
    pause
    exit /b 1
)
echo ✅ config.xml found

echo 🔍 Checking www directory structure...
if not exist "www" (
    echo 📁 Creating www directory...
    mkdir www
)

if not exist "www\index.html" (
    echo 📄 Copying index.html to www directory...
    if exist "frontend\index.html" (
        copy "frontend\index.html" "www\index.html"
        echo ✅ Copied frontend/index.html to www/index.html
    ) else (
        echo ❌ Error: No index.html found in frontend directory
        pause
        exit /b 1
    )
) else (
    echo ✅ www/index.html already exists
)

echo 🔍 Checking platforms and plugins directories...
if not exist "platforms" mkdir platforms
if not exist "plugins" mkdir plugins

echo.
echo ✅ Project structure ready for Cordova build!
echo.
echo 📦 File structure:
echo ├── config.xml ✅
echo ├── www/
echo │   └── index.html ✅
echo ├── platforms/ ✅
echo └── plugins/ ✅
echo.
echo 🚀 Ready for:
echo - Local build: cordova build android
echo - GitHub Actions: git push origin main
echo.
pause