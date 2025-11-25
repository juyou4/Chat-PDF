#!/bin/bash

echo "======================================"
echo "  环境诊断脚本"
echo "======================================"
echo ""

# 1. 检查当前目录
echo "📍 当前目录:"
pwd
echo ""

# 2. 检查 Git 状态
echo "📊 Git 状态:"
git status
echo ""

# 3. 检查最新提交
echo "📝 最新 3 个提交:"
git log --oneline -3
echo ""

# 4. 检查远程同步状态
echo "🔄 与远程的差异:"
git fetch origin
git log HEAD..origin/main --oneline
echo ""

# 5. 检查关键文件内容
echo "🔍 检查 ChatPDF.jsx 是否有 v2.0.2:"
if grep -q "v2.0.2" frontend/src/components/ChatPDF.jsx; then
    echo "✅ 找到 v2.0.2"
else
    echo "❌ 未找到 v2.0.2 (代码未更新!)"
fi
echo ""

echo "🔍 检查 backend/app.py 是否有 pdf_url:"
if grep -q "pdf_url" backend/app.py; then
    echo "✅ 找到 pdf_url"
else
    echo "❌ 未找到 pdf_url (代码未更新!)"
fi
echo ""

echo "======================================"
echo "请将以上输出截图发给我！"
echo "======================================"
