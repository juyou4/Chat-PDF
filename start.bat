@echo off
chcp 65001 >nul
echo ========================================
echo   ChatPDF - 一键启动（完整版）
echo ========================================
echo.
echo 包含所有功能：
echo   ✅ PDF文本对话
echo   ✅ 向量检索
echo   ✅ 流式响应
echo   ✅ 表格提取
echo   ✅ 📸 整页截图
echo   ✅ 📸 区域截图
echo   ✅ 📸 AI视觉分析
echo.

REM 检查环境
echo 检查环境...
where python >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 未找到Python，请先安装: https://www.python.org/downloads/
    pause
    exit /b 1
)

where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ 未找到Node.js，请先安装: https://nodejs.org/
    pause
    exit /b 1
)

echo ✅ 环境检查通过
echo.

REM 启动后端
echo ========================================
echo 🚀 启动后端服务...
echo ========================================
cd backend

if not exist "venv" (
    echo 📦 首次运行，创建虚拟环境...
    python -m venv venv
)

call venv\Scripts\activate.bat

echo 📥 安装/更新依赖...
pip install -r requirements.txt >nul 2>nul

echo ✨ 启动后端...
start "ChatPDF Backend" cmd /k "venv\Scripts\activate.bat && python app.py"

cd ..
timeout /t 3 >nul

REM 启动前端
echo.
echo ========================================
echo 🎨 启动前端服务...
echo ========================================
cd frontend

if not exist "node_modules" (
    echo 📦 首次运行，安装依赖（需要几分钟）...
    call npm install
)

REM 确保html2canvas已安装
npm list html2canvas >nul 2>nul
if errorlevel 1 (
    echo 📥 安装截图功能依赖...
    npm install html2canvas
)

echo 配置前端...
(
echo import React from 'react';
echo import ChatPDF from './components/ChatPDF';
echo import './index.css';
echo.
echo function App^(^) {
echo   return ^(
echo     ^<div className="App"^>
echo       ^<ChatPDF /^>
echo     ^</div^>
echo   ^);
echo }
echo.
echo export default App;
) > src\App.js

echo ✨ 启动前端...
start "ChatPDF Frontend" cmd /k "npm start"

cd ..

echo.
echo ========================================
echo ✅ ChatPDF 启动成功！
echo ========================================
echo.
echo 🌐 后端API:  http://localhost:8000
echo 📚 API文档:  http://localhost:8000/docs
echo 🎨 前端界面: http://localhost:3000
echo.
echo 💡 提示:
echo    - 前端会自动在浏览器中打开
echo    - 首次运行请在设置中配置API Key
echo    - 截图功能需选择支持视觉的模型（标有📸）
echo    - 关闭窗口将停止服务
echo.
pause
