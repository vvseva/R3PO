#' Load set of HW1 dataframes
#'
#' This function loads a file in your environment
#'
#' @param login your vle login
#' @return csv file that will be saved loaded to your disk and environment
#' @export


get_hw1_airline_df <- function(login) {
  require(httr)

  if(missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {my_vle_login = login}

  r = httr::GET("https://pub.nosoc.io/content/101/hw1_dataframe_airline",
                query = list(vle_id = my_vle_login),
                httr::write_memory()
  )

  content(r)

}

get_hw1_airport_df <- function(login) {
  require(httr)

  if(missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {my_vle_login = login}

  r = httr::GET("https://pub.nosoc.io/content/101/hw1_dataframe_airport",
                query = list(vle_id = my_vle_login),
                httr::write_memory()
  )

  return(httr::content(r))
}

get_hw1_seat_df <- function(login) {
  require(httr)

  if(missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {my_vle_login = login}

  r = httr::GET("https://pub.nosoc.io/content/101/hw1_dataframe_seat",
                query = list(vle_id = my_vle_login),
                httr::write_memory()
  )

  return(content(r))
}

get_hw1_lounge_df <- function(login) {
  require(httr)

  if(missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {my_vle_login = login}

  r = httr::GET("https://pub.nosoc.io/content/101/hw1_dataframe_lounge",
                query = list(vle_id = my_vle_login),
                httr::write_memory()
  )

  return(httr::content(r))
}

