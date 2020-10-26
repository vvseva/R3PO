#' Load set of HW1 dataframe with airlines
#'
#' This function loads a file in your environment
#'
#' @param login your vle login
#' @return dataframe loaded to your environment
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


#' Load set of HW1 dataframe with airports
#'
#' This function loads a file in your environment
#'
#' @param login your vle login
#' @return dataframe loaded to your environment
#' @export

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

#' Load set of HW1 dataframe with seats
#'
#' This function loads a file in your environment
#'
#' @param login your vle login
#' @return dataframe loaded to your environment
#' @export

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

#' Load set of HW1 dataframe with lounges
#'
#' This function loads a file in your environment
#'
#' @param login your vle login
#' @return dataframe loaded to your environment
#' @export

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

