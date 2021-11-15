
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
-   Demonstration of variables managed with `config` file
-   Added example test with `testthat`
-   Written to standards of Tidyverse Style Guide
-   Documentation of functions with `roxygen2`
-   GUI created with `bs4Dash` demonstrating BootStrap 4
-   Interactive charts with `esquisse`
-   Interactive tables with `DataTable`
-   Themed with `fresh`
-   Further detailed theming through custom `css`
-   Preloader configured with `waiter`
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

## shinytest

I recorded a `shinytest` to demonstrate that I am capable of doing so.
However, recording this package & the tests with the finished package
will fail. There are 2 current issues which are beyond easy resolution:

-   `phantomJS` won’t record with the `esquisse` package loaded
-   testing currently won’t identify the `bs4Dash::sidebarMenu` id

The `phantomJS` issue maybe a result of that package no longer being
developed. The sidebarMenu ‘id’ issue seems like it should be resolved:

[bs4Dash Issue](https://github.com/RinteRface/bs4Dash/issues/8)

I was unable to get it to work even though the ‘id’ being available in
app. With further time I would investigate further & raise the second
issue again.

## Attribution

This package uses a free ‘basketball’ icon provided by Font Awesome. The
icon .svg file has been modified so the colour is white. Please find the
link to the license here:

<https://fontawesome.com/license>
