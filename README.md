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
  init/
    setup_env.sh   # 一键安装开发环境脚本
    clean.sh       # 清理生成文件脚本
    test_all.sh    # 批量测试所有示例脚本
    README.md      # 项目说明
```

## 快速开始

1. **安装开发环境（仅限 macOS，需已安装 Homebrew）**

   ```bash
   cd init
   chmod +x setup_env.sh
   ./setup_env.sh
   ```

2. **VSCode 配置建议**

   - 安装 [Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) 插件。
   - 在 `settings.json` 中添加如下配置：

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

   - 各语言代码建议放在对应子目录下。

3. **运行示例**

   - 以 Python 为例，在 `python/` 下新建 `hello.py`，内容如下：

     ```python
     print("Hello, world!")
     ```

   - 右键运行或用 Code Runner 运行即可。

   - 其他语言目录下已包含 hello 示例文件，可直接运行测试。

## 脚本说明

- `setup_env.sh`：一键安装各语言开发环境及依赖。
- `clean.sh`：清理各目录下编译生成的临时文件。
- `test_all.sh`：批量编译并运行所有 hello 示例，检查环境配置是否成功。

## 常见问题

- **权限不足**：请确保脚本有可执行权限，使用 `chmod +x 脚本名.sh`。
- **依赖未安装**：请先运行 `setup_env.sh`。
- **VSCode 无法运行**：请检查 Code Runner 插件和 executorMap 配置。

## 贡献指南

欢迎提交 PR 增加新语言支持或优化脚本。建议遵循以下步骤：

1. 在对应目录添加 hello 示例。
2. 更新 `setup_env.sh` 安装新语言依赖。
3. 更新 `test_all.sh` 增加新语言的测试逻辑。
4. 补充 README 相关说明。

---

如有问题欢迎提 issue 反馈！ 