#' UI dashbody
#'
#' @param id The namespace identifier.
#' @noRd
#' 
mod_dashbody_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  bs4Dash::dashboardBody(
    bs4Dash::tabItems(
      mod_tabitem_stats_ui(ns("tabitem_stats")),
      mod_tabitem_strategy_ui(ns("tabitem_strategy")),
      mod_tabitem_chart_ui(ns("tabitem_chart")),
      mod_tabitem_table_ui(ns("tabitem_table")),
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
    is.list(datasets),
    is.data.frame(datasets$match)
  )
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      mod_tabitem_stats_server("tabitem_stats", datasets$match)
      mod_tabitem_strategy_server("tabitem_strategy", datasets)
      mod_tabitem_chart_server("tabitem_chart", datasets)
      mod_tabitem_table_server("tabitem_table", datasets)
      
    }
  )
  
}
