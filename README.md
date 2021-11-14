
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Shiny App with NBA Data

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

This application demonstrates various features of R & Shiny development.

## Installation

This package is currently private only. If you have been given access on
GitHub please follow the instructions below:

``` r
devtools::install_github("James-G-Hill/shiny-app-nba")
```

## Features

Here is a list of notable features of the application:

-   Written as R package with DESCRIPTION file & appropriate directory
    structure
-   Written as a `golem` package with appropriate structure
-   Written to Shiny standards including shiny modules & reactive
    components
-   Source control via Git
-   Package management with `renv`
-   Written to standards of Tidyverse Style Guide
-   Documentation of functions with `roxygen2`
-   GUI created with `bs4Dash` demonstrating BootStrap 4
-   Interactive charts with `esquisse`
-   Interactive tables with `DataTable`
-   Themed with `fresh`
-   Further detailed theming through custom `css`
-   Includes Rmarkdown to split, clean, & conform original data source
-   Favicon created with `hexSticker`

## View the App

You may be able to see the application at the following webpage:

[Shiny NBA Free
Throws](https://james-g-hill.shinyapps.io/shiny-app-nba/)

Note that I do not regularly check the app is still available. It should
work but it is possible that the service providers stops it. If the link
fails then please contact me so that I can restart it.

## Development Setup

In order to work on this application locally you will need the dataset.
First, you will need to download the dataset from the following link:

[NBA Free
Throws](https://www.kaggle.com/sebastianmantey/nba-free-throws)

Then place the dataset in the ‘dev/data/source_data’ directory. You will
then need to open and run the `split_data.Rmd` script. This will create
the data in the ‘dev/data/app_data’ directory.

## Running on shinyapps.io

1.  Create an account at ‘www.shinyapps.io’
2.  Install ‘rsconnect’ package (`install.packages('rsconnect')`)
3.  Follow the instructions for authorizing an account
4.  Load the library ‘rsconnect’ locally (`library('rsconnect')`)
5.  Deploy with `rsconnect::deployApp('path/to/your/app')`

## Attribution

This package uses a free ‘basketball’ icon provided by Font Awesome. The
icon .svg file has been modified so the colour is white. Please find the
link to the license here:

<https://fontawesome.com/license>
