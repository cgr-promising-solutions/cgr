# zzz.R

#' Start up functions
#'
#' @import yaml
#' @import httr
.onAttach <- function(libname, pkgname) {
  # Read in the description of the installed package
  installed <- yaml::read_yaml(system.file("DESCRIPTION", package = "cgr"))

  # Check to see what the latest version is available
  github_url <- "https://raw.githubusercontent.com/cgr-promising-solutions/cgr/master/DESCRIPTION"
  httr::GET(github_url, httr::write_disk("current", TRUE))
  github <- yaml::read_yaml("current")
  unlink("current")

  # Print messages
  packageStartupMessage(paste("CGR Package Version", installed$Version))
  if (installed$Version !=  github$Version){
    update <- paste("Run update_cgr() to upgrade to version", github$Version)
    packageStartupMessage(update)
  }
}
