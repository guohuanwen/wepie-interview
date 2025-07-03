#!/bin/bash
# 自动安装 C/C++、Java、Python、JavaScript、TypeScript、C# 环境（适用于 macOS，需 Homebrew）

set -e

echo "开始安装开发环境..."

# 安装 Homebrew（如未安装）
if ! command -v brew &> /dev/null; then
  echo "未检测到 Homebrew，正在安装..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "安装 gcc/g++ (C/C++)..."
brew install gcc

echo "安装 OpenJDK (Java)..."
brew install openjdk

# 配置 JAVA_HOME
sudo ln -sfn $(brew --prefix openjdk)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
export PATH="$(brew --prefix openjdk)/bin:$PATH"

echo "安装 Python3..."
brew install python

echo "安装 Node.js (JavaScript/TypeScript)..."
brew install node

echo "安装 TypeScript..."
npm install -g typescript

echo "安装 .NET SDK (C#)..."
brew install --cask dotnet-sdk

echo "环境安装完成！" 