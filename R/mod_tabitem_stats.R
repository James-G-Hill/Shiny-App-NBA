#' UI Stats Tab
#' 
#' @param id The namespace identifier.
#' @noRd
#' 
mod_tabitem_stats_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  team_code <- get_golem_config("team")
  season <- get_golem_config("season")
  
  bs4Dash::tabItem(
    tabName = "tab_stats",
    shiny::h1(stringr::str_glue("{team_code} : {season}")),
    shiny::hr(),
    mod_stats_row_ui(ns("reg"), "Regular Season"),
    shiny::hr(),
    mod_stats_row_ui(ns("off"), "Playoffs")
  )
  
}

#' Server Stats Tab
#' 
#' @param id The namespace identifier.
#' @param data_match A tibbles of match data.
#' @importFrom dplyr .data
#' @noRd
#' 
mod_tabitem_stats_server <- function(id, data_match) {
  
  stopifnot(
    is.data.frame(data_match)
  )
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      team_code <- get_golem_config("team")
      season <- get_golem_config("season")
      
      match_regular <-
        data_match |>
        dplyr::filter(
          .data$team_home == team_code | .data$team_away == team_code,
          .data$season == season,
          .data$playoffs == "regular"
        )
      
      match_playoff <-
        data_match |>
        dplyr::filter(
          .data$team_home == team_code | .data$team_away == team_code,
          .data$season == season,
          .data$playoffs == "playoffs"
        )
      
      mod_stats_row_server("reg", match_regular, team_code)
      mod_stats_row_server("off", match_playoff, team_code)
      
    }
  )
  
}
