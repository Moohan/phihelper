test_that("valid chi identifies bad chi numbers", {
  # Good dates, bad check digit
  expect_false(valid_chi("1504915594"))

  # Correct check-digit, obviously incorrect date
  expect_false(valid_chi("9999999999"))

  # Incorrect length
  expect_false(valid_chi("123"))
})

test_that("valid_chi identifies good chi numbers", {
  # Correct CHI
  expect_true(valid_chi("1504915593"))
})

test_that("valid_chi works in a mutate", {
  # Create a tibble to test on
  test_tib <- tibble::tibble(chi = c("1504915593", "1504915594", "9999999999", "123"),
                             known_valid = c(TRUE, FALSE, FALSE, FALSE))

  # Apply the function
  test_tib <- dplyr::mutate(test_tib, check_valid = valid_chi(chi))

  # Compare
  expect_equal(test_tib$known_valid, test_tib$check_valid)
})
