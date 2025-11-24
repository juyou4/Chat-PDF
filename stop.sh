#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}正在停止 ChatPDF 服务...${NC}"

# 停止后端
if [ -f "backend.pid" ]; then
    BACKEND_PID=$(cat backend.pid)
    if ps -p $BACKEND_PID > /dev/null 2>&1; then
        kill $BACKEND_PID
        echo -e "${GREEN}✅ 后端服务已停止${NC}"
    else
        echo -e "${YELLOW}⚠️  后端服务未运行${NC}"
    fi
    rm backend.pid
else
    echo -e "${YELLOW}⚠️  未找到后端PID文件${NC}"
fi

# 停止前端
if [ -f "frontend.pid" ]; then
    FRONTEND_PID=$(cat frontend.pid)
    if ps -p $FRONTEND_PID > /dev/null 2>&1; then
        kill $FRONTEND_PID
        echo -e "${GREEN}✅ 前端服务已停止${NC}"
    else
        echo -e "${YELLOW}⚠️  前端服务未运行${NC}"
    fi
    rm frontend.pid
else
    echo -e "${YELLOW}⚠️  未找到前端PID文件${NC}"
fi

# 清理残留进程
pkill -f "chatpdf.*backend.py" 2>/dev/null
pkill -f "react-scripts start" 2>/dev/null

echo -e "${GREEN}✅ ChatPDF 已停止${NC}"
