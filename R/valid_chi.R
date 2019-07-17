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
    if (nchar(chi_number) != 10) {
      return(FALSE)
    }

    # Split the chi number into a vector
    chi_number_vec <- unlist(strsplit(chi_number, ""))

    # Check the month is possible
    month <- as.integer(paste0(chi_number_vec[3], chi_number_vec[4]))

    if (month > 12) {
      return(FALSE)
    }

    # Check the day is possible
    day <- as.integer(paste0(chi_number_vec[1], chi_number_vec[2]))

    # It doesn't deal with leap years (will assume 29 days for Feb always)
    # day must be <= the number of days for the given month
    if (day > c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)[month]) {
      return(FALSE)
    }

    # Convert chi_number_vec into a vector of integers
    chi_number_int_vec <- as.integer(chi_number_vec)

    # Calculte the check digit and compare (digit 10)
    sum_1_9 <- sum(chi_number_int_vec[1:9] * (11 - seq_along(chi_number_int_vec[1:9])))
    check_digit <- ((11 - (sum_1_9 %% 11)) %% 11)

    if (check_digit != chi_number_int_vec[10]) {
      return(FALSE)
    }

    # If the funtion hasn't exited yet, it has passed all the above tests
    return(TRUE)
  })
}
