#' Get a HW1 questions
#'
#' This function loads questions in df
#'
#' @param login your vle login
#' @return df that you read from a directory
#' @export

get_hw_ind_questions <- function(login) {
  require(httr)
  require(dplyr)
  data(sysdata, envir = environment())

  if (missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {
    my_vle_login = login
  }

  if (!my_vle_login %in% R3PO:::minor_students$student_id) {
    print("invalid login")
  } else {
    R3PO:::minor_students %>%
      dplyr::filter(student_id == my_vle_login) %>%
      dplyr::pull(random_seed) %>%
      set.seed()


    return(R3PO:::hw1_questions %>%
      dplyr::sample_n(2))
  }

  return()
}
