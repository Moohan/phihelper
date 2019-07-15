#' Format postcodes into a consistent format
#'
#' @param postcode_var
#' @param length (Optional, default: 7-char)
#'
#' @return postcode
#' @export
#'
#' @examples
#' data %<>% mutate(postcode = format_postcode(postcode))
format_postcode <- function(postcode_var, length = 7) {
  # Extract the Outward code, this will be 2 x (letters or numbers)
  # Possibly followed by a number and then a letter
  # e.g G1, EH3 etc...
  outward_code <-
    stringr::str_extract(postcode_var, "^([[:alpha:]][[:alpha:]]?\\d\\w?)")
  # Extract the inward code, this will be a number followed by 2 x (letters or numbers)
  inward_code <-
    stringr::str_extract(postcode_var, "(\\d[[:alpha:]][[:alpha:]])$")

  # Stick them back together padding with the correct number of spaces.
  return(paste0(
    stringr::str_pad(outward_code, (length - 3), side = "right"),
    inward_code
  ))
}
