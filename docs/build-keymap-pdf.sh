#!/bin/bash
# docs/keymap.html から配列表の PDF を生成する。
#
#   ./docs/build-keymap-pdf.sh [出力先]
#
# 出力先を省略すると ~/Desktop/sosho-keymap.pdf に書き出す。
# config/sosho.keymap を変更したときは docs/keymap.html を同じ内容に直してから実行する。

set -euo pipefail

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
SRC="$(cd "$(dirname "$0")" && pwd)/keymap.html"
OUT="${1:-$HOME/Desktop/sosho-keymap.pdf}"

if [ ! -x "$CHROME" ]; then
  echo "Google Chrome が見つからない: $CHROME" >&2
  exit 1
fi

"$CHROME" --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$OUT" "file://$SRC" 2>/dev/null

echo "$OUT"
