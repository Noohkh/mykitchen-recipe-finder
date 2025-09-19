@echo off
echo 🔍 Environment Check for Android Development
echo ============================================

echo.
echo 📋 Checking Java JDK...
java -version 2>nul
if %errorlevel% neq 0 (
    echo ❌ Java JDK not found or not in PATH
    echo Please install Java JDK 11 or 17 from: https://adoptium.net/
) else (
    echo ✅ Java JDK found
)

echo.
echo 📋 Checking JAVA_HOME...
if defined JAVA_HOME (
    echo ✅ JAVA_HOME is set to: %JAVA_HOME%
) else (
    echo ❌ JAVA_HOME is not set
    echo Please set JAVA_HOME environment variable
)

echo.
echo 📋 Checking Android SDK...
if defined ANDROID_HOME (
    echo ✅ ANDROID_HOME is set to: %ANDROID_HOME%
) else (
    echo ❌ ANDROID_HOME is not set
    echo Please set ANDROID_HOME environment variable
)

echo.
echo 📋 Checking ADB (Android Debug Bridge)...
adb version 2>nul
if %errorlevel% neq 0 (
    echo ❌ ADB not found in PATH
    echo Please add Android SDK platform-tools to PATH
) else (
    echo ✅ ADB found
)

echo.
echo 📋 Checking Gradle...
gradle --version 2>nul
if %errorlevel% neq 0 (
    echo ⚠️  Gradle not found in PATH (this is okay, Cordova can use gradle wrapper)
) else (
    echo ✅ Gradle found
)

echo.
echo 📋 Checking Cordova...
cordova --version 2>nul
if %errorlevel% neq 0 (
    echo ❌ Cordova not found
    echo Please install: npm install -g cordova
) else (
    echo ✅ Cordova found
)

echo.
echo 📋 Summary:
echo If you see any ❌ marks above, please follow the setup guide.
echo See: ANDROID_SETUP_GUIDE.md
echo.
pause