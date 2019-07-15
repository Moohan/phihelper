test_that("valid chi identifies bad chi numbers", {
  # Correct check-digit, obviously incorrect date
  expect_false(valid_chi("9999999999"))

  # Incorrect length
  expect_false(valid_chi("123"))
})
