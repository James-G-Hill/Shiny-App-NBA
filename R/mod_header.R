#' UI Navbar
#'
#' @param id The namespace identifier.
#' @noRd
#' 
mod_header_ui <- function(id) {
  
  brand <-
    shiny::tags$a(
      class = "brand-link",
      href = "https://www.kaggle.com/sebastianmantey/nba-free-throws",
      shiny::tags$img(
        src = file.path("www", "favicon.png"),
        class = "brand-image",
        style = htmltools::css(opacity = 1)
      ),
      shiny::tags$span(
        "NBA Free Throws",
        class = "brand-text font-weight-light",
        style = htmltools::css(color = "white")
      )
    )
  
  bs4Dash::dashboardHeader(
    title = brand,
    compact = TRUE,
    border = FALSE
  )
  
}
