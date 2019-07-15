test_that("get correct fy quarter", {
  expect_equal(fy_quarter(1), 4)
  expect_equal(fy_quarter(4), 1)
  expect_equal(fy_quarter(7), 2)
  expect_equal(fy_quarter(10), 3)
})
