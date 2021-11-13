fresh_theme <- function() {
  
  nba_blue <- "#1d428a"
  nba_red <- "#c8102e"
  
  fresh::create_theme(
    fresh::bs4dash_layout(
      main_bg = "white"
    ),
    fresh::bs4dash_sidebar_dark(
      bg = nba_blue,
      color = "white",
      hover_bg = nba_red
    )
  )
  
}
