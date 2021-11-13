# Set options here
options(golem.app.prod = FALSE)

# Detach all loaded packages and clean your environment
golem::detach_all_attached()

# Document and reload your package
golem::document_and_reload()

# Load all data
datasets <- list()

datasets$match <-
  readRDS(
    here::here("dev", "data", "app_data", "data_match.Rds")
  )

datasets$play <-
  readRDS(
    here::here("dev", "data", "app_data", "data_play.Rds")
  )

shiny.app.nba::run_app(
  options = list(launch.browser = TRUE),
  data = datasets
)
