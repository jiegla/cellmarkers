# Initial marker audit (2026-10-11)

**范围**：原始 Excel Sheet1，76 亚群，13 原始大类，A1:D77。  
**来源证据**：上传的 Excel 没有论文引用、PMID/DOI、组织/癌种背景。以下为内部一致性审计，不是生物学真实性验证。

## 改动和保留策略

- 规范表中的 **Endophial → Endothelial**（原始表共 8 条）；保留 `original_major_type=Endophial` 与原始 CSV。
- 所有原始 subtype 名保留；marker 仅去首尾空格并转换为分号分隔。
- 未提供的 exclusion markers、source_reference 均留空；禁止填充臆测信息。
- **12 条**标记为 `needs_review`，其余标记为 `unverified`。缺少文献/实验复核证据，不将任何条目标成 `validated`。

## 待复核行（Excel 原始行号）

| Excel 行 | 亚群 | 问题与建议 |
| --- | --- | --- |
| 6 | CD4_Th1_like | CXCL13/PDCD1/ICOS may indicate Tfh-like or activated/exhausted CD4 state; Th1 assignment requires further evidence. |
| 18 | NK_CD16_SELL | Subtype name CD16 is not supported by FCGR3A in the supplied marker columns; inspect expression. |
| 24 | NKT_GZMK | NKT placed under NK in source, but CD3D/TRAC/CD3E indicate T-lineage; confirm NKT identity with additional evidence. |
| 25 | NKT | NKT placed under NK in source, but CD3D/TRAC/CD3E indicate T-lineage; confirm NKT identity with additional evidence. |
| 35 | Mono_CD14 | Monocyte subtype nested under source Macrophage category; consider separate Monocyte major class after review. |
| 36 | Mono_CD16 | Monocyte subtype nested under source Macrophage category; consider separate Monocyte major class after review. |
| 37 | Mono_IL1B | Monocyte subtype nested under source Macrophage category; consider separate Monocyte major class after review. |
| 44 | cDC_CD1A | CD1A/CD207-positive DC phenotype may overlap Langerhans-like cells; inspect discriminating markers. |
| 52 | Neu_CXCL8_CXCL4 | Name contains CXCL4, but subtype markers are CCL4/CCL3/CXCL2; inspect cluster name and markers. |
| 73 | EC_Pericyte_like | Endothelial parent markers conflict with pericyte-like KCNJ8/ABCC9/PDGFRB; assess doublets or reannotation. |
| 75 | Pericyte_LAMC3 | Major-lineage marker column is blank in source. |
| 77 | SMC_SEMA3C | Major-lineage marker column is blank in source. |
 
## 使用提醒

- `Mono_*` 的原始 parent 是 Macrophage；将 Monocyte 与 Macrophage 分别统计时须明确重新分层。
- `NKT*` 的原始 parent 是 NK；仅 CD3D/TRAC/CD3E 不足以确认真正 NKT，先审查 TCR / NK marker。
- `EC_Pericyte_like` 在谱系与亚群 marker 之间不一致；需要排查双细胞、ambient RNA 或重注释。
- `Cycling` 及其他激活状态可横跨谱系；不能仅凭 MKI67/TOP2A 定义谱系身份。
- `AT2`、Alveolar_Mac 等可能具有肺组织背景，不等于所有肿瘤通用。
- 任何亚群注释均应参考原始表达分布、细胞占比与患者/样本重复性。
