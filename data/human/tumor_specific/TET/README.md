# Thymic epithelial tumor (TET) marker reference

**Scope:** thymoma, thymic carcinoma, and normal thymic epithelial reference states when relevant. The source workbook integrates several distinct studies; it is **not** a uniform thymic carcinoma cohort and should not be treated as an exclusively malignant-cell signature list.

- **Primary file:** [markers.csv](markers.csv), 45 harmonized `major → subtype → positive markers → exclusion markers` dictionary entries from Sheet `05_FINAL_DICT_4COL`.
- **Extended reference:** [source_tables/02_SUBTYPE_MARKERS.csv](source_tables/02_SUBTYPE_MARKERS.csv), 77 source-annotated subtype records with original names, sources, confidence and context. These are not 77 extra unique final categories.
- **Source sheets:** all eight original workbook sheets converted individually to CSV, including [major gates](source_tables/06_MAJOR_GATES.csv), [TEC crosswalk](source_tables/03_TEC_CROSSWALK.csv), [literature sources](source_tables/04_SOURCES.csv), and the [Codex audit notes](source_tables/07_CODEX_AUDIT_PROMPT.csv).
- **Citations:** the provided workbook lists Feng 2026, Direder 2026, Xin 2022, Yasumizu 2022, and Yasumizu 2024; see `source_tables/04_SOURCES.csv` for DOI links and evidence locations. Since the 45-row final dictionary does not assign a unique source to every row, the normalized `source_reference` is left empty rather than attributing each marker to all five papers.

### Evidence-aware use

- The final dictionary contains phenotype and composite expressions such as `TRBC1/2`, `CD4-low/negative`, `S100A8/A9`, `EPCAM/KRT epithelial program`, `MHC-II-high`, `CNV/aneuploidy`, and `-supporting`. These are **not** literally all distinct gene symbols. `markers.csv` extracts likely gene symbols while the exact statements remain preserved in `05_FINAL_DICT_4COL.csv`.
- **Do not substitute a simple positive-gene list for the negative / intensity condition.** E.g. thymocyte DN/DP requires CD4/CD8 expression context; malignancy requires complementary CNV/pathology evidence.
- Exclusion markers are context-dependent discriminatory evidence, not a blanket biological assertion that every such gene is absolutely zero.
- Some `major_markers` represent alternative lineage-marker sets; individual cells need not express every listed marker.
- High expression of a single marker cannot prove annotation; review cluster-level DE markers, contamination, doublets, tissue and patient reproducibility.
- **29/45** final-dictionary rows are flagged `needs_review` because of composite/intensity/optional clauses or ambiguous identity; these are curation cautions, **not 29 biological errors**.

Use [docs/NEW_DATASETS_AUDIT_2026-10-11.md](../../../../docs/NEW_DATASETS_AUDIT_2026-10-11.md) for QC details.
