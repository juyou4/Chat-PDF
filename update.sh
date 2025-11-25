#!/bin/bash

echo "========================================"
echo "   ChatPDF - 一键升级"
echo "========================================"
echo ""
echo "🔄 正在从 GitHub 拉取最新代码..."
git pull origin main

if [ $? -ne 0 ]; then
    echo "❌ Git 拉取失败，请检查网络或手动执行 git pull"
    exit 1
fi

echo ""
echo "📦 正在更新后端依赖..."
echo "📦 正在更新后端依赖..."
pip3 install -r backend/requirements.txt

echo ""
echo "📦 正在更新前端依赖..."
cd frontend
npm install
cd ..

echo ""
echo "========================================"
echo "✅ 升级完成！"
echo "========================================"
echo ""
echo "💡 提示: 请关闭所有 ChatPDF 进程后重新运行 ./start.sh"
echo ""
