# Windows 快速启动指南

本指南介绍如何使用提供的 `.bat` 脚本在 Windows 上快速配置和运行本项目。

## 脚本文件说明

| 脚本名 | 功能 | 运行时机 |
|--------|------|----------|
| `setup.bat` | 一键设置：创建虚拟环境 + 安装依赖 + 生成 .env | **首次使用** |
| `activate.bat` | 激活虚拟环境并打开命令行 | 需要手动执行命令时 |
| `run.bat` | 运行股票分析任务 | 日常分析 |
| `serve.bat` | 启动 Web 服务 | 使用 Web 界面时 |
| `set-openai.bat` | 配置 OpenAI 协议的 API Key 和 URL | 需要配置 AI 模型时 |

---

## 使用步骤

### 1. 首次设置

双击运行 **`setup.bat`**

脚本会自动完成：
- 创建 `venv` 虚拟环境
- 激活虚拟环境
- 安装 `requirements.txt` 中的所有依赖
- 复制 `.env.example` 为 `.env` 配置文件

### 2. 配置 AI API（可选，但推荐）

双击运行 **`set-openai.bat`**

按提示输入：
- `OPENAI_BASE_URL`：API 地址（例如 DeepSeek 填 `https://api.deepseek.com/v1`）
- `OPENAI_API_KEY`：你的 API Key
- `OPENAI_MODEL`：模型名称（可选，例如 `deepseek-chat`）

> 也可以直接用记事本打开 `.env` 文件手动编辑其他配置项。

### 3. 运行

根据需要选择：

| 目标 | 运行脚本 |
|------|----------|
| 运行股票分析 | 双击 `run.bat` |
| 启动 Web 界面 | 双击 `serve.bat`，然后在浏览器打开 `http://127.0.0.1:8000` |
| 手动执行命令（如调试） | 双击 `activate.bat`，然后在打开的命令行中输入命令 |

---

## 常见问题

### Q: 提示 "python 不是内部或外部命令"
A: 请先安装 Python，并在安装时勾选 "Add Python to PATH"。

### Q: 想重新安装依赖怎么办？
A: 删除 `venv` 文件夹，然后重新运行 `setup.bat`。

### Q: 如何修改自选股列表？
A: 用记事本打开 `.env` 文件，找到 `STOCK_LIST=` 这一行，修改股票代码即可。

### Q: 脚本窗口一闪而过怎么办？
A: 可以在脚本上右键 → "编辑"，在最后一行 `pause` 之前加上 `cmd /k` 来保持窗口打开，或者直接从命令行运行脚本查看错误信息。
