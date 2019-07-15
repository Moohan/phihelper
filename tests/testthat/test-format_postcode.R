test_that("postcode formatter works 7-char", {
  expect_type(format_postcode("XX1 1XX"), "character")

  expect_identical(format_postcode("EH1 1AD"), "EH1 1AD")
  expect_identical(format_postcode("G1 1AB"), "G1  1AB")
  expect_identical(format_postcode("EH11 1AA"), "EH111AA")
})

test_that("postcode formatter works 8-char", {
  expect_type(format_postcode("XX1 1XX", length = 8), "character")

  expect_identical(format_postcode("EH1 1AD", length = 8), "EH1  1AD")
  expect_identical(format_postcode("G1 1AB", length = 8), "G1   1AB")
  expect_identical(format_postcode("EH11 1AA", length = 8), "EH11 1AA")
})
