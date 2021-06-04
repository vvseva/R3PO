#' Load set of lab06 functions to save r2 server from students
#'
#' This function loads a file in your environment
#'
#' @param word that you want to vectorize
#' @return matrix with embeddings from glove
#' @export

get_lab06_glove_embeddings <-
  function(login, word = "paris") {
    require(httr)
    require(dplyr)

    if (missing(login)) {
      my_vle_login = Sys.info()["user"]
    } else {
      my_vle_login = login
    }

    r = httr::GET(
      "https://pub.nosoc.io/content/133/get_embeddings",
      query = list(input_word = word)
    )

    httr::content(r) %>%
      unlist() %>%
      matrix(ncol = 50) %>%
      return()

  }


#' Load set of HW1 dataframe with airports
#'
#' This function loads a file in your environment
#'
#' @param word that you want to vectorize
#' @param n number of words to return
#' @return dataframe loaded to your environment
#' @export

get_lab06_glove_sim <-
  function(word = "paris", n = 5) {
    require(httr)
    require(tibble)
    require(tidyr)

    r = httr::GET("https://pub.nosoc.io/content/133/find_sim",
                  query = list(input_word = word,
                               n = n))

    tibble::tibble(content = httr::content(r)) %>%
      tidyr::unnest_wider(content) %>%
      return()

  }

