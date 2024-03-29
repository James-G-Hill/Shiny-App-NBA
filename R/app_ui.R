#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`.
#' @noRd
#' 
app_ui <- function(request) {
  
  preload_variables <-
    list(
      html = waiter::spin_ball(),
      color = "white"
    )
  
  shiny::tagList(
    golem_add_external_resources(),
    bs4Dash::dashboardPage(
      header = mod_header_ui("header"),
      sidebar = mod_sidebar_ui("sidebar"),
      body = mod_dashbody_ui("dashbody"),
      freshTheme = fresh_theme_nba(),
      dark = NULL,
      preloader = preload_variables
    )
  )
  
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @noRd
#' 
golem_add_external_resources <- function() {

  golem::add_resource_path("www", app_sys("app", "www"))
 
  shiny::tags$head(
    golem::favicon(ext = "png"),
    golem::bundle_resources(
      path = app_sys("app", "www"),
      app_title = "shiny.app.nba"
    )
  )
  
}
