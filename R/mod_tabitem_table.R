#' UI Table Tab
#' 
#' @param id The namespace identifier.
#' @noRd
#' 
mod_tabitem_table_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_table",
    shiny::selectizeInput(
      inputId = ns("table_data"),
      label = "Select Dataset:",
      choices = NULL
    ),
    shiny::dataTableOutput(ns("datatable"))
  )
  
}

#' Server Table Tab
#' 
#' @param id The namespace identifier.
#' @param datasets A list of tibbles.
#' @noRd
#' 
mod_tabitem_table_server <- function(id, datasets) {
  
  stopifnot(
    is.list(datasets)
  )
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      shiny::updateSelectizeInput(
        inputId = "table_data",
        choices = names(datasets)
      )
      
      current_table <- shiny::reactiveVal(value = datasets[[1]])
      
      shiny::observe(
        current_table(datasets[[input$table_data]])
      )
      
      output$datatable <-
        shiny::renderDataTable(
          current_table(),
          options = list(pageLength = 10)
        )
      
    }
  )
  
}
