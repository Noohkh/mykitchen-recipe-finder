@echo off
echo 🚀 MyKitchen Recipe Finder - Android Build Script
echo ================================================

echo.
echo 📋 Checking Cordova installation...
cordova --version
if %errorlevel% neq 0 (
    echo ❌ Cordova not found! Please install Cordova first.
    echo Run: npm install -g cordova
    pause
    exit /b 1
)

echo.
echo 🔍 Checking Android requirements...
cordova requirements android
if %errorlevel% neq 0 (
    echo ⚠️  Some requirements are missing. Please check the setup guide.
    echo See: ANDROID_SETUP_GUIDE.md
    echo.
    echo Do you want to continue anyway? (y/n)
    set /p continue=
    if /i not "%continue%"=="y" (
        echo Build cancelled.
        pause
        exit /b 1
    )
)

echo.
echo 🏗️  Building Android APK...
echo Building debug version...
cordova build android

if %errorlevel% neq 0 (
    echo ❌ Build failed! Check the error messages above.
    echo.
    echo Common solutions:
    echo 1. Make sure JAVA_HOME is set correctly
    echo 2. Make sure ANDROID_HOME is set correctly  
    echo 3. Make sure Android SDK is installed
    echo 4. Restart your command prompt after setting environment variables
    pause
    exit /b 1
)

echo.
echo ✅ Build completed successfully!
echo.
echo 📱 Your APK files are located at:
echo Debug APK: platforms\android\app\build\outputs\apk\debug\app-debug.apk
echo.

echo 🔄 Do you want to build a release version? (y/n)
set /p buildRelease=
if /i "%buildRelease%"=="y" (
    echo.
    echo 🏗️  Building release version...
    cordova build android --release
    if %errorlevel% equ 0 (
        echo ✅ Release build completed!
        echo Release APK: platforms\android\app\build\outputs\apk\release\app-release-unsigned.apk
    ) else (
        echo ❌ Release build failed!
    )
)

echo.
echo 📤 Do you want to install on connected device? (y/n)
set /p installDevice=
if /i "%installDevice%"=="y" (
    echo.
    echo 📱 Installing on device...
    cordova run android --device
    if %errorlevel% equ 0 (
        echo ✅ App installed successfully!
    ) else (
        echo ❌ Installation failed! Make sure device is connected and USB debugging is enabled.
    )
)

echo.
echo 🎉 Build process completed!
echo.
echo 📋 Next steps:
echo 1. Test your APK on an Android device
echo 2. For Play Store release, you'll need to sign the APK
echo 3. Check ANDROID_SETUP_GUIDE.md for more details
echo.
pause