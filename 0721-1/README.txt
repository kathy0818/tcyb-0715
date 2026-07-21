TCYB CYB-E-2025-10-3956  第二轮(小修)修改  Overleaf 项目
=========================================================

本项目包含两份文档，共用同一批图与样式文件(IEEEtran.cls/.bst, IEEEfull.bib)：

  1) main.tex      —— 修改后的正文(manuscript)。回应本轮意见的实质修改标红；
                      语法、数值呈现和参考文献等小修未标红。
  2) Rebuttal.tex  —— 回复审稿人的 response letter。

在 Overleaf 使用：
  - 上传本 zip 新建项目后，点右上角 Menu -> Main document，
    选 main.tex 看正文，或选 Rebuttal.tex 看回复信，再 Recompile 即可。
  - 编译器用默认 pdfLaTeX；参考文献已含 .bib，会自动跑 BibTeX。

投稿前必须完成：
  - 搜索 main.tex 和 Rebuttal.tex 中的 “TO FILL”。Fig.6 的数据集名，以及
    Full / High-Freq / Low-Freq 三个单图 IoU，必须用原始 GT、原始预测概率图和
    正式评测脚本重算后，在两份 tex 中同步替换。
  - 原稿的 0.79/0.61/0.57 无法从排版图稳定复现，且 High/Low 面板存在疑似
    错配；不要采用任何从 PDF/JPEG 反算的近似值。
  - 请对照真实代码确认 T-M 的上采样/拼接公式和 HFM 的乘法符号；当前版本已
    按 Fig.3/Fig.4 做维度与符号一致性修正。
  - 请依据训练与测速日志确认 GPU。当前全文统一为 NVIDIA RTX 3090 Ti。

其他说明：
  - 图片路径已全部拍平(去掉 IEEEtran/ 与 Fig/ 前缀)，无需子文件夹。
  - 当前版本已由 pdfLaTeX + BibTeX 成功编译；无未定义引用或重复 BibTeX key。
