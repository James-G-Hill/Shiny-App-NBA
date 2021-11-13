golem::fill_desc(
  pkg_name = "shiny.app.nba",
  pkg_title = "Example Shiny App with NBA Data",
  pkg_description = "Example Shiny App with NBA Data.",
  author_first_name = "James",
  author_last_name = "Hill",
  author_email = "j.g.hill@zoho.com",
  repo_url = "https://github.com/James-G-Hill/shiny-app-nba.git"
)     
golem::set_golem_options()
usethis::use_mit_license( "Golem User" )
usethis::use_readme_rmd( open = FALSE )
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge( "Experimental" )
usethis::use_news_md( open = FALSE )
usethis::use_git()
golem::use_recommended_tests()
golem::use_recommended_deps()
golem::use_favicon()
golem::remove_favicon()
golem::use_utils_ui()
golem::use_utils_server()
rstudioapi::navigateToFile( "dev/02_dev.R" )
