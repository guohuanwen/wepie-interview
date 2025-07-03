# 面试多语言开发环境

本项目支持 C/C++、Java、Python、JavaScript、TypeScript、C# 的本地开发与测试，适合面试和日常练习。

## 目录结构

```
interview/
  c/        # C 代码
  cpp/      # C++ 代码
  java/     # Java 代码
  python/   # Python 代码
  js/       # JavaScript 代码
  ts/       # TypeScript 代码
  cs/       # C# 代码
  setup_env.sh  # 一键安装开发环境脚本
  README.md     # 项目说明
  prd.md        # 产品需求文档
```

## 一键安装开发环境

```bash
chmod +x setup_env.sh
./setup_env.sh
```

> 需 macOS 且已安装 Homebrew。

## VSCode 配置建议

1. 安装 [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) 插件。
2. 在 `settings.json` 中添加如下配置：

```json
{
  "code-runner.executorMap": {
    "c": "gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    "cpp": "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    "java": "javac $fileName && java $fileNameWithoutExt",
    "python": "python3 -u $fileName",
    "javascript": "node $fileName",
    "typescript": "tsc $fileName && node $fileNameWithoutExt.js",
    "csharp": "dotnet run"
  },
  "code-runner.runInTerminal": true
}
```

3. 各语言代码建议放在对应子目录下。

## 示例

- 在 `python/` 下新建 `hello.py`，内容如下：
  ```python
  print("Hello, world!")
  ```
- 右键运行或用 Code Runner 运行即可。 