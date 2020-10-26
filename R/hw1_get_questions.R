#' Get a HW1 questions
#'
#' This function loads questions in df
#'
#' @param login your vle login
#' @return df that you read from a directory
#' @export

get_hw1_questions <- function(login) {
  require(httr)

  if(missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {my_vle_login = login}

  r = httr::GET("https://pub.nosoc.io/content/101/hw1_questions",
                query = list(vle_id = my_vle_login)
  )

  return(httr::content(r))
}
