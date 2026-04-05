# Git 初始化脚本使用指南

## 🎯 快速开始

### 方法一：使用简化版脚本（推荐新手）

**文件名**：`init-git-simple.bat`

**特点**：
- 每个步骤都有暂停，不会闪退
- 更清晰的提示信息
- 适合第一次使用 Git 的用户

**使用方法**：
1. 双击 `init-git-simple.bat`
2. 按提示输入信息
3. 每一步完成后按任意键继续

---

### 方法二：使用标准版脚本

**文件名**：`init-git.bat`

**特点**：
- 功能更完整
- 支持更多选项
- 适合有经验的用户

**如果窗口闪退**：
1. 右键点击脚本 → "以管理员身份运行"
2. 或者使用方法一的简化版

---

## 🔧 手动执行（如果脚本仍有问题）

如果两个脚本都无法正常运行，可以手动执行以下命令：

### 步骤 1：打开命令行

在项目文件夹空白处：
- 按住 `Shift` + 右键
- 选择"在此处打开 PowerShell 窗口"或"在终端中打开"

### 步骤 2：逐行执行命令

```bash
# 1. 检查 Git 是否安装
git --version

# 2. 初始化仓库（如果还没有.git 文件夹）
git init

# 3. 配置用户信息（替换为你的信息）
git config user.name "你的 GitHub 用户名"
git config user.email "你的邮箱@example.com"

# 4. 添加所有文件
git add .

# 5. 提交
git commit -m "Initial commit: AI Prompt Library website"

# 6. 重命名分支
git branch -M main

# 7. 添加远程仓库（替换为你的仓库地址）
# HTTPS 方式：
git remote add origin https://github.com/你的用户名/ai-prompt-library.git
# 或 SSH 方式：
git remote add origin git@github.com:你的用户名/ai-prompt-library.git

# 8. 推送到 GitHub
git push -u origin main
```

---

## ❓ 常见问题

### Q1: 脚本双击后直接关闭，什么都没看到

**原因**：脚本执行完毕或遇到错误后自动关闭窗口

**解决方法**：
1. 使用 `init-git-simple.bat`（每个步骤都有 pause）
2. 或者右键 → "以管理员身份运行"
3. 或者手动执行命令（见上方）

### Q2: 显示"Git 未安装"

**解决方法**：
1. 访问 https://git-scm.com/downloads
2. 下载并安装 Git for Windows
3. 安装完成后重启命令行或重新运行脚本

### Q3: 推送失败，提示认证错误

**HTTPS 方式**：
- 需要使用 Personal Access Token，不是账号密码
- 创建 Token：GitHub Settings → Developer settings → Personal access tokens
- 勾选 `repo` 权限
- 推送时 Token 作为密码输入

**SSH 方式**（推荐）：
1. 生成 SSH 密钥：`ssh-keygen -t ed25519 -C "your_email@example.com"`
2. 添加公钥到 GitHub：Settings → SSH and GPG keys
3. 测试连接：`ssh -T git@github.com`

### Q4: 推送失败，提示网络连接问题

**可能原因**：代理软件干扰（如 Clash Verge）

**解决方法**：
1. 临时关闭代理软件的 TUN 模式
2. 或在代理规则中配置 GitHub 域名直连
3. 或使用 SSH 方式（比 HTTPS 更稳定）

---

## 📋 检查清单

运行脚本前，请确认：

- [ ] 已在 GitHub 创建空仓库（名称：`ai-prompt-library`）
- [ ] 已安装 Git（运行 `git --version` 验证）
- [ ] 知道你的 GitHub 用户名和注册邮箱
- [ ] 如果使用 HTTPS，已准备好 Personal Access Token
- [ ] 如果使用 SSH，已配置 SSH 密钥并添加到 GitHub

---

## 🎉 成功标志

脚本成功运行后，你应该看到：

```
========================================
  🎉 初始化完成！
========================================

下一步操作:
1. 访问 https://github.com/你的用户名/ai-prompt-library/settings/pages
2. 在 Branch 下拉框选择 "main"，文件夹选择 "/ (root)"
3. 点击 "Save"
4. 等待 1-3 分钟，网站就会上线

你的网站地址将是:
https://你的用户名.github.io/ai-prompt-library/
```

---

## 📞 需要帮助？

如果遇到问题：
1. 查看 `DEPLOYMENT_CHECKLIST.md` - 详细的故障排查指南
2. 查看 `QUICK_START.md` - 30 分钟快速上线指南
3. 检查项目根目录的 `PROJECT_STATUS.md` - 了解项目完整状态

---

**最后更新**：2026-04-05  
**适用项目**：AI 者华歌 - 市场经营户提示词库
