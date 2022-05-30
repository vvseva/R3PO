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

  if (!my_vle_login %in% R3PO:::students_2021$name) {
    stop("invalid login, PLEASE connect with your teachers and show a screenshot of this error")
  } else {

    seed = R3PO:::students_2021 %>%
      filter(name == my_vle_login) %>%
      select(random_seed) %>%
      pull()

    set.seed(seed)
    # message("Будет одно из заданий подобного типа в зависимости от того, что уже сделано в групповом проекте,
    #         финальное задание появится позже")
    # df_q = R3PO:::ind_tasks_2 %>%
    #   sample_n(3)

    # q1 = df_q %>%
    #   # filter(Comment == "1 таблица") %>%
    #   sample_n(1) %>% pull(var = Question)
    #
    # q2 = df_q %>%
    #   # filter(Comment == "с текстами") %>%
    #   sample_n(1) %>% pull(var = Question)
    #
    # q3 = df_q %>%
    #   # filter(Comment == "2 таблицы") %>%
    #   sample_n(1) %>% pull(var = Question)

    test_team = R3PO:::teams_df %>%
      dplyr::filter(name == my_vle_login) %>%
      dplyr::pull(team)
    #
    test_vect = R3PO:::banned_tasks %>%
      dplyr::filter(team == test_team) %>%
      dplyr::pull("banned ind-task") %>%
      unique() %>%
      stringr::str_split(pattern = ", ", simplify = T)
    #
    df_q = R3PO:::ind_tasks_2 %>%
      dplyr::filter(!task_id %in% test_vect) %>%
      sample_n(1)

    # R3PO:::minor_students %>%
    #   dplyr::filter(student_id == my_vle_login) %>%
    #   dplyr::pull(random_seed) %>%
    #   set.seed()


    return(
      df_q %>%
        kableExtra::kbl() %>%
        kableExtra::kable_styling()
    )
  }

  # return()
}
