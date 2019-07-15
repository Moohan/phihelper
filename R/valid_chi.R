#' Check to see if a CHI number is valid (not foolproof)
#'
#' @param chi_number
#'
#' @return boolean
#' @export
#'
#' @examples
#' data %<>% filter(valid_chi(chi))
valid_chi <- function(chi_number) {
  purrr::map_lgl(chi_number, function(chi_number) {
    # Check the length
    if (stringr::str_length(chi_number) != 10) {
      return(FALSE)
    }

    # Look at the check digit by recalculating it and comparing
    chi_number <- purrr::map_int(stringr::str_split(chi_number, "", simplify = TRUE), as.integer)
    sum_1_9 <- sum(chi_number[1:9] * (11 - seq_along(chi_number[1:9])))
    check_digit <- ((11 - (sum_1_9 %% 11)) %% 11)

    if (check_digit == chi_number[10]) {
      # If the check digit matches see if the dates look valid
      day <- as.integer(paste0(chi_number[1], chi_number[2]))
      month <- as.integer(paste0(chi_number[3], chi_number[4]))

      # This checks if the days in the month look valid
      # It doesn't deal with leap years (will assume 29 days for Feb always)
      # It will also give FALSE for an invalid month
      if (day <= max(29, lubridate::days_in_month(month), na.rm = TRUE)) {
        return(TRUE)
      }
    }
    return(FALSE)
  })
}
