#' UI dashbody
#'
#' @param id The namespace identifier.
#' @noRd
#' 
mod_dashbody_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  bs4Dash::dashboardBody(
    bs4Dash::tabItems(
      mod_tabitem_chart_ui(ns("tabitem_chart")),
      mod_tabitem_help_ui()
    )
  )
  
}

#' Server dashbody
#'
#' @param id The namespace identifier.
#' @param datasets The datasets as a list.
#' @noRd
#' 
mod_dashbody_server <- function(id, datasets) {
  
  stopifnot(
    is.list(datasets)
  )
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      mod_tabitem_chart_server("tabitem_chart", datasets)
      
    }
  )
  
}