#' UI Help Tab
#'
#' @param id The namespace identifier.
#' @noRd
#' 
mod_tabitem_help_ui <- function() {
  
  bs4Dash::tabItem(
    tabName = "tab_help",
    shiny::div(
      class = "jumbotron",
      shiny::h1(class = "display-4", "NBA Free Throws"),
      shiny::p(
        class = "lead",
        "This application demonstrates a Shiny application with NBA data."
      ),
      shiny::hr(class = "my-4"),
      shiny::p(
        "The following features exist for different users:"
      )
    )
  )
  
}
