#' UI Chart Tab
#' 
#' @param id The namespace identifier.
#' @noRd
#' 
mod_tabitem_chart_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_chart",
    shiny::selectizeInput(
      inputId = ns("chart_data"),
      label = "Select Dataset:",
      choices = NULL
    ),
    esquisse::esquisse_ui(
      id = ns("esquisse_chart"),
      header = FALSE,
      container =
        esquisse::esquisseContainer(
          height = shiny::validateCssUnit("600px")
        )
    )
  )
  
}

#' Server Chart Tab
#' 
#' @param id The namespace identifier.
#' @param datasets A list of tibbles.
#' @noRd
#' @importFrom dplyr .data
#' 
mod_tabitem_chart_server <- function(id, datasets) {
  
  stopifnot(
    is.list(datasets)
  )
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      shiny::updateSelectizeInput(
        inputId = "chart_data",
        choices = names(datasets)
      )
      
      current_chart <-
        shiny::reactiveValues(
          name = names(datasets)[[1]],
          data = datasets[[1]]
        )
      
      shiny::observe(
        {
          current_chart$name <- input$chart_data
          current_chart$data <- datasets[[input$chart_data]]
        }
      )
  
      esquisse::esquisse_server(
        id = "esquisse_chart",
        data_rv = current_chart
      )
      
    }
  )
  
}
