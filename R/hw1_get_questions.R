#' Get a HW1 questions
#'
#' This function loads questions in df
#'
#' @param login your vle login
#' @return df that you read from a directory
#' @export

get_hw1_questions <- function(login = Sys.info()["user"]) {
  require(httr, stringr)
  
  my_vle_login = login
  
  r = httr::GET("https://pub.nosoc.io/content/101/hw_questions",
          query = list(vle_id = my_vle_login))
}