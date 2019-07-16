#' Function to mask the base round with janitor's round half up
#'
#' @param x number to round
#' @param digits how many digits should be displayed after the decimal point?
#'
#' @return x rounded
#' @export
#'
#' @examples
#' round(0.5)
#' round(1.135, 2)
round <- function(x, digits = 0) {
  janitor::round_half_up(x, digits)
}

