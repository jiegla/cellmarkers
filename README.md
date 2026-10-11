# cellmarkers

**Curated, version-controlled cell marker reference for single-cell tumor studies.**  
用于保存、审计和复用细胞大类与亚群 marker，支持今后持续扩展到不同肿瘤。

## 当前数据

- **Human reference / 未指定肿瘤类型**：来自用户提供的 Excel 工作表（2026-10-11），包含 **76 个亚群、13 个原始大类**。
- [标准化 marker 表](data/human/reference/markers.csv)：统一基因分隔符，保留原始大类、Excel 行号、审核状态与注释。
- [原始内容的 CSV 转存](data/human/reference/source_as_provided.csv)：保留 Excel 四列的原始值，不修改细胞/基因名。
- [待复核问题](docs/QC_REPORT.md)：对可疑注释、缺失 marker 及拼写问题进行显式标记。

> **重要**：当前 Excel 未提供论文、PMID/DOI、测序队列和组织背景；这是一份**待验证的用户整理参考表**，不是已验证的泛癌 marker 数据库。某些 marker 表示状态而非独立谱系；应结合 DotPlot、FeaturePlot、差异基因和样本来源审计。

## 目录

```text
cellmarkers/
├── README.md
├── data/
│   └── human/
│       └── reference/
│           ├── markers.csv                 # 标准化的通用参考
│           └── source_as_provided.csv      # Excel 4 列的原样 CSV 存档
├── templates/
│   └── tumor_markers_template.csv          # 新增肿瘤的统一模板
├── docs/
│   ├── SCHEMA.md                           # 字段字典与更新规则
│   └── QC_REPORT.md                        # 本次待复核清单
└── scripts/
    ├── read_markers.R                      # 用 R 读取与筛选
    └── validate_markers.R                  # 格式和数据质量检查
```

## 后续增加其他肿瘤

采用目录 `data/human/tumor_specific/<tumor_code>/markers.csv`，例如：
- `data/human/tumor_specific/LUAD/markers.csv`：肺腺癌
- `data/human/tumor_specific/THYM/markers.csv`：胸腺瘤
- `data/human/tumor_specific/THYC/markers.csv`：胸腺癌

这些是**命名示例**，目前未导入对应数据。不同肿瘤的 marker 不自动并入通用参考；不覆盖来源不同或相互冲突的证据。

新增时复制 [CSV 模板](templates/tumor_markers_template.csv)，填写物种、肿瘤类型、major/subtype、谱系 marker、亚群 marker 和来源信息；详情见 [字段规范](docs/SCHEMA.md)。

## R 读取

```r
source("scripts/read_markers.R")
ref <- read_cellmarkers("data/human/reference/markers.csv")
subset(ref, major_type == "CD8_T")
strsplit(ref$subtype_markers[1], ";", fixed = TRUE)[[1]]

source("scripts/validate_markers.R")
validate_cellmarkers("data/human/reference/markers.csv")
```

## 数据来源和贡献

初始数据：用户上传的 `附件 celltype markers整理.xlsx`，Sheet1 的 A1:D77。  
当前版本仅保留表格内容的 CSV 形式；如果需要原始工作簿的 Excel 样式、批注等，请另外保存原 XLSX。  
新增/修改需保留 `source_reference` (DOI/PMID/URL)、原始命名和可审计的理由。详见 [SCHEMA](docs/SCHEMA.md)。
