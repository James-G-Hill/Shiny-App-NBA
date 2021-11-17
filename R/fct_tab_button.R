#' Defines the button for the tabs in the Help panel
#' 
#' @param btn_id The id for the button.
#' @param tab_name The name of the tab to appear on the button.
#' @param bg_color The color of the background of the button.
#' @return An action button for the Help tab.
#' @noRd
#' 
tab_button <- function(btn_id, tab_name, bg_color) {
  
  shiny::actionButton(
    inputId = btn_id,
    label = tab_name,
    width = shiny::validateCssUnit("100px"),
    style =
      htmltools::css(
        color = "white",
        `background-color` = bg_color
      )
  )
  
}
