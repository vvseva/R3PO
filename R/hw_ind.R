#' Get a HW1 questions
#'
#' This function loads questions for the ind task
#'
#' @param login your vle login
#' @return text of the question
#' @export

get_hw_ind_questions <- function(login) {
  require(httr)
  require(dplyr)
  require(stringr)
  # data(sysdata, envir = environment())

  if (missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {
    my_vle_login = login
  }

  if (!my_vle_login %in% R3PO:::ind_task_final$login) {
    print("invalid login")
  } else {
    # test_team = ind_login %>%
    #   dplyr::filter(login == my_vle_login) %>%
    #   dplyr::pull(team)
    #
    # test_vect = ind_login %>%
    #   dplyr::filter(team == test_team) %>%
    #   dplyr::pull("banned ind-task") %>%
    #   unique() %>%
    #   stringr::str_split(pattern = ", ", simplify = T)
    #
    # R3PO:::minor_students %>%
    #   dplyr::filter(student_id == my_vle_login) %>%
    #   dplyr::pull(random_seed) %>%
    #   set.seed()


    return(
      R3PO:::ind_task_final %>%
        dplyr::filter(login == my_vle_login) %>%
        dplyr::pull("task_text")
    )
  }

  # return()
}
