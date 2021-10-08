#' Get a HW1 questions
#'
#' This function loads questions in df
#'
#' @param login your vle login
#' @return df that you read from a directory
#' @export

get_hw1_questions <- function(login) {
  require(dplyr)
  require(stringr)
  require(kableExtra)
  # data(sysdata, envir = environment())

  if (missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {
    my_vle_login = login
  }

  if (!my_vle_login %in% R3PO:::students_2021$name) {
    print("invalid login")
  } else {

    seed = R3PO:::students_2021 %>%
      filter(name == my_vle_login) %>%
      select(random_seed) %>%
      pull()

    set.seed(seed)

    df_q = R3PO::hw1_questions

    q1 = df_q %>%
      filter(Comment == "1 таблица") %>%
      sample_n(1) %>% pull(var = Question)

    q2 = df_q %>%
      filter(Comment == "с текстами") %>%
      sample_n(1) %>% pull(var = Question)

    q3 = df_q %>%
      filter(Comment == "2 таблицы") %>%
      sample_n(1) %>% pull(var = Question)

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
      q1 %>%
        bind_rows(q2)%>%
        bind_rows(q3)%>%
        kbl() %>%
        kable_styling()
    )
  }

  # return()
}

# get_hw1_questions <- function(login) {
#   require(httr)
#
#   if(missing(login)) {
#     my_vle_login = Sys.info()["user"]
#   } else {my_vle_login = login}
#
#   r = httr::GET("https://pub.nosoc.io/content/101/hw1_questions",
#                 query = list(vle_id = my_vle_login)
#   )
#
#   return(httr::content(r))
# }
