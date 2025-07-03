#!/bin/bash
set -e

echo "===== C ====="
gcc c/hello.c -o c/hello && ./c/hello

echo "===== C++ ====="
g++ cpp/hello.cpp -o cpp/hello && ./cpp/hello

echo "===== Java ====="
javac java/Hello.java && java -cp java Hello

echo "===== Python ====="
python3 python/hello.py

echo "===== JavaScript ====="
node js/hello.js

echo "===== TypeScript ====="
tsc ts/hello.ts --outDir ts && node ts/hello.js

echo "===== C# ====="
dotnet new console -o cs/HelloApp -n HelloApp --force > /dev/null
cp cs/Hello.cs cs/HelloApp/Program.cs
cd cs/HelloApp && dotnet run && cd ../.. 