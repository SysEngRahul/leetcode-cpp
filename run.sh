#!/usr/bin/env bash
set -euo pipefail

# Resolve repo root even if script is called from anywhere
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -ne 1 ]]; then
  echo "Usage: run.sh <relative/path/to/file.cpp>"
  echo "Example: run.sh easy/two_sum.cpp"
  exit 1
fi

SRC="$1"
SRC_PATH="$ROOT/$SRC"

if [[ ! -f "$SRC_PATH" ]]; then
  echo "Error: source file not found: $SRC"
  exit 1
fi

OUT_DIR="$ROOT/build"
OUT_BIN="$OUT_DIR/$(basename "$SRC" .cpp).out"

mkdir -p "$OUT_DIR"

# Compile with warnings enabled (professional defaults)
g++ "$SRC_PATH" -std=c++17 -O2 -Wall -Wextra -Wconversion -pedantic -o "$OUT_BIN"

# Run
"$OUT_BIN"
