@echo off
echo 🚀 GitHub Deployment Setup for MyKitchen Recipe Finder
echo ======================================================

echo.
echo 📋 This script will help you set up GitHub deployment
echo.

echo 🔍 Checking Git installation...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git is not installed or not in PATH
    echo Please install Git from: https://git-scm.com/download/win
    pause
    exit /b 1
) else (
    echo ✅ Git is installed
)

echo.
echo 📁 Current directory: %cd%
echo.

echo 🔧 Setting up Git repository...
git init

echo 📝 Adding files to repository...
git add .

echo 💾 Creating initial commit...
git commit -m "Initial commit: MyKitchen Recipe Finder app with Firebase authentication"

echo.
echo 🌐 Next steps:
echo 1. Create a new repository on GitHub.com
echo 2. Copy the repository URL (e.g., https://github.com/yourusername/mykitchen-recipe-finder.git)
echo 3. Run this command with your repository URL:
echo.
echo    git remote add origin YOUR_REPOSITORY_URL
echo    git branch -M main
echo    git push -u origin main
echo.
echo 4. GitHub Actions will automatically build your APK!
echo.

echo 📱 Repository features ready:
echo ✅ Firebase Authentication
echo ✅ Mobile-responsive design
echo ✅ Automated Android builds
echo ✅ Recipe search functionality
echo ✅ SEO optimization
echo.

echo 🎯 After pushing to GitHub:
echo 1. Go to your repository → Actions tab
echo 2. Wait for build to complete (about 5-10 minutes)
echo 3. Download APK from Artifacts section
echo 4. Install on Android device for testing
echo.

echo 📖 For detailed instructions, see: GITHUB_DEPLOYMENT_GUIDE.md
echo.
pause