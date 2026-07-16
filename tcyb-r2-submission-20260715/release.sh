#!/bin/bash
# 发版脚本（平铺布局，仿 eswa 参考仓库）
# 用法:
#   ./release.sh main <NN>        例: ./release.sh main 04
#   ./release.sh response <NN>    例: ./release.sh response 05
#
# 产物平铺在 releases/ 里，命名带两位版本号+日期，tex 与 pdf 都出，不覆盖已有：
#   main-revised_v<NN>_<YYYYMMDD>.tex / .pdf     （正文，源: ../02_manuscript_小修0715/IEEEtran/main.tex）
#   response-r2_v<NN>_<YYYYMMDD>.tex / .pdf       （回复信，源: ./rebuttal/Rebuttal.tex）
set -e
DOC="$1"; NN="$2"
[ -z "$DOC" ] || [ -z "$NN" ] && { echo "usage: ./release.sh main|response <NN>   e.g. ./release.sh main 04"; exit 1; }
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"
D="$(date +%Y%m%d)"
REL="$HERE/releases"; mkdir -p "$REL"

case "$DOC" in
  main)
    OUT="main-revised_v${NN}_${D}"
    [ -e "$REL/$OUT.pdf" ] && { echo "ERROR: $OUT 已存在，换版本号"; exit 1; }
    cd "$ROOT/02_manuscript_小修0715/IEEEtran"
    cp "$ROOT/02_manuscript_小修0715/car.pdf" . 2>/dev/null || true
    sed 's#IEEEtran/##g' main.tex > _rel.tex
    pdflatex -interaction=nonstopmode _rel.tex > /dev/null
    bibtex _rel > /dev/null 2>&1 || true
    pdflatex -interaction=nonstopmode _rel.tex > /dev/null
    pdflatex -interaction=nonstopmode _rel.tex > /dev/null
    grep -qE "^!" _rel.log && { echo "LaTeX 报错:"; grep -E "^!" _rel.log; exit 1; }
    PAGES=$(pdfinfo _rel.pdf | awk '/Pages/{print $2}')
    cp main.tex "$REL/$OUT.tex"; cp _rel.pdf "$REL/$OUT.pdf"; rm -f _rel.* car.pdf
    echo "released -> releases/$OUT.{tex,pdf}  (${PAGES} 页)"
    ;;
  response)
    OUT="response-r2_v${NN}_${D}"
    [ -e "$REL/$OUT.pdf" ] && { echo "ERROR: $OUT 已存在，换版本号"; exit 1; }
    cd "$HERE/rebuttal"
    pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
    bibtex Rebuttal > /dev/null 2>&1 || true
    pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
    pdflatex -interaction=nonstopmode Rebuttal.tex > /dev/null
    grep -qE "^!" Rebuttal.log && { echo "LaTeX 报错:"; grep -E "^!" Rebuttal.log; exit 1; }
    cp Rebuttal.tex "$REL/$OUT.tex"; cp Rebuttal.pdf "$REL/$OUT.pdf"
    echo "released -> releases/$OUT.{tex,pdf}"
    ;;
  *) echo "第一个参数必须是 main 或 response"; exit 1;;
esac
ls -1 "$REL"
