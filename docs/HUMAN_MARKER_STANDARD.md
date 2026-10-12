# Human cell marker standard / 人类细胞 Marker 统一规范

本规范用于 `data/human/` 下所有 human marker reference，包括 PBMC、肿瘤免疫、胸腺肿瘤及未来其他癌种。

## Recommended structure

```
data/human/
├── reference/
│   ├── markers.csv
│   └── <reference_name>/
│       ├── markers.csv
│       ├── source_tables/
│       ├── README.md
│       └── QC_REPORT.md
└── tumor_specific/
    └── <tumor_code>/
        ├── markers.csv
        ├── source_tables/
        ├── README.md
        └── QC_REPORT.md
```

## Standard columns

| Field | Description |
|---|---|
| species | human |
| tissue_context | PBMC, lung, thymus, tumor microenvironment, etc. |
| tumor_type | unspecified / LUAD / THYM / THYC / other |
| major_type | T cell, NK, B cell, Myeloid, Epithelial, Stromal |
| subtype | stable cell-state name |
| functional_state | naive, memory, effector, exhausted, cycling, IFN-response etc. |
| major_markers | lineage markers |
| defining_markers | most specific markers defining subtype |
| supporting_markers | additional supporting genes |
| exclusion_markers | markers used to rule out alternatives |
| source_id | dataset identifier |
| source_reference | DOI/PMID/public dataset |
| source_row | original table row |
| review_status | unverified / needs_review / validated |
| curation_notes | interpretation notes |
| original_annotation | original paper name |

## Marker hierarchy

Each subtype should separate:

1. **Lineage markers**
   - Example: CD3D/CD3E/TRBC for T cells
   - MS4A1/CD79A for B cells

2. **Subtype defining markers**
   - Example: GZMK for CD8 Tem GZMK+
   - FOXP3/IL2RA for Treg

3. **Functional state markers**
   - Example: MKI67/TOP2A for cycling
   - ISG15/IFIT1 for interferon response

4. **Exclusion markers**
   - Used only when supported by source evidence.

## Rules

- Do not merge different papers only because cell names are similar.
- Preserve original annotation from publication.
- Preserve source tables whenever possible.
- A marker list is evidence for annotation, not a replacement for cluster-level validation.
- Composite descriptions (`GZMK-high`, `CD4-low`, `CNV-positive`) should remain in notes and not be forced into gene symbols.
