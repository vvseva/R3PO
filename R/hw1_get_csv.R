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

  httr::GET("https://pub.nosoc.io/content/101/data_csv",
      query = list(vle_id = my_vle_login),
      httr:write_disk(stringr::str_c("airline_hw_",my_vle_login,".csv"),
                 overwrite=TRUE)
  )
}

