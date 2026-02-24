#!/usr/bin/env bash
set -e

# Resolve repo root (directory where this script lives)
ROOT="$(cd "$(dirname "$0")" && pwd)"

if [[ -z "$1" ]]; then
  echo "Usage: run.sh <relative/path/to/file.cpp>"
  echo "Example: run.sh easy/two_sum.cpp"
  exit 1
fi

SRC_REL="$1"
SRC_ABS="$ROOT/$SRC_REL"

if [[ ! -f "$SRC_ABS" ]]; then
  echo "Error: Source file not found: $SRC_ABS"
  exit 1
fi

OUT="$ROOT/build/$(basename "$SRC_REL" .cpp).out"

mkdir -p "$ROOT/build"

g++ "$SRC_ABS" -std=c++17 -O2 -Wall -Wextra -Werror -o "$OUT"

echo "Built: $OUT"
echo "Running..."
"$OUT"
