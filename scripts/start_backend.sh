#!/bin/bash

echo "🚀 启动 ChatPDF 后端服务..."

# 进入后端目录
cd "$(dirname "$0")/../backend"

# 检查虚拟环境
if [ ! -d "venv" ]; then
    echo "📦 创建虚拟环境..."
    python3 -m venv venv
fi

# 激活虚拟环境
echo "🔧 激活虚拟环境..."
source venv/bin/activate

# 安装依赖
echo "📥 安装依赖..."
pip install -r requirements_ultimate.txt

# 启动服务
echo "✨ 启动服务..."
echo "🌐 API地址: http://localhost:8000"
echo "📚 API文档: http://localhost:8000/docs"
echo ""
python chatpdf_ultimate_backend.py
