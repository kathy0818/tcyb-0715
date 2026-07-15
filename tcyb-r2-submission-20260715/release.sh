#!/bin/bash
# 用法: ./release.sh <vN>  例如 ./release.sh v1
# 在 rebuttal/ 下完整编译 Rebuttal.tex（pdflatex+bibtex+2×pdflatex），
# 然后把 tex+pdf 快照到 releases/<vN>/（重命名为 Rebuttal_<vN>.*，不覆盖已有版本）
set -e
V="$1"
[ -z "$V" ] && { echo "usage: ./release.sh v1"; exit 1; }
DIR="$(cd "$(dirname "$0")" && pwd)"
REL="$DIR/releases/$V"
[ -d "$REL" ] && { echo "ERROR: $REL 已存在，不允许覆盖，请用下一个版本号"; exit 1; }

cd "$DIR/rebuttal"
pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
bibtex Rebuttal || true
pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
grep -E "^!" Rebuttal.log && { echo "LaTeX errors found"; exit 1; }

mkdir -p "$REL"
cp Rebuttal.tex "$REL/Rebuttal_$V.tex"
cp Rebuttal.pdf "$REL/Rebuttal_$V.pdf"
echo "released -> $REL"
ls -la "$REL"
