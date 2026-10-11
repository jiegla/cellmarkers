# Cell marker schema / 数据字典

UTF-8 CSV；**每行代表一个 major-subtype marker 参考条目**。第一行为固定字段名，marker 基因采用 HGNC 风格 symbol，用英文分号 `;` 分隔，**不要求三个基因就够**。有来源证据时可添加更多，但不应未经验证自动追加。

| Field | 含义 | 规则 |
| --- | --- | --- |
| `species` | 物种 | `human` / `mouse` 等；不可混用 symbol 命名 |
| `tumor_type` | 肿瘤/组织背景 | 参考集合填 `unspecified`；肿瘤专属需填例如 `LUAD`、`THYM`、`THYC` |
| `major_type` | 细胞大类 | 保留生物学意义；不因局部 marker 擅自改变 |
| `subtype` | 亚群名 | 建议稳定、可识别的 `major_function_marker` 风格 |
| `major_markers` | 细胞谱系/大类支持 marker | HGNC gene symbols，以 `;` 连接 |
| `subtype_markers` | 亚群/状态支持 marker | HGNC gene symbols，以 `;` 连接 |
| `exclusion_markers` | 排除混杂谱系的 marker | 可空；缺少证据时**不能虚构** |
| `source_id` | 来源文件/队列稳定 ID | 例如 `user_xlsx_2026-10-11` |
| `source_reference` | 文献/公共数据来源 | DOI、PMID、URL 或文章名；未知应留空 |
| `source_row` | 原文件 Excel 行号 | 追溯字段；未来可以为空 |
| `review_status` | 审计状态 | `unverified` / `needs_review` / `validated` |
| `curation_notes` | 备注、风险与依据 | 说明错误、歧义、修改理由 |
| `original_major_type` | 原始大类标签 | 为溯源保留（例如 `Endophial`） |

### Status 含义
- **unverified**：未提供外部证据，不能作为已核实的 annotation 答案。
- **needs_review**：存在显式注释冲突/字段缺失/名称不一致，需要人工复核。
- **validated**：已对照标记基因、样本上下文与可追溯证据完成复核。不可因脚本格式检查通过就自动标记。

### 增量维护建议

1. 通用/未指定来源：`data/<species>/reference/markers.csv`。
2. 肿瘤专属：`data/<species>/tumor_specific/<tumor_code>/markers.csv`。
3. 来源不同的数据不直接强行合并；可在一个文件中增加多行，用 `source_id` 区分。
4. 原始记录保持不变；纠错仅作用于标准化表并备注理由。
5. gene symbols 需用权威数据库验证，如 HGNC（人）或 MGI（鼠）；本仓库脚本只检查**格式**，不查询 HGNC。
6. 拓展优先保留 `defining` 与 `exclusion` 两方面证据，避免仅凭单个基因命名。
7. 不上传含患者标识的临床/单细胞原始数据；仅纳入可公开分享的 marker 与来源说明。

使用：
```r
source("scripts/validate_markers.R")
validate_cellmarkers("data/human/reference/markers.csv")
```

### Newly imported tumor datasets

- `NSCLC` contains 51 immune expression clusters from the Liu 2025 post-neoadjuvant anti-PD-1+chemotherapy study; names and evidence statements are traced in `source_tables/02_ALL_51_SUBTYPES.csv`.
- `TET` contains 45 harmonized final-dictionary entries plus 77 separately indexed source-specific references. It is not restricted to thymic carcinoma; do not split it into `THYM`/`THYC` without sample-specific evidence.
- Original workbook sheets are preserved as individual `source_tables/*.csv` with value-level provenance. They retain nuanced signs/intensities absent from the simplified canonical schema.
- Composite annotations such as `TRBC1/2`, `CD4-low/negative`, `CNV`, `EPCAM/KRT epithelial program` are not independent gene symbols. Expanded tokens are suggested for lookup, **not HGNC-certified**.
- TET's integrated final dictionary does not assign one publication to every record. Its per-row `source_reference` is therefore intentionally blank; citation links appear in `source_tables/04_SOURCES.csv`.
