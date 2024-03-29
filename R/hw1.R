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
    stop("invalid login")
  } else {

    seed = R3PO:::students_2021 %>%
      dplyr::filter(name == my_vle_login) %>%
      dplyr::select(random_seed) %>%
      dplyr::pull()

    set.seed(seed)

    # df_q = R3PO:::hw1_questions

    q1 = R3PO:::hw1_questions %>%
      dplyr::filter(Comment == "1 таблица") %>%
      dplyr::sample_n(1) %>%
      dplyr::pull(var = Question)

    q2 = R3PO:::hw1_questions %>%
      dplyr::filter(Comment == "с текстами") %>%
      dplyr::sample_n(1) %>%
      dplyr::pull(var = Question)

    q3 = R3PO:::hw1_questions %>%
      dplyr::filter(Comment == "2 таблицы") %>%
      dplyr::sample_n(1) %>%
      dplyr::pull(var = Question)



    return(
        dplyr::tibble(id = 1:3,
               questions = c(q1, q2, q3)) %>%
          kableExtra::kbl() %>%
          kableExtra::kable_styling()
    )
  }

}


#' Load set of HW1 dataframe with airlines
#'
#' This function loads a file in your environment
#'
#' @param login your vle login
#' @param df_name name of a dataset airline, airport, lounge or seat
#' @return list of dataframes, also write csv files to your disk
#' @export

get_hw1_data <- function(login, df_name = "airline") {
  require(dplyr)
  require(stringr)
  require(kableExtra)
  require(readr)

  if (missing(login)) {
    my_vle_login = Sys.info()["user"]
  } else {
    my_vle_login = login
  }

  message(paste("Hello", my_vle_login))

  if (!my_vle_login %in% R3PO:::students_2021$name) {
    message("Beeeeeep")
    stop("invalid login")
  } else {

    message("Beeep")

    seed <-  R3PO:::students_2021 %>%
      dplyr::filter(name == my_vle_login) %>%
      dplyr::select(random_seed) %>%
      dplyr::pull()

    set.seed(seed)

    if (df_name == "airline") {

      df_to_return <-  R3PO:::airline_sub_1 %>%
        dplyr::slice_sample(prop = 1)

    } else if (df_name == "airport") {

      df_to_return <-  R3PO:::airport_sub_1 %>%
        dplyr::sample_n(1000) %>%
        dplyr::bind_rows(
          dplyr::tibble(
            airport_name = "london-heathrow-airport",
            link = "/watch?v=ZM04jn95YP0",
            title = "London Heathrow Airport customer review",
            author = my_vle_login,
            author_country = "Russia",
            date = Sys.Date(),
            content = "Our first time through Heathrow airport, there was a guide to tell us if they wanted to rebook tickets to Heathrow, so if you are on an urgent flight and you ask, 'Are we going to change your book?' they don't reply. It's a very confusing process, they just tell you: 'Sorry, we did not meet the deadline, but we will do our best to help you.'
          We can't do anything on the ground at Heathrow, so people have to pick up buses, buy a plane for the day and go in another part of the train. It's a really expensive process, as we have to do it in advance. As soon as we tell you the amount of time it takes, we have to tell them – sometimes we don't have someone on hand for more than 45 minutes. So we'll have to put our hand in hands.
          At Heathrow, an agent tells passengers, 'The first time we put on a tour agent, I was on a date with a London airport friend, and we went to Heathrow and tried to book a flight directly on to London Heathrow. There were a lot of people who told us that London Heathrow isn't what they expected it to be on the ground at Heathrow, and if we said 'No' to a group of people who asked us to give them their book, we couldn't understand how they were going to respond.",
            experience_airport = "transit",
            date_visit = "2011-11-11", type_traveller = 'Business',
            overall_rating = 10, queuing_rating = 10,
            terminal_cleanliness_rating = 10, terminal_seating_rating = 10,
            terminal_signs_rating = 10, food_beverages_rating = 50,
            airport_shopping_rating = 10, wifi_connectivity_rating = 10,
            airport_staff_rating = 10, recommended = 1
          )
        ) %>%
        dplyr::slice_sample(prop = 1)

    } else if (df_name == "lounge") {

      df_to_return <- R3PO:::lounge_sub_1 %>%
        dplyr::slice_sample(prop = 1)

    } else if (df_name == "seat") {

      df_to_return <- R3PO:::seat_sub_1 %>%
        dplyr::slice_sample(prop = 1)

    } else {

      stop("wrong dataset name")
      stop()

    }

    message(paste("держи", df_name))
    return(df_to_return)
    message("Beep")

    }

  }
