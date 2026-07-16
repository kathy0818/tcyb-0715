TCYB CYB-E-2025-10-3956  第二轮(小修)修改  Overleaf 项目
=========================================================

本项目包含两份文档，共用同一批图与样式文件(IEEEtran.cls/.bst, IEEEfull.bib)：

  1) main.tex      —— 修改后的正文(manuscript)。本轮新改动标红，上轮红字已转黑。
  2) Rebuttal.tex  —— 回复审稿人的 response letter。

在 Overleaf 使用：
  - 上传本 zip 新建项目后，点右上角 Menu -> Main document，
    选 main.tex 看正文，或选 Rebuttal.tex 看回复信，再 Recompile 即可。
  - 编译器用默认 pdfLaTeX；参考文献已含 .bib，会自动跑 BibTeX。

说明：
  - 正文 Fig.6 图注里 3 个单图 IoU (青色高亮 0.79/0.61/0.57) 为粗算值，
    待作者用模型复核后把 \AUTOVAL{x} 改成 x 去掉高亮即可。
  - 图片路径已全部拍平(去掉 IEEEtran/ 与 Fig/ 前缀)，无需子文件夹。
