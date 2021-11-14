test_that(
  "test pcnt successful free throws",
  {
    total_free_throws <- c(100, 50)
    successful_free_throws <- c(90, 45)
    
    actual <-
      pcnt_successful_free_throws_match(
        total_free_throws,
        successful_free_throws
      )
    
    expect_equal(actual, .9)
  }
)