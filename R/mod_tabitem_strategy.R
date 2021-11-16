#' UI Strategy Tab
#' 
#' @param id The namespace identifier.
#' @noRd
#' 
mod_tabitem_strategy_ui <- function(id) {
  
  ns <- shiny::NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_strategy",
    shiny::fluidRow(
      shiny::column(
        width = 3,
        shiny::selectizeInput(
          inputId = ns("season"),
          label = "Pick a season",
          choices = NULL,
          multiple = TRUE
        ),
        shiny::selectizeInput(
          inputId = ns("analysed"),
          label = "Pick what to analyse",
          choices = c("team_home", "team_away", "player"),
          multiple = FALSE
        ),
        shiny::selectizeInput(
          inputId = ns("choices"),
          label = NULL,
          choices = NULL,
          multiple = TRUE
        )
      ),
      shiny::column(
        width = 9,
        shiny::div(
          class = "elevation-4",
          style =
            htmltools::css(
              `background-color` = "#e9ecef",
              padding = shiny::validateCssUnit("10px")
            ),
          shiny::plotOutput(
            outputId = ns("strategy_plot"),
            height = shiny::validateCssUnit("600px")
          )
        )
      )
    )
  )
  
}

#' Server Strategy Tab
#' 
#' @param id The namespace identifier.
#' @param datasets A list of tibbles.
#' @importFrom dplyr .data
#' @noRd
#' 
mod_tabitem_strategy_server <- function(id, datasets) {
  
  stopifnot(
    is.list(datasets),
    is.data.frame(datasets$match),
    is.data.frame(datasets$play)
  )
  
  shiny::moduleServer(
    id,
    function(input, output, session) {
      
      joined_data <-
        dplyr::left_join(
          x = datasets$play,
          y = datasets$match,
          by = "game_id"
        )
      
      shiny::updateSelectizeInput(
        inputId = "season",
        choices = unique(joined_data$season)
      )
      
      shiny::observeEvent(
        shiny::req(input$analysed, input$season),
        {
          choices <-
            joined_data |>
            dplyr::filter(.data$season %in% input$season) |>
            dplyr::pull(input$analysed) |>
            unique() |>
            sort()
          
          shiny::updateSelectizeInput(
            inputId = "choices",
            label = stringr::str_glue("Pick {input$analysed}"),
            choices = choices,
            selected = NULL,
            server = TRUE
          )
        }
      )
      
      ggplot_res <- 96 # best resolution for ggplot2 plots
      
      output$strategy_plot <-
        shiny::renderPlot(
          res = ggplot_res,
          {
            shiny::req(
              input$analysed,
              input$choices,
              input$season
            )
            
            chart_data <-
              joined_data |>
              dplyr::filter(
                .data$season %in% input$season,
                .data[[input$analysed]] %in% input$choices
              )
            
            shiny::req(nrow(chart_data) > 0)
            
            chart_data |>
              dplyr::group_by(
                .data[[input$analysed]],
                .data$period,
                .data$minutes_remaining
              ) |>
              dplyr::summarise(
                free_plays_success = sum(.data$shot_made) / dplyr::n()
              ) |>
              dplyr::ungroup() |>
              ggplot2::ggplot(
                ggplot2::aes(
                  x = .data$minutes_remaining,
                  y = .data$free_plays_success,
                  color = .data[[input$analysed]],
                  group = .data[[input$analysed]]
                )
              ) +
              ggplot2::geom_point() +
              ggplot2::geom_line() +
              ggplot2::scale_x_continuous(
                breaks = \(x) unique(floor(pretty(seq(0, (max(x) + 1) * 1.1)))),
                trans = "reverse"
              ) +
              ggplot2::scale_y_continuous(
                labels = scales::percent,
                breaks = c(0, .25, .5, .75, 1),
                limits = c(0, 1)
              ) +
              ggplot2::facet_grid(
                rows = ggplot2::vars(.data$period),
                labeller =
                  ggplot2::labeller(
                    "period" = \(x) stringr::str_glue("Period {x}")
                  )
              ) +
              ggplot2::labs(
                title = "Averaged Successful Free Throws",
                x = "Minutes Remaining",
                y = "Percentage of successful free throws"
              ) +
              ggplot2::theme_bw() +
              ggplot2::theme(
                panel.grid.minor = ggplot2::element_blank()
              )
          }
        )
      
    }
  )
  
}
