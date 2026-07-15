#!/bin/bash
# 用法: ./release_manuscript.sh <vN>   例如 ./release_manuscript.sh v1
# 编译正文 main.tex（bibtex+多遍），快照 tex+pdf 到 manuscript_releases/<vN>/，不覆盖旧版。
# 说明：main.tex 用 IEEEtran/ 前缀的图片路径（作者的既有约定），需从 IEEEtran/ 内用
#       去前缀的临时副本编译；交付的 tex 保持原样（IEEEtran/ 路径），PDF 内容一致。
set -e
V="$1"
[ -z "$V" ] && { echo "usage: ./release_manuscript.sh v1"; exit 1; }
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/02_manuscript_小修0715"
REL="$(cd "$(dirname "$0")" && pwd)/manuscript_releases/$V"
[ -d "$REL" ] && { echo "ERROR: $REL 已存在，禁止覆盖，请用下一个版本号"; exit 1; }

cd "$SRC/IEEEtran"
cp "$SRC/car.pdf" . 2>/dev/null || true
sed 's#IEEEtran/##g' main.tex > _rel.tex
pdflatex -interaction=nonstopmode _rel.tex > /dev/null
bibtex _rel > /dev/null || true
pdflatex -interaction=nonstopmode _rel.tex > /dev/null
pdflatex -interaction=nonstopmode _rel.tex > /dev/null
if grep -qE "^!" _rel.log; then echo "LaTeX errors:"; grep -E "^!" _rel.log; exit 1; fi
PAGES=$(pdfinfo _rel.pdf | awk '/Pages/{print $2}')
echo "compiled OK, $PAGES pages"

mkdir -p "$REL"
cp main.tex "$REL/main_$V.tex"
cp _rel.pdf "$REL/main_$V.pdf"
rm -f _rel.* car.pdf
echo "released -> $REL"
ls -la "$REL"
