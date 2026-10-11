# NSCLC immune-cell markers — Liu et al., Cell 2025

Source: **A single-cell atlas reveals immune heterogeneity in anti-PD-1-treated non-small cell lung cancer**.  
DOI: https://doi.org/10.1016/j.cell.2025.03.018  
GEO: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE243013

- **Population:** post-neoadjuvant anti-PD-1 + chemotherapy NSCLC immune-cell atlas (CD45+ cells), not a universal NSCLC reference.
- **51 paper-defined expression clusters:** NK/γδT/ILC (6), CD8 T (9), CD4 T (9), B/plasma (10), myeloid (17).
- **Primary file:** [markers.csv](markers.csv), 13-column harmonized schema shared by all tumor datasets.
- **Lossless cell-value exports:** [source_tables/](source_tables/) contains each of the original workbook's seven sheets, including the complete 51-subtype table, major lineage markers, dot-plot panels, TCR-derived T-cell states, analysis labels, and citation list. Workbook styling, Excel comments and formulas are not archived.
- **Source-specific limitation:** the workbook states that complete DEG results in the paper's Table S2 were **not available**; these are the shown/described markers rather than full Table S2.

### Interpretation

- `major_type` harmonizes the manuscript's mixed compartments into more practical lineage classes; `original_major_type` preserves the manuscript compartment. CD8T_NK-like remains T-cell-lineage and should be tested against TCR evidence; γδ T and ILC are not forced into NK.
- `subtype_markers` combines the original defining and supporting gene-symbol lists; prose such as `detectable TCR` and `memory/early-activation program` remains accessible in source tables and notes, not as HGNC gene symbols.
- **Texp and other TCR-derived states** from `04_DERIVED_TCELL_STATES` are **not an additional 52nd expression cluster**.
- `review_status` is deliberately not `validated`: reference-list extraction is not independent validation.

Example R usage from repository root:

```r
source('scripts/read_markers.R')
x <- read_cellmarkers('data/human/tumor_specific/NSCLC/markers.csv')
subset(x, major_type == 'T_cell')
```
