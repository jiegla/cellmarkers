# New dataset quality review — 2026-10-11

## Coverage and source integrity

| Dataset | Workbook worksheets | Main normalized records | Additional subtype references | Needs review | Documented literature |
| --- | ---: | ---: | ---: | ---: | --- |
| Liu 2025 NSCLC | 7 | 51 | TCR-derived states in separate sheet | 3 | DOI 10.1016/j.cell.2025.03.018 |
| TET integrated | 8 | 45 | 77 literature-derived entries in distinct detailed sheet | 29 | Five references listed in original workbook |

The 45-row TET **harmonized dictionary** and 77-row TET **source-specific atlas** are two levels of the *same* evidence, not 122 unique cell types.

Original file SHA256 checksums:
- NSCLC workbook: `cfbeffa0d438c4b4b3b84bb2284aa8ce8ebc18f18c8275e2abc34e726a01df20`
- TET workbook: `778ad6a06a53c672350928c269ef92179d47ab231f0a870dac3c718d9200ee39`

Each worksheet was exported to a separate CSV and round-trip checked for number of rows and cell-value content (empty Excel cells rendered as empty CSV fields). **Workbook formatting, comments, embedded objects and formula semantics are not part of this CSV archive**.

## Standardization policy

1. Harmonize `major_type`, but retain original compartment in `original_major_type`.
2. Semicolon-separated uppercase gene-like symbols are extracted from defining/supporting marker text. Composite shorthand (`C1QA/B/C`, `TRBC1/2`) may be expanded; **not HGNC-verified**.
3. Natural-language intensities (`high`, `low`, `optional`), negations, ambiguous entities (`EPCAM/KRT epithelial program`) and CNV evidence must be read from the source CSV; they cannot be faithfully reduced to a binary gene set.
4. For NSCLC, source DOI is provided per row; for TET integrated final dictionary, row-to-paper attribution is not explicit, so `source_reference` is blank and the separate source list retained.
5. `review_status=needs_review` means information loss risk or ambiguous subtype identity, not confirmed incorrect annotation. `unverified` is also **not** an assertion of biological correctness.
6. These records must not be used to automatically label patient tumor scRNA-seq without checking cross-lineage conflicts, differential expression and patient-level consistency.

## NSCLC cases requiring manual review

| Sheet row | Subtype | Concern |
| ---: | --- | --- |
| 2 | `CD8T_NK_like_FGFBP2` | NK-like CD8 T: distinguish CD3/TCR-positive T from NK by expression and TCR evidence. |
| 27 | `Bm_CD74` | CD74/B2M are broad antigen-presentation genes, not unique B-memory markers. |
| 47 | `Mφ_VCAN` | VCAN/FCN1/S100A9 suggests monocyte-like phenotype; review macrophage label. |

## TET records flagged for contextual review

Many flags occur solely because the source records use expression-intensity descriptors or concatenated phenotype clauses. Refer to the original `05_FINAL_DICT_4COL.csv` before applying the curated semicolon-delimited gene list. The complete per-row flags are preserved in [`quality_review.csv`](../data/human/tumor_specific/quality_review.csv).

Major areas to audit: DN/DP thymocytes (CD4/CD8 sign), TEC subtype malignant-versus-normal interpretation, TET-specific tumor/stroma modules, pericyte/endothelial discrimination, `NKT_like` label versus bona fide NKT, and exclusion markers versus true absence.

| TET sheet row | Subtype | Curatorial flag |
| ---: | --- | --- |
| 2 | `T_DN` | Defining markers include composite or expression-level descriptions; consult raw final dictionary.; Identity requires coordinated multi-gene expression; not a standalone marker list. |
| 3 | `T_DP` | Identity requires coordinated multi-gene expression; not a standalone marker list. |
| 4 | `T_Cycling_DNDP` | Defining markers include composite or expression-level descriptions; consult raw final dictionary.; Identity requires coordinated multi-gene expression; not a standalone marker list. |
| 13 | `CD8_TRM` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 14 | `gdT` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 15 | `B_Naive` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 16 | `B_Memory` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 17 | `B_GC` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 18 | `Plasma_ASC` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 20 | `NKT_like` | Defining markers include composite or expression-level descriptions; consult raw final dictionary.; Identity requires coordinated multi-gene expression; not a standalone marker list. |
| 24 | `Macrophage_NLRP3` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 25 | `cDC1` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 27 | `pDC` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 28 | `migDC_LAMP3` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 29 | `cTEC_like` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 30 | `mTEC_canonical` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 31 | `mTEC_KRT14_17` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 32 | `mTEC_CHI3L1` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 33 | `mTEC_GNB3_tuft` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 34 | `nmTEC_neuromuscular` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 35 | `Myoid_TEC` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 36 | `Neuroendocrine_TEC` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 37 | `TET_TEC` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 38 | `TC_Carc_TEC_1` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 39 | `TC_Carc_TEC_2` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 40 | `CDH3_malignant` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 41 | `FB_CXCL12` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 42 | `FB_CLU` | Defining markers include composite or expression-level descriptions; consult raw final dictionary. |
| 44 | `FB_medullary_CCL2_MHCII` | Defining markers include composite or expression-level descriptions; consult raw final dictionary.; Identity requires coordinated multi-gene expression; not a standalone marker list. |
