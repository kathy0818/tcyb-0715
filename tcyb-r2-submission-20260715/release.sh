#!/bin/bash
# 统一发版脚本
# 用法: ./release.sh <vN>   例如 ./release.sh v1
# 在一个 releases/<vN>/ 文件夹里同时产出 正文(main) 和 回复信(response) 的 tex+pdf，
# 每个文件名带时间戳；不覆盖已有版本。
#
#   releases/<vN>/
#     main_<vN>_<时间戳>.tex / .pdf         (正文)
#     response_<vN>_<时间戳>.tex / .pdf      (回复信)
#
# 正文工作源: ../02_manuscript_小修0715/IEEEtran/main.tex （图片用 IEEEtran/ 前缀，
#            需从 IEEEtran/ 内用去前缀的临时副本编译；交付 tex 保持原样，PDF 内容一致）
# 回复信工作源: ./rebuttal/Rebuttal.tex
set -e
V="$1"
[ -z "$V" ] && { echo "usage: ./release.sh v1"; exit 1; }
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
TS="$(date +%Y%m%d-%H%M)"
REL="$HERE/releases/$V"
[ -d "$REL" ] && { echo "ERROR: $REL 已存在，禁止覆盖，请用下一个版本号"; exit 1; }
mkdir -p "$REL"

# ---------- 回复信 response ----------
cd "$HERE/rebuttal"
pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
bibtex Rebuttal > /dev/null 2>&1 || true
pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
grep -qE "^!" Rebuttal.log && { echo "回复信 LaTeX 报错:"; grep -E "^!" Rebuttal.log; exit 1; }
cp Rebuttal.tex "$REL/response_${V}_${TS}.tex"
cp Rebuttal.pdf "$REL/response_${V}_${TS}.pdf"

# ---------- 正文 main ----------
cd "$ROOT/02_manuscript_小修0715/IEEEtran"
cp "$ROOT/02_manuscript_小修0715/car.pdf" . 2>/dev/null || true
sed 's#IEEEtran/##g' main.tex > _rel.tex
pdflatex -interaction=nonstopmode _rel.tex > /dev/null
bibtex _rel > /dev/null 2>&1 || true
pdflatex -interaction=nonstopmode _rel.tex > /dev/null
pdflatex -interaction=nonstopmode _rel.tex > /dev/null
grep -qE "^!" _rel.log && { echo "正文 LaTeX 报错:"; grep -E "^!" _rel.log; exit 1; }
MPAGES=$(pdfinfo _rel.pdf | awk '/Pages/{print $2}')
cp main.tex   "$REL/main_${V}_${TS}.tex"
cp _rel.pdf   "$REL/main_${V}_${TS}.pdf"
rm -f _rel.* car.pdf

echo "released -> $REL   (时间戳 $TS, 正文 ${MPAGES} 页)"
ls -1 "$REL"
