#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}.
#' @noRd
#' 
app_server <- function(input, output, session) {
  
  datasets <-
    if (golem::app_prod()) {
      load_data()
    } else {
      golem::get_golem_options("data")
    }
  
  mod_dashbody_server("dashbody", datasets)
  
}
