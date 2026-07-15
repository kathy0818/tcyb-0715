# TCYB CYB-E-2025-10-3956 小修（R2）工作仓库

论文：*Harnessing Frequency-Aware Network for Crack Detection in Road-Perceptive Autonomous Vehicles Scene*

## 目录结构

```
00_materials/                        # 原始材料
├── CYB-E-2025-10-3956_Proof_hi.pdf  #   上轮大修提交版（正文+红字+response）
└── review_and_AE_comments_小修意见.docx  # 本轮（小修）AE+审稿人意见

01_previous_round_大修0715_rebuttal/ # 上轮大修的回复信 LaTeX 源码（参考模板）

02_manuscript_小修0715/              # 本轮正文 LaTeX 工作目录（main.tex 在 IEEEtran/ 下）

tcyb-r2-submission-20260715/         # 本轮（第二轮/小修）交付
├── rebuttal/                        #   回复信 LaTeX 源码（工作副本）
└── releases/                        #   版本化交付：每版 = tex + pdf，不覆盖
    ├── v1/
    ├── v2/
    └── ...
```

## 本轮意见摘要

- **Reviewer 2**：已建议接受，无需修改。
- **Reviewer 1**：3 条——① 频域可视化的代表性/选样标准/图注加单图指标；② III-B/III-C 模块描述冗长，先直觉后公式；③ 新增失败案例与局限性小节。
- **AE**：呼应 R1 三条 + Related Work 补充近两年文献（须含 TCYB 本刊）。

## 待作者填写（PDF 中橙色 `[[TO FILL Fx]]` 标记）

见 `tcyb-r2-submission-20260715/rebuttal/Rebuttal.tex` 顶部「待填清单」注释块（F1–F8）：
Fig.6 样本数据集与三个单图 IoU；失败案例拼图（3行×3列）及其数据集来源、三个单图 IoU。
