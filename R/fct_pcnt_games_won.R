#' Percentage of Games Won
#' 
#' @param data_match The data about matches.
#' @param team_code The code of the team to calculate result for.
#' @return The percentage of games won.
#' @export
#' @importFrom dplyr .data
#' 
pcnt_games_won <- function(data_match, team_code) {
  
  games_played <- nrow(data_match)
  
  home_wins_this_season <-
    data_match |>
    dplyr::filter(
      .data$team_home == team_code,
      .data$team_home_score > .data$team_away_score
    ) |>
    nrow()
  
  away_wins_this_season <-
    data_match |>
    dplyr::filter(
      .data$team_away == team_code,
      .data$team_away_score > .data$team_home_score
    ) |>
    nrow()

  total_wins <- home_wins_this_season + away_wins_this_season
  
  return(total_wins / games_played)
  
}
