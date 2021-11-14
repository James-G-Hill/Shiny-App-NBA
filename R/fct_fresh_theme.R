#' Create an NBA-styled theme for the application
#' 
#' @export
#' 
fresh_theme_nba <- function() {
  
  nba_blue <- "#1d428a"
  nba_red <- "#c8102e"
  
  fresh::create_theme(
    fresh::bs4dash_vars(
      navbar_light_color = "white",
      navbar_light_active_color = nba_blue,
      navbar_light_hover_color = nba_blue
    ),
    fresh::bs4dash_layout(main_bg = "white"),
    fresh::bs4dash_sidebar_dark(
      bg = nba_blue,
      hover_bg = nba_red,
      hover_color = "white",
      color = "white"
    ),
    fresh::bs4dash_status(
      danger = nba_red
    )
  )
  
}
