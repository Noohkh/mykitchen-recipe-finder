@echo off
echo 🎯 Setup New GitHub Repository - MyKitchen Recipe Finder
echo ========================================================

echo.
echo 📝 Current remote repository:
git remote -v

echo.
echo 🔄 Let's set up a new repository URL
echo.
echo 💡 Options:
echo 1. Create repository: mykitchen-recipe-finder (recommended)
echo 2. Create repository: recipe-finder-app
echo 3. Create repository: mykitchen-app
echo 4. Enter custom name
echo.

set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" (
    set repo_name=mykitchen-recipe-finder
) else if "%choice%"=="2" (
    set repo_name=recipe-finder-app
) else if "%choice%"=="3" (
    set repo_name=mykitchen-app
) else if "%choice%"=="4" (
    set /p repo_name="Enter repository name: "
) else (
    echo Invalid choice. Using default: mykitchen-recipe-finder
    set repo_name=mykitchen-recipe-finder
)

echo.
echo 🌐 Repository will be: https://github.com/Noohkh/%repo_name%.git
echo.

echo 🔧 Updating remote URL...
git remote remove origin
git remote add origin https://github.com/Noohkh/%repo_name%.git

echo ✅ Remote updated!
echo.

echo 📋 Next steps:
echo 1. Go to GitHub.com
echo 2. Click "New Repository" (green button)
echo 3. Repository name: %repo_name%
echo 4. Description: Mobile recipe finder app with Firebase authentication
echo 5. Set to Public
echo 6. Don't initialize with README
echo 7. Click "Create Repository"
echo.

echo 🚀 After creating the repository, run:
echo git push -u origin main
echo.

echo 🎉 Your app will then build automatically with GitHub Actions!
echo Download the APK from the Actions tab after 5-10 minutes.
echo.
pause