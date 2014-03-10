# Counts total lines of code in a single file
ncode <- function(file) {
  doc <- readLines(file, warn=FALSE)
  ntotal <- length(doc)
  nblanks <- sum(doc == "")
  ncomments <- length(grep(pattern="^#", doc))
  ncode <- ntotal - nblanks - ncomments
  ncode
}

# Returns vector of full paths to all files with .R extension
get_code_files <- function(directory) {
  files <- list.files(directory, full.names=TRUE)
  grep("^.+\\.[R|r]", files, value=TRUE)
}

#' Counts the total number of lines of R code in a package.
#' 
#' @export
#' @param package_dir Package directory. Must be source code, not a binary.
#' @examples
#' \dontrun{
#' 
#' how_big_is_my_package("~/Dropbox/R_Working_Directory/swirl")
#' }
how_big_is_my_package <- function(package_dir) {
  code_dir <- file.path(package_dir, "R")
  files <- get_code_files(code_dir)
  n <- 0
  for(f in files) {
    n <- n + ncode(f)
  }
  message("Your package, ", basename(package_dir), ", has ",
          n, " lines of code!")
}