# 🚀 OpenClaw 快速入门指南

本指南将帮助你快速安装和配置OpenClaw，让你在几分钟内开始使用这个强大的AI助手。

## 📋 先决条件

在开始之前，请确保你的系统满足以下要求：

### 系统要求
- **操作系统**: Windows 10/11, macOS 10.15+, Ubuntu 18.04+ 或其他Linux发行版
- **Node.js**: v16.0.0 或更高版本
- **内存**: 至少 2GB 可用内存
- **磁盘空间**: 至少 500MB 可用空间

### 检查Node.js版本
```bash
node --version
```

如果未安装Node.js，请访问 [Node.js官网](https://nodejs.org/) 下载并安装。

## 🛠️ 安装OpenClaw

### 方法一：使用安装脚本（推荐）

1. **克隆仓库**
```bash
git clone https://github.com/niu-cai/openclaw-quick-start.git
cd openclaw-quick-start
```

2. **运行安装脚本**
```bash
# 给脚本执行权限
chmod +x scripts/install-openclaw.sh

# 运行安装脚本
./scripts/install-openclaw.sh
```

安装脚本会自动：
- 安装OpenClaw
- 创建配置目录
- 复制配置文件
- 启动OpenClaw服务

### 方法二：手动安装

1. **安装OpenClaw**
```bash
npm install -g openclaw-cn
```

2. **创建配置目录**
```bash
mkdir -p ~/.openclaw
mkdir -p ~/.openclaw/workspace
```

3. **复制配置文件**
```bash
cp configs/openclaw.json ~/.openclaw/
```

4. **启动服务**
```bash
openclaw gateway start
```

## ⚙️ 基本配置

### 配置文件位置
- 主配置文件: `~/.openclaw/openclaw.json`
- 工作区目录: `~/.openclaw/workspace/`

### 重要配置项

#### 记忆系统配置
```json
{
  "memory": {
    "enabled": true,
    "storagePath": "~/.openclaw/workspace/memory",
    "dailyNotes": true,
    "autoBackup": true
  }
}
```

#### 技能配置
```json
{
  "skills": {
    "autoLoad": true,
    "defaultSkills": [
      "memory-system",
      "file-manager",
      "automation-tools"
    ]
  }
}
```

#### 安全配置
```json
{
  "security": {
    "allowedCommands": [
      "openclaw gateway status",
      "openclaw gateway start",
      "openclaw gateway stop",
      "openclaw gateway restart"
    ],
    "requireConfirmation": true
  }
}
```

## 🎯 第一次使用

### 1. 检查服务状态
```bash
openclaw status
```

### 2. 访问Web界面
打开浏览器，访问：`http://localhost:8123`

### 3. 与助手对话
你可以通过以下方式与OpenClaw助手交互：
- **Web界面**: 在浏览器中直接对话
- **命令行**: 使用 `openclaw chat` 命令
- **API**: 通过REST API集成到其他应用

### 4. 配置个性化设置
编辑工作区文件：
- `SOUL.md`: 定义助手的性格和行为
- `USER.md`: 记录你的个人信息和偏好
- `HEARTBEAT.md`: 配置定期检查任务

## 🔧 常用命令

### 服务管理
```bash
# 启动服务
openclaw gateway start

# 停止服务
openclaw gateway stop

# 重启服务
openclaw gateway restart

# 检查状态
openclaw status
```

### 配置管理
```bash
# 查看当前配置
openclaw config get

# 更新配置
openclaw config patch '{"ui": {"theme": "dark"}}'

# 重置配置
openclaw config apply configs/openclaw.json
```

### 技能管理
```bash
# 列出可用技能
openclaw skills list

# 安装技能
openclaw skills install memory-system

# 卸载技能
openclaw skills remove memory-system
```

## 📚 学习资源

### 官方文档
- [OpenClaw官方文档](https://docs.openclaw.ai)
- [GitHub仓库](https://github.com/openclaw/openclaw)
- [社区Discord](https://discord.com/invite/clawd)

### 本仓库资源
- [最佳实践](./best-practices.md) - 使用OpenClaw的最佳实践
- [故障排除](./troubleshooting.md) - 常见问题解决方案
- [技能开发](./skill-development.md) - 如何开发自定义技能

## 🚨 故障排除

### 常见问题

#### 1. 服务无法启动
```bash
# 检查端口占用
netstat -an | grep 8123

# 查看日志
tail -f ~/.openclaw/logs/gateway.log
```

#### 2. 配置不生效
```bash
# 重新加载配置
openclaw gateway restart

# 检查配置文件语法
python3 -m json.tool ~/.openclaw/openclaw.json
```

#### 3. 技能加载失败
```bash
# 查看技能目录
ls ~/.openclaw/skills/

# 重新安装技能
openclaw skills install --force memory-system
```

### 获取帮助
- 查看日志文件: `~/.openclaw/logs/`
- 提交Issue: [GitHub Issues](https://github.com/niu-cai/openclaw-quick-start/issues)
- 联系支持: 815830686@qq.com

## 🎉 下一步

恭喜！你已经成功安装并配置了OpenClaw。接下来可以：

1. **探索预配置技能** - 尝试记忆系统、文件管理等技能
2. **个性化配置** - 根据你的需求调整配置
3. **开发自定义技能** - 创建适合你工作流的技能
4. **加入社区** - 与其他用户交流经验

如果你遇到任何问题或有改进建议，欢迎提交Issue或通过GitHub Sponsors支持本项目！

---
**保持更新**: 定期执行 `git pull` 获取最新更新
**报告问题**: 使用GitHub Issues报告bug或请求功能
**贡献代码**: 欢迎提交Pull Request改进本项目