#' Percentage Successful Free Throws Per Match
#' 
#' @param total_free_throws A vector of total free throws per match.
#' @param successful_free_throws A vector of successful free throws per match.
#' @return The percentage of successful free throws per match.
#' @export
#' @importFrom dplyr .data
#' 
pcnt_successful_free_throws_match <- function(total_free_throws,
                                              successful_free_throws
) {
  
  mean_total_free_throws <- mean(total_free_throws)
  mean_successful_free_throws <- mean(successful_free_throws)
  
  return(mean_successful_free_throws / mean_total_free_throws)

}
