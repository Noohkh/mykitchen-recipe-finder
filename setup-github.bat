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

:: Check if git repo already exists
if exist ".git" (
    echo ℹ️  Git repository already exists
) else (
    echo 📝 Initializing new Git repository...
    git init
)

echo 🌿 Creating and switching to main branch...
git checkout -b main 2>nul || git checkout main

echo 📝 Adding files to repository...
git add .

echo 💾 Creating initial commit...
git status
echo.
echo 📊 Files to be committed:
git diff --cached --name-status
echo.

set /p continue="Continue with commit? (y/n): "
if /i not "%continue%"=="y" (
    echo Commit cancelled.
    pause
    exit /b 0
)

git commit -m "Initial commit: MyKitchen Recipe Finder app with Firebase authentication and GitHub Actions"

if %errorlevel% neq 0 (
    echo ⚠️  Commit failed. This might be because there are no changes to commit.
    echo Checking git status...
    git status
    echo.
)

echo.
echo 🌐 Next steps:
echo 1. Create a new repository on GitHub.com with these details:
echo    📛 Name: mykitchen-recipe-finder
echo    📝 Description: Mobile recipe finder app with Firebase authentication
echo    🔓 Visibility: Public (for free GitHub Actions)
echo    ❌ Don't initialize with README (we already have one)
echo.
echo 2. Copy your repository URL (it will look like):
echo    https://github.com/YOUR_USERNAME/mykitchen-recipe-finder.git
echo.
echo 3. Run these commands with your actual repository URL:
echo.
set /p repo_url="Enter your GitHub repository URL (or press Enter to skip): "

if not "%repo_url%"=="" (
    echo.
    echo 🔗 Adding remote repository...
    git remote remove origin 2>nul
    git remote add origin %repo_url%
    
    echo 📤 Pushing to GitHub...
    echo Pushing main branch to origin...
    git push -u origin main
    
    if %errorlevel% equ 0 (
        echo ✅ Successfully pushed to GitHub!
        echo.
        echo 🎉 Your repository is now set up!
        echo 📋 GitHub Actions will automatically build your APK.
        echo 🕐 Build takes about 5-10 minutes.
        echo 📥 Download APK from: %repo_url:~0,-4%/actions
    ) else (
        echo ❌ Push failed. Common solutions:
        echo 1. Check your repository URL is correct
        echo 2. Make sure you have write access to the repository
        echo 3. Try: git push --set-upstream origin main
    )
) else (
    echo.
    echo 📋 Manual setup instructions:
    echo 1. Create repository on GitHub
    echo 2. Run: git remote add origin YOUR_REPO_URL
    echo 3. Run: git push -u origin main
)

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