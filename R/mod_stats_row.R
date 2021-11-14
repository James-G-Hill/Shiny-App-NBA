#' Statistics Row UI
#' 
#' @param id The namespace identifier.
#' @param row_name A header name for the row of results.
#' @noRd
#' 
mod_stats_row_ui <- function(id, row_name) {

  ns <- shiny::NS(id)
  
  shiny::tagList(
    shiny::h3(row_name),
    shiny::fluidRow(
      bs4Dash::valueBoxOutput(ns("games"), width = 3),
      bs4Dash::valueBoxOutput(ns("wins"), width = 3),
      bs4Dash::valueBoxOutput(ns("average_free_throws"), width = 3),
      bs4Dash::valueBoxOutput(ns("average_successful_throws"), width = 3)
    )
  )

}

#' Statistics Row Server
#'
#' @param id The namespace identifier.
#' @param data_match The table of match data.
#' @param team_code The code to identify the team.
#' @noRd
#' 
mod_stats_row_server <- function(id, data_match, team_code) {
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      ns <- session$ns
      
      output$games <-
        bs4Dash::renderValueBox(
          bs4Dash::valueBox(
            value = nrow(data_match),
            subtitle = "Total Games",
            color = "purple",
            icon = shiny::icon("globe-americas"),
            elevation = 4,
            gradient = TRUE
          )
        )
      
      pcnt_won <- pcnt_games_won(data_match, team_code)
      
      output$wins <-
        bs4Dash::renderValueBox(
          bs4Dash::valueBox(
            value = scales::percent(pcnt_won),
            subtitle = "% Games Won",
            color = "success",
            icon = shiny::icon("trophy"),
            elevation = 4,
            gradient = TRUE
          )
        )
      
      output$average_free_throws <-
        bs4Dash::renderValueBox(
          bs4Dash::valueBox(
            value = as.integer(mean(data_match$total_free_throws)),
            subtitle = "Average Free Throws Per Game",
            color = "warning",
            icon = shiny::icon("meteor"),
            elevation = 4,
            gradient = TRUE
          )
        )
      
      pcnt_success <-
        pcnt_successful_free_throws_match(
          data_match$total_free_throws,
          data_match$successful_free_throws
        )
      
      output$average_successful_throws <-
        bs4Dash::renderValueBox(
          bs4Dash::valueBox(
            value = scales::percent(pcnt_success),
            subtitle = "% Successful Free Throws Per Game",
            color = "pink",
            icon = shiny::icon("hand-sparkles"),
            elevation = 4,
            gradient = TRUE
          )
        )
      
    }
  )
  
}
