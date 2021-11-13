
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

## Development Setup

In order to work on this application locally you will need the dataset.
First, you will need to download the dataset from the following link:

[NBA Free
Throws](https://www.kaggle.com/astrospv/free-throw-champs-via-hierarchica-partial-pooling/data)

Then place the dataset in the ‘dev/data/source_data’ directory. You will
then need to open and run the `split_data.Rmd` script. This will create
the data in the ‘dev/data/app_data’ directory.

## Features

Here is a list of notable features of the application:

-   Written as R package with DESCRIPTION file & appropriate directory
    structure
-   Written as a golem package with appropriate structure
-   Written to Shiny standards including shiny modules
-   GUI created with `bs4Dash` demonstrating BootStrap 4
-   Source control via Git
-   Package management with `renv`
-   Includes Rmarkdown to split, clean, & conform original data source
