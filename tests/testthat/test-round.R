test_that("round is being masked properly", {
  expect_equal(round(-0.5, 0), -1)
  expect_equal(round(0.5, 0), 1)
  expect_equal(round(1.125, 2), 1.13)
  expect_equal(round(1.135, 2), 1.14)
})
