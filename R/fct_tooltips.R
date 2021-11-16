#' Enable jQuery tooltips
#'
#' @param ... The component to add the tooltip around.
#' @param text The text to use in the tooltip.
#' @noRd
#'
tooltips <- function(..., text) {
  
  shiny::div(
    ...,
    `data-toggle` = "tooltip",
    title = text
  )
  
}
