# GitHub Pages 部署完整指南

## 📋 前置检查

### 1. 确认已安装工具
```bash
# 检查 Git（应该显示版本号）
git --version

# 检查 Node.js（可选，用于本地测试）
node --version
```

✅ 你的环境：Git 2.52.0 + Node.js v22.19.0（完美！）

---

## 🚀 第一步：创建 GitHub 账号（如已有可跳过）

1. 访问 https://github.com/
2. 点击 "Sign up" 注册账号
3. 填写邮箱、设置密码、用户名（建议用 `AI-Huage` 或类似专业名称）
4. 完成邮箱验证

---

## 📦 第二步：创建 GitHub 仓库

### 方法 A：网页创建（推荐新手）

1. 登录 GitHub 后，点击右上角 **"+"** → **"New repository"**
2. 填写信息：
   - **Repository name**: `ai-prompt-library`（或其他你喜欢的名字）
   - **Description**: `AI 提示词优化库 - 免费提示词优化、模板库、工具导航`
   - **Visibility**: ✅ Public（公开，GitHub Pages 免费托管需要）
   - **Initialize this repository with**: ❌ 不要勾选（我们要上传现有代码）
3. 点击 **"Create repository"**

### 方法 B：使用 GitHub CLI（高级玩家）

```bash
gh repo create ai-prompt-library --public --source=. --remote=origin
```

---

## 🔧 第三步：本地初始化 Git 并推送代码

打开 **Git Bash**（在 `ai-prompt-library` 文件夹右键 → "Git Bash Here"），然后依次执行：

### 1. 初始化 Git 仓库
```bash
cd /c/Users/ADMIN/.real/users/user-adad75c782b748d067dcac88616ce763/workspace/ai-prompt-library
git init
```

### 2. 配置 Git 用户信息（首次使用需要）
```bash
git config --global user.name "你的 GitHub 用户名"
git config --global user.email "你的 GitHub 邮箱"
```

### 3. 添加所有文件到 Git
```bash
git add .
```

### 4. 提交更改
```bash
git commit -m "Initial commit: AI Prompt Library website"
```

### 5. 关联远程仓库（替换为你的仓库地址）
```bash
# 方法 1：HTTPS（需要每次输入密码，不推荐）
git remote add origin https://github.com/你的用户名/ai-prompt-library.git

# 方法 2：SSH（推荐，需要先配置 SSH 密钥）
git remote add origin git@github.com:你的用户名/ai-prompt-library.git
```

### 6. 推送到 GitHub
```bash
# 重命名分支为 main（GitHub 默认主分支）
git branch -M main

# 推送代码
git push -u origin main
```

---

## 🔐 关于身份验证的说明

### 如果你使用 HTTPS 方式：
GitHub 从 2021 年起不再支持账号密码推送，需要使用 **Personal Access Token (PAT)**：

1. 访问 https://github.com/settings/tokens
2. 点击 **"Generate new token (classic)"**
3. 填写 Note（如 "Git Push"），Expiration 选择 "No expiration"（或根据需要设置）
4. 勾选权限：✅ `repo`（完整控制私有仓库）
5. 点击 **"Generate token"**
6. **复制生成的 token**（只显示一次，务必保存好！）
7. 推送时使用 token 代替密码：
   ```bash
   Username: 你的 GitHub 用户名
   Password: 刚才复制的 token（粘贴时不会显示，正常现象）
   ```

### 如果你使用 SSH 方式（推荐）：
需要先配置 SSH 密钥：

1. 生成 SSH 密钥：
   ```bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   # 一路回车即可
   ```

2. 查看公钥内容：
   ```bash
   cat ~/.ssh/id_ed25519.pub
   # Windows Git Bash 使用：
   cat /c/Users/你的用户名/.ssh/id_ed25519.pub
   ```

3. 复制显示的公钥内容，访问 https://github.com/settings/keys
4. 点击 **"New SSH key"**，粘贴公钥，Title 填写 "My Laptop"
5. 点击 **"Add SSH key"**

之后推送就无需输入密码了！

---

## ⚙️ 第四步：启用 GitHub Pages 服务

1. 在你的 GitHub 仓库页面，点击 **"Settings"**（顶部导航栏）
2. 左侧菜单找到并点击 **"Pages"**
3. 在 **"Build and deployment"** 部分：
   - **Source**: 选择 `Deploy from a branch`
   - **Branch**: 选择 `main`，文件夹选择 `/ (root)`
   - 点击 **"Save"**

### 等待部署完成
- GitHub 会自动构建你的网站（约 1-3 分钟）
- 刷新页面，顶部会显示绿色提示框：
  > Your site is live at `https://你的用户名.github.io/ai-prompt-library/`

---

## 🎉 第五步：验证部署结果

### 1. 访问你的网站
在浏览器打开：
```
https://你的用户名.github.io/ai-prompt-library/
```

### 2. 检查内容
- ✅ 页面是否正常加载
- ✅ CSS 样式是否正确显示
- ✅ JavaScript 功能是否正常工作
- ✅ 提示词搜索和复制功能是否可用

### 3. 如果样式丢失（常见问题）
可能原因：文件路径大小写问题或 MIME 类型错误

**解决方案：**
1. 检查 `index.html` 中的 CSS/JS 引用路径：
   ```html
   <!-- 确保路径正确 -->
   <link rel="stylesheet" href="./css/style.css">
   <script src="./js/app.js"></script>
   ```

2. 检查文件名大小写是否一致（GitHub 对大小写敏感）

3. 重新推送代码：
   ```bash
   git add .
   git commit -m "Fix file paths"
   git push
   ```

---

## 🔄 日常更新流程

之后每次修改网站内容后，只需：

```bash
# 1. 在本地修改文件（用 VS Code 或其他编辑器）

# 2. 查看更改
git status

# 3. 添加到暂存区
git add .

# 4. 提交更改
git commit -m "更新提示词模板 / 修复样式问题 / 添加新功能"

# 5. 推送到 GitHub
git push

# 6. 等待 1-3 分钟，GitHub Pages 自动更新
```

---

## 🆚 GitHub Pages vs Cloudflare Pages 对比

| 维度 | GitHub Pages | Cloudflare Pages（你现在的方案） |
|------|-------------|-------------------------------|
| **成本** | 完全免费 | 完全免费 |
| **部署方式** | Git 推送 | Direct Upload / Git / CLI |
| **构建时间** | 1-3 分钟 | Direct Upload 几乎即时 |
| **国内访问** | ⚠️ 不稳定（可能被墙） | ✅ 相对稳定（Cloudflare CDN） |
| **自定义域名** | 免费 | 免费（最多 100 个） |
| **每月流量** | 无限 | 无限 |
| **构建次数** | 无限 | 500 次/月（对你够用） |
| **学习曲线** | 中等（需学 Git） | 低（直接上传） |
| **适合场景** | 博客、开源项目 | 快速上线、免运维 |

---

## 💡 常见问题解答

### Q1: 推送时提示 "Permission denied"？
**A:** 检查 SSH 密钥是否正确配置，或改用 HTTPS + Personal Access Token。

### Q2: 网站显示但样式丢失？
**A:** 
1. 检查 HTML 中 CSS/JS 路径是否正确
2. 确认文件名大小写一致
3. 在浏览器按 F12 查看 Console 错误信息

### Q3: 国内访问很慢或无法访问？
**A:** GitHub Pages 在中国大陆没有 CDN 节点，可以考虑：
- 配合 Cloudflare CDN 使用（需要配置自定义域名）
- 继续使用 Cloudflare Pages（推荐）

### Q4: 如何绑定自定义域名？
**A:** 
1. 在仓库 Settings → Pages → Custom domain 填写你的域名
2. 在域名服务商处添加 CNAME 记录指向 `你的用户名.github.io`
3. 等待 DNS 生效（约 10 分钟 -24 小时）

---

## 🎯 下一步建议

### 如果你想继续体验：
1. 按照上面的步骤完成部署
2. 尝试修改 `index.html` 或添加新的提示词模板
3. 推送代码，观察 GitHub Pages 自动更新

### 如果你觉得太麻烦：
- 继续使用 **Cloudflare Pages Direct Upload** 是更好的选择
- 它更适合你的"零成本、免运维、快速上线"需求

### 如果你想进一步优化：
- 配置自定义域名（如 `aiprompt.huage.com`）
- 添加 GitHub Actions 实现自动化测试
- 集成 Hugo 等静态网站生成器（如果需要博客功能）

---

## 📞 需要帮助？

如果在部署过程中遇到问题：
1. 检查 Git Bash 中的错误信息
2. 查看 GitHub Actions 页面的构建日志
3. 在浏览器 F12 Console 查看前端错误
4. 随时问我！

---

**最后提醒：** GitHub Pages 适合学习和技术展示，但如果你追求国内访问速度和极简部署，**Cloudflare Pages 仍然是更优选择**。

祝你部署顺利！🚀
