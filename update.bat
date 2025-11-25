@echo off
chcp 65001 >nul
echo ========================================
echo   ChatPDF - 一键升级
echo ========================================
echo.
echo 🔄 正在从 GitHub 拉取最新代码...
git pull origin main

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git 拉取失败，请检查网络或手动执行 git pull
    pause
    exit /b 1
)

echo.
echo 📦 正在更新后端依赖...
cd backend
call venv\Scripts\activate.bat
pip install -r requirements.txt >nul 2>nul
cd ..

echo.
echo 📦 正在更新前端依赖...
cd frontend
call npm install
cd ..

echo.
echo ========================================
echo ✅ 升级完成！
echo ========================================
echo.
echo 💡 提示: 请关闭所有 ChatPDF 窗口后重新运行 start.bat
echo.
pause
