#!/bin/bash
# 自动安装 C/C++、Java、Python、JavaScript、TypeScript、C# 环境（适用于 macOS，需 Homebrew）

set -e

echo "开始安装开发环境..."

# 安装 Homebrew（如未安装）
if ! command -v brew &> /dev/null; then
  echo "未检测到 Homebrew，正在安装..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 检查并安装 gcc/g++
echo "检查 gcc/g++ (C/C++)..."
if ! command -v gcc &> /dev/null; then
  echo "未检测到 gcc，正在安装..."
  brew install gcc
else
  echo "gcc 已安装，跳过。"
fi

# 检查并安装 OpenJDK (Java)
echo "检查 OpenJDK (Java)..."
if ! command -v java &> /dev/null; then
  echo "未检测到 Java，正在安装..."
  brew install openjdk
  # 配置 JAVA_HOME
  sudo ln -sfn $(brew --prefix openjdk)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
  export PATH="$(brew --prefix openjdk)/bin:$PATH"
else
  echo "Java 已安装，跳过。"
fi

# 检查并安装 Python3
echo "检查 Python3..."
if ! command -v python3 &> /dev/null; then
  echo "未检测到 Python3，正在安装..."
  brew install python
else
  echo "Python3 已安装，跳过。"
fi
#python引导到python3，并加入到.bashrc
alias python=python3
echo "alias python=python3" >> ~/.bashrc
source ~/.bashrc

# 检查并安装 Node.js
echo "检查 Node.js..."
if ! command -v node &> /dev/null; then
  echo "未检测到 Node.js，正在安装..."
  brew install node
else
  echo "Node.js 已安装，跳过。"
fi

# 检查并安装 TypeScript
echo "检查 TypeScript..."
if ! command -v tsc &> /dev/null; then
  echo "未检测到 TypeScript，正在安装..."
  npm install -g typescript
else
  echo "TypeScript 已安装，跳过。"
fi

# 检查并安装 .NET SDK (C#)
echo "检查 .NET SDK (C#)..."
if ! command -v dotnet &> /dev/null; then
  echo "未检测到 .NET SDK，正在安装..."
  brew install --cask dotnet-sdk
else
  echo ".NET SDK 已安装，跳过。"
fi

echo "安装 VSCode 扩展..."
code --install-extension ms-vscode.cpptools
code --install-extension vscjava.vscode-java-pack
code --install-extension ms-python.python
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension ms-dotnettools.csharp

echo "环境安装完成！" 