#!/bin/bash

echo "======================================"
echo "  ChatPDF 强制刷新并启动"
echo "======================================"
echo ""

# 1. 强制拉取最新代码
echo "🔄 强制更新代码..."
git fetch origin
git reset --hard origin/main
echo "✅ 代码已强制更新到最新版本"
echo ""

# 2. 清理Python缓存
echo "🧹 清理Python缓存..."
find backend -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null
find backend -name "*.pyc" -delete 2>/dev/null
echo "✅ Python缓存已清理"
echo ""

# 3. 清理端口
echo "🧹 清理端口 8000..."
lsof -ti :8000 | xargs kill -9 2>/dev/null
echo "✅ 端口已清理"
echo ""

# 4. 重新安装依赖
echo "📦 安装后端依赖..."
pip3 install -r backend/requirements.txt
echo ""

# 5. 启动后端
echo "🚀 启动后端..."
python3 backend/app.py &
BACKEND_PID=$!
echo "后端PID: $BACKEND_PID"
echo ""

# 6. 前端
echo "📦 检查前端依赖..."
cd frontend
if [ ! -d "node_modules" ]; then
    npm install
fi

echo ""
echo "✨ 启动前端..."
npm run dev

# 清理
kill $BACKEND_PID 2>/dev/null
