#' Function to mask the base round with janitor's round half up
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
round <- function(...) {
  janitor::round_half_up(...)
}
