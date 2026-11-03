#!/usr/bin/env bash
# 使い方: ./run.sh [event] [size]
#   ./run.sh              → 4種目を既定サイズ(Goで約30秒)で全処理系実行
#   ./run.sh bit 28       → bit全探索だけ n=28 で実行
# 種目と引数:
#   sieve R : N=10^7 のエラトステネスの篩を R 回繰り返す
#   bit n   : n 個の重みの部分和が総和/2 になる組合せ数を 2^n 通り全探索
#   eq N    : 0<=x,y,z<=N で x^2+y^2+z^2 = N^2 の解の個数を三重ループで全探索
#   mat n   : n×n の小数行列の積を素直な三重ループで計算(結果は全要素の和×32)
set -e
export PATH="$PATH:/opt/julia-env/bin"
cd "$(dirname "$0")"
gcc -O3 -march=native -o bench_c bench.c
rustc -C opt-level=3 -C target-cpu=native -o bench_rs bench.rs
go build -o bench_go bench.go
javac Bench.java 2>&1 | grep -v JAVA_TOOL || true

run_one() {
  local ev=$1 p=$2
  echo "=== $ev $p ==="
  ./bench_c "$ev" "$p"
  ./bench_rs "$ev" "$p"
  ./bench_go "$ev" "$p"
  java Bench "$ev" "$p" 2>&1 | grep -v JAVA_TOOL
  node bench.js "$ev" "$p"
  bun bench.js "$ev" "$p"
  pypy3 bench.py "$ev" "$p"
  luajit bench.lua "$ev" "$p"
  julia bench.jl "$ev" "$p"
}

if [ $# -ge 2 ]; then
  run_one "$1" "$2"
else
  run_one sieve 600
  run_one bit 28
  run_one eq 3000
  run_one mat 1750
fi
