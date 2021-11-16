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
      label = "Select Dataset",
      choices = NULL
    ),
    shiny::hr(),
    DT::dataTableOutput(ns("datatable"))
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
        DT::renderDataTable(
          {
            dt_table <-
              current_table() |>
              dplyr::rename_with(
                \(x) {
                  x |>
                    stringr::str_replace_all("_", " ") |>
                    stringr::str_to_title()
                }
              ) |>
              DT::datatable(
                rownames = FALSE,
                selection = "none",
                style = "bootstrap4",
                options =
                  list(
                    lengthChange = FALSE,
                    pageLength = 5,
                    scrollX = TRUE
                  )
              )
            
            if (input$table_data == "match") {
              dt_table |>
                DT::formatPercentage("Pcnt Successful Free Throws")
            } else {
              dt_table
            }
          }
        )
      
    }
  )
  
}
