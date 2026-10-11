# Structural checks only; this does not validate cell identities or HGNC symbols.
validate_cellmarkers <- function(path) {
  if (!file.exists(path)) stop("File does not exist: ", path)
  d <- utils::read.csv(path, stringsAsFactors = FALSE, check.names = FALSE,
                       na.strings = "NA", fileEncoding = "UTF-8")
  cols <- c("species", "tumor_type", "major_type", "subtype", "major_markers",
            "subtype_markers", "exclusion_markers", "source_id", "source_reference",
            "source_row", "review_status", "curation_notes", "original_major_type")
  miss <- setdiff(cols, names(d))
  if (length(miss)) stop("Missing columns: ", paste(miss, collapse = ", "))
  if (any(!nzchar(trimws(d$species)) | !nzchar(trimws(d$major_type)) |
          !nzchar(trimws(d$subtype)) | !nzchar(trimws(d$tumor_type))))
    stop("species / tumor_type / major_type / subtype cannot be empty")
  if (any(!d$review_status %in% c("unverified","needs_review","validated")))
    stop("Invalid review_status")
  key <- paste(d$species, d$tumor_type, d$major_type, d$subtype,
               d$source_id, d$source_row, sep = "::")
  if (anyDuplicated(key)) stop("Duplicate row key(s) detected")
  for (col in c("major_markers", "subtype_markers", "exclusion_markers")) {
    x <- d[[col]]
    x[is.na(x)] <- ""
    if (any(grepl(",", x, fixed = TRUE)))
      stop("Use semicolon rather than comma as gene delimiter in ", col)
    if (any(grepl("(^;|;;|;$)", x)))
      stop("Empty gene token in ", col)
    if (any(grepl("\\s", x[!is.na(x)])))
      warning("Whitespace in ", col, " may indicate an unnormalized gene list")
  }
  message("OK: ", nrow(d), " marker entries; ",
          sum(d$review_status == "needs_review"), " need review.")
  invisible(d)
}
