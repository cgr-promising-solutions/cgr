# utils.R

#' Update the CGR package
#'
#' This will automatically update the library.
#'
#' @import devtools
#' @export
update_cgr <- function(){
  devtools::install_github("cgr-promising-solutions/cgr")
}
