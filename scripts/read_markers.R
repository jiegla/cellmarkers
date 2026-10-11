# Base R helper for cellmarkers CSV (no package dependency).
read_cellmarkers <- function(path, species = NULL, tumor_type = NULL, review_status = NULL) {
  if (!file.exists(path)) stop("File does not exist: ", path)
  x <- utils::read.csv(path, stringsAsFactors = FALSE, check.names = FALSE,
                       na.strings = c("NA"), fileEncoding = "UTF-8")
  for (nm in c("species", "tumor_type", "major_type", "subtype", "major_markers", "subtype_markers")) {
    if (!nm %in% names(x)) stop("Missing required column: ", nm)
  }
  if (!is.null(species)) x <- x[x$species %in% species, , drop = FALSE]
  if (!is.null(tumor_type)) x <- x[x$tumor_type %in% tumor_type, , drop = FALSE]
  if (!is.null(review_status)) x <- x[x$review_status %in% review_status, , drop = FALSE]
  rownames(x) <- NULL
  x
}

marker_genes <- function(x, col = "subtype_markers") {
  if (is.data.frame(x)) x <- x[[col]]
  lapply(x, function(s) {
    if (is.na(s) || !nzchar(s)) character() else trimws(strsplit(s, ";", fixed = TRUE)[[1]])
  })
}
