#' Count excel files
#'
#' Let's count the number of excel files you have
#'
#' @param type What type of excel files to look for. You can search for XLSX,
#' XLS or both just to be sure.
#' @param recurse Number of levels to recurse or TRUE to recurse fully
#'
#' @return The number of excel files
#' @export
#'
#' @examples
#' count_xl()
count_xl <- function(type = c("xlsx", "xls", "both"), recurse = TRUE) {
  type <- match.arg(type)
  length(list_xl(type = type, recurse = recurse))
}

list_xl <- function(type, recurse) {
  pattern <- switch(
    type,
    xlsx = "\\.xlsx$",
    xls = "\\.xls$",
    both = "\\.xls[x]?$"
  )
  fs::dir_ls(fs::path_expand_r("~"), regexp = pattern, recurse = recurse)
}
