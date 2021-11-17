#' UI Help Tab
#'
#' @param id The namespace identifier.
#' @noRd
#' 
mod_tabitem_help_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_help",
    shiny::div(
      class = "jumbotron elevation-4",
      shiny::h1(class = "display-4", "NBA Free Throws"),
      shiny::p(
        class = "lead",
        "This application demonstrates a Shiny application with NBA data"
      ),
      shiny::hr(class = "my-4"),
      shiny::p("The following tabs exist for different users:"),
      shiny::div(
        shiny::span(
          tab_button(
            btn_id = ns("tab_stats"),
            tab_name = "Stats",
            bg_color = htmltools::parseCssColors("#c8102e")
          ),
          "for company owner"
        ),
        style = htmltools::css(margin = shiny::validateCssUnit("10px"))
      ),
      shiny::div(
        shiny::span(
          tab_button(
            btn_id = ns("tab_strat"),
            tab_name = "Strategy",
            bg_color = htmltools::parseCssColors("#1d428a")
          ),
          "for team coach"
        ),
        style = htmltools::css(margin = shiny::validateCssUnit("10px"))
      ),
      shiny::div(
        shiny::span(
          tab_button(
            btn_id = ns("tab_chart"),
            tab_name = "Chart",
            bg_color = htmltools::parseCssColors("#c8102e")
          ),
          "for data analyst"
        ),
        style = htmltools::css(margin = shiny::validateCssUnit("10px"))
      ),
      shiny::div(
        shiny::span(
          tab_button(
            btn_id = ns("tab_table"),
            tab_name = "Table",
            bg_color = htmltools::parseCssColors("#1d428a")
          ),
          "to dig deeper"
        ),
        style = htmltools::css(margin = shiny::validateCssUnit("10px"))
      )
    )
  )
  
}

#' Server Help Tab
#' 
#' @param id The namespace identifier.
#' @noRd
#' 
mod_tabitem_help_server <- function(id) {
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      shiny::observeEvent(
        shiny::req(input$tab_stats),
        session$sendCustomMessage("open_tab_js", "tab_stats")
      )
      
      shiny::observeEvent(
        shiny::req(input$tab_strat),
        session$sendCustomMessage("open_tab_js", "tab_strategy")
      )
      
      shiny::observeEvent(
        shiny::req(input$tab_chart),
        session$sendCustomMessage("open_tab_js", "tab_chart")
      )
      
      shiny::observeEvent(
        shiny::req(input$tab_table),
        session$sendCustomMessage("open_tab_js", "tab_table")
      )
      
    }
  )
  
}
