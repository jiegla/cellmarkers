# Available datasets

| Dataset | File | Rows | Scope | Evidence / notes |
| --- | --- | ---: | --- | --- |
| Human reference | [`data/human/reference/markers.csv`](../data/human/reference/markers.csv) | 76 | User-supplied mixed tissue reference; tumor unspecified | Initial unvalidated reference |
| NSCLC immune atlas | [`data/human/tumor_specific/NSCLC/markers.csv`](../data/human/tumor_specific/NSCLC/markers.csv) | 51 | Immune cells post neoadjuvant anti-PD-1 + chemotherapy | Liu et al. Cell 2025, doi:10.1016/j.cell.2025.03.018 |
| TET integrated final dictionary | [`data/human/tumor_specific/TET/markers.csv`](../data/human/tumor_specific/TET/markers.csv) | 45 | Thymoma/thymic carcinoma and normal TEC crosswalk, multiple sources | Five listed publications; source-specific detailed reference has 77 rows |

`NSCLC` and `TET` are **dataset scopes**, not interchangeable tumor-specific signatures. TET should not be silently split into `THYM` or `THYC` until sample-specific source labels are available.

All new datasets include `source_tables/` (one UTF-8 CSV per original worksheet), a source README, retained subtype names and row-level provenance.

For **additional tumor types**, use `data/human/tumor_specific/<tumor_code>/markers.csv` and `templates/tumor_markers_template.csv`. Document specimen context, references, treatment, expected marker signs, confidence and known pitfalls in `<tumor_code>/README.md`.
