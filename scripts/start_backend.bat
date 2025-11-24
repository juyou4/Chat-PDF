@echo off
echo 🚀 启动 ChatPDF 后端服务...

cd /d "%~dp0..\backend"

REM 检查虚拟环境
if not exist "venv" (
    echo 📦 创建虚拟环境...
    python -m venv venv
)

REM 激活虚拟环境
echo 🔧 激活虚拟环境...
call venv\Scripts\activate.bat

REM 安装依赖
echo 📥 安装依赖...
pip install -r requirements_ultimate.txt

REM 启动服务
echo ✨ 启动服务...
echo 🌐 API地址: http://localhost:8000
echo 📚 API文档: http://localhost:8000/docs
echo.
python chatpdf_ultimate_backend.py

pause
