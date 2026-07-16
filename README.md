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

## 待作者复核（已无黄底待填空）

两种高亮的含义：
- 🟡 黄底红字 `\FILLIN{...}` = 还需作者填 —— **现已全部处理完，无残留**。
- 🟦 青底 `\AUTOVAL{...}` = **Claude 从 Fig.6（abl1019）图里 Otsu 估算的单图 IoU**：
  Full=**0.74** / High=**0.49** / Low=**0.43**。作者请用真实模型复核后替换/确认；
  确认无误把 `\AUTOVAL{x}` 改成 `x` 去掉高亮即可。

其它：
- F1 样本数据集名已按作者要求**去掉**（不点名，改为 "from the test set"）。
- 失败案例图 Fig.7 用 **FANet 真实预测裁片**（`failure_cases.pdf`，从 `1more_result1106.pdf`
  的伪装/细裂缝类别裁出），带灰边框分隔，无需再出图（原 F5/F6/F7 已取消）。


## 交付版本轨道（平铺，仿 eswa 参考仓库）

`tcyb-r2-submission-20260715/releases/` 里所有版本平铺，命名带两位版本号+日期，tex+pdf 都在：

```
main-revised_v01_20260716.tex / .pdf   ← 正文 3 版（v01 首个R2稿 / v02 失败图真图 / v03 IoU+边框）
main-revised_v02_20260716.tex / .pdf
main-revised_v03_20260716.tex / .pdf
response-r2_v01_20260716.tex / .pdf     ← 回复信 4 版（v01 初稿 / v02 黄底高亮 / v03 失败图 / v04 IoU+边框）
response-r2_v02_20260716.tex / .pdf
response-r2_v03_20260716.tex / .pdf
response-r2_v04_20260716.tex / .pdf
```

- 最新＝正文 `main-revised_v03`、回复信 `response-r2_v04`（两份文档各自独立编号，版本数可不等，与 eswa 一致）。
- 发版脚本：`./release.sh main <NN>` 或 `./release.sh response <NN>`（各自编译、带日期、不覆盖）。
- 工作源：正文 `02_manuscript_小修0715/IEEEtran/main.tex`；回复信 `rebuttal/Rebuttal.tex`。

## 本轮正文改动 (R2)

- 上轮红字全部转黑, 仅本轮新改动标红 (共15处)
- FAM/T-M/HFM 各加"Design intuition"直觉段(公式前); 删除FAM三处重复解释+三段逐式点评(回应R1-Q2精简)
- 新增 IV-H "Failure Cases and Limitations" 小节 + Fig.7 失败案例图(占位)
- Fig.6 图注重写: 标配置名+单图IoU占位; IV-F/IV-G 加选样标准句 (回应R1-Q1)
- Related Work 补7篇近两年文献 (回应AE)
- 全文13页 (TCYB硬顶14页内)
- 待填占位 F1-F7 用黄底红字, PDF无黄块即填完
