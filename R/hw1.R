#' Load a HW1
#'
#' This function loads a file as a csv.
#'
#' @param login your vle login
#' @return csv file that will be saved loaded to your disk and environment
#' @export


get_hw1_csv <- function(login = Sys.info()["user"]) {
  require(httr, stringr)

  my_vle_login = login

  GET("https://pub.nosoc.io/content/101/data_csv",
      query = list(vle_id = my_vle_login),
      write_disk(str_c("airline_hw_",my_vle_login,".csv"), overwrite=TRUE)
  )
}

open_hw1_csv <- function(login = Sys.info()["user"]) {
  my_vle_login = login

  read.csv(str_c("airline_hw_",my_vle_login,".csv"))
}


get_hw1_questions <- function(login = Sys.info()["user"]) {
  require(httr, stringr)

  my_vle_login = login

  r = GET("https://pub.nosoc.io/content/101/hw_questions",
    query = list(vle_id = my_vle_login))
}
