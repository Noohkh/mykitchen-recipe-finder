@echo off
echo 🔧 Fix Git Branch Error - MyKitchen Recipe Finder
echo ================================================

echo.
echo 🎯 This script fixes the "src refspec main does not match any" error
echo.

echo 📋 Current Git status:
git status

echo.
echo 🌿 Checking current branch...
git branch

echo.
echo 🔄 Creating and switching to main branch...
git checkout -b main 2>nul || git checkout main

echo.
echo 📊 Checking if there are any commits...
git log --oneline -1 2>nul
if %errorlevel% neq 0 (
    echo ⚠️  No commits found. Creating initial commit...
    echo.
    echo 📝 Adding all files...
    git add .
    
    echo 💾 Creating initial commit...
    git commit -m "Initial commit: MyKitchen Recipe Finder app"
    
    if %errorlevel% equ 0 (
        echo ✅ Initial commit created successfully!
    ) else (
        echo ❌ Failed to create commit. Check if there are files to commit.
        git status
    )
) else (
    echo ✅ Commits exist on main branch
)

echo.
echo 🔗 Checking remote repository...
git remote -v

echo.
echo 📤 Now you can push to GitHub with:
echo git push -u origin main
echo.

echo 🎯 If you still get errors, try:
echo 1. git push --set-upstream origin main
echo 2. git push -f origin main (⚠️ force push - use carefully)
echo.

echo 📖 For complete setup, run: setup-github.bat
echo.
pause