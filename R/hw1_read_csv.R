#' Open a HW1 csv
#'
#' This function loads a file as a csv.
#'
#' @param login your vle login
#' @return df that you read from a directory
#' @export

open_hw1_csv <- function(login = Sys.info()["user"]) {
  my_vle_login = login
  
  read.csv(stringr::str_c("airline_hw_",my_vle_login,".csv"))
}