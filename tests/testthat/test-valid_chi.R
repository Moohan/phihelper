test_that("valid chi identifies bad chi numbers", {
  # Correct CHI
  expect_true(valid_chi("1504915593"))

  # Good dates, bad check digit
  expect_false(valid_chi("1504915594"))

  # Correct check-digit, obviously incorrect date
  expect_false(valid_chi("9999999999"))

  # Incorrect length
  expect_false(valid_chi("123"))

  # Works in a mutate
  test_tib <- tibble::tibble(chi = c("1504915593", "1504915594", "9999999999", "123"),
                             known_valid = c(TRUE, FALSE, FALSE, FALSE))

  test_tib <- dplyr::mutate(test_tib, check_valid = valid_chi(chi))

  expect_equal(test_tib$known_valid, test_tib$check_valid)
})
