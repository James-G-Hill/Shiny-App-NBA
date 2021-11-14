#' Load data from extdata
#' 
load_data <- function() {
  
  datasets <- list()
  
  datasets$match <-
    readRDS(
      system.file("extdata", "data_match.Rds", package = "shiny.app.nba")
    )
  
  datasets$play <-
    readRDS(
      system.file("extdata", "data_play.Rds", package = "shiny.app.nba")
    )
  
  return(datasets)
  
}
