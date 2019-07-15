#' Return the financial quarter for the given month
#'
#' @param month
#'
#' @return financial quarter
#' @export
#'
#' @examples
#' data %<>% mutate(quarter = fy_quarter(lubridate::month(date)))
fy_quarter <- function(month) {
  return(c(4, 4, 4, 1, 1, 1, 2, 2, 2, 3, 3, 3)[month])
}
