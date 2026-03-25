#!/bin/bash

# OpenClaw快速安装脚本
# 作者: NiuCai
# 仓库: https://github.com/niu-cai/openclaw-quick-start

set -e

echo "🚀 开始安装 OpenClaw..."

# 检查Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 未找到Node.js，请先安装Node.js v16+"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 16 ]; then
    echo "❌ Node.js版本过低，需要v16+，当前版本: $(node -v)"
    exit 1
fi

echo "✅ Node.js版本: $(node -v)"

# 安装OpenClaw
echo "📦 安装OpenClaw..."
if command -v npm &> /dev/null; then
    npm install -g openclaw-cn
elif command -v yarn &> /dev/null; then
    yarn global add openclaw-cn
elif command -v pnpm &> /dev/null; then
    pnpm add -g openclaw-cn
else
    echo "❌ 未找到包管理器 (npm/yarn/pnpm)"
    exit 1
fi

echo "✅ OpenClaw安装完成"

# 创建配置目录
echo "📁 创建配置目录..."
mkdir -p ~/.openclaw
mkdir -p ~/.openclaw/workspace
mkdir -p ~/.openclaw/skills

# 复制配置文件
echo "⚙️ 复制配置文件..."
if [ -f "configs/openclaw.json" ]; then
    cp configs/openclaw.json ~/.openclaw/
    echo "✅ 主配置文件已复制"
fi

if [ -f "configs/memory-config.json" ]; then
    cp configs/memory-config.json ~/.openclaw/workspace/
    echo "✅ 记忆系统配置已复制"
fi

# 复制模板文件
echo "📄 复制模板文件..."
if [ -f "templates/SOUL.md" ]; then
    cp templates/SOUL.md ~/.openclaw/workspace/
    echo "✅ SOUL.md模板已复制"
fi

if [ -f "templates/USER.md" ]; then
    cp templates/USER.md ~/.openclaw/workspace/
    echo "✅ USER.md模板已复制"
fi

if [ -f "templates/HEARTBEAT.md" ]; then
    cp templates/HEARTBEAT.md ~/.openclaw/workspace/
    echo "✅ HEARTBEAT.md模板已复制"
fi

# 复制技能
echo "🔧 复制预配置技能..."
if [ -d "skills" ]; then
    cp -r skills/* ~/.openclaw/skills/ 2>/dev/null || true
    echo "✅ 技能文件已复制"
fi

# 设置权限
echo "🔐 设置脚本权限..."
if [ -d "scripts" ]; then
    chmod +x scripts/*.sh 2>/dev/null || true
    echo "✅ 脚本权限已设置"
fi

# 启动服务
echo "🚀 启动OpenClaw服务..."
if command -v openclaw &> /dev/null; then
    openclaw gateway start
    echo "✅ OpenClaw服务已启动"
else
    echo "⚠️  OpenClaw命令未找到，请手动启动"
    echo "   运行: openclaw-cn gateway start"
fi

echo ""
echo "🎉 安装完成！"
echo ""
echo "📚 下一步："
echo "1. 访问 http://localhost:8123 查看Web界面"
echo "2. 运行 'openclaw status' 检查状态"
echo "3. 查看 docs/getting-started.md 获取详细指南"
echo ""
echo "💝 如果这个项目对你有帮助，请考虑："
echo "   - 给仓库点个⭐星标"
echo "   - 通过GitHub Sponsors支持我们"
echo "   - 分享给其他开发者"
echo ""
echo "🔗 项目地址: https://github.com/niu-cai/openclaw-quick-start"
echo "📧 问题反馈: https://github.com/niu-cai/openclaw-quick-start/issues"