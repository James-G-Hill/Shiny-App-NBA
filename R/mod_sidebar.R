#' UI Sidebar
#'
#' @param id The namespace identifier.
#' @noRd
#' 
mod_sidebar_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  bs4Dash::dashboardSidebar(
    id = ns("sidebar_container"),
    minified = FALSE,
    elevation = 1,
    bs4Dash::sidebarMenu(
      id = ns("sidebar"),
      compact = TRUE,
      bs4Dash::menuItem(
        text = "Stats",
        tabName = "tab_stats",
        icon = shiny::icon("calculator")
      ),
      bs4Dash::menuItem(
        text = "Chart",
        tabName = "tab_chart",
        icon = shiny::icon("chart-line")
      ),
      bs4Dash::menuItem(
        text = "Table",
        tabName = "tab_table",
        icon = shiny::icon("table")
      ),
      bs4Dash::menuItem(
        text = "Help",
        tabName = "tab_help",
        icon = shiny::icon("info")
      )
    )
  )
  
}
