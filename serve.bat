@echo off
chcp 65001 >nul
echo ============================================
echo   重生之我是反诈先锋 - 本地预览
echo   浏览器将打开 http://localhost:8080
echo   结束后按 Ctrl+C 关闭服务
echo ============================================
start "" http://localhost:8080
python -m http.server 8080
REM 若提示 python 不是命令：
REM   1) 先安装 Python 并勾选 "Add to PATH"；或
REM   2) 改用 Node：将上一行替换为  npx serve
REM   3) 或用 VS Code 安装 Live Server 插件，右键 index.html → Open with Live Server
