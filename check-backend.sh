#!/bin/bash

echo "======================================"
echo "  ChatPDF Debug - 检查后端代码"
echo "======================================"

# 检查backend/app.py是否包含pdf_url
if grep -q "pdf_url" backend/app.py; then
    echo "✅ backend/app.py 包含 pdf_url 逻辑"
    echo ""
    echo "📄 相关代码片段："
    grep -A 2 -B 2 "pdf_url" backend/app.py | head -20
else
    echo "❌ backend/app.py 不包含 pdf_url 逻辑"
    echo "❌ 代码可能未更新，请检查 git pull 是否成功"
fi

echo ""
echo "======================================"
