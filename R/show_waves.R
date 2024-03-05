#' Computa el ICG (\emph{Compute ICG})
#'
#' @description
#' Función para mostrar las olas, el mes y el año
#'  (\emph{Function to compute ICG results})
#'
#' @param data un tibble guardado como objeto en el enviroment luego de consultar \code{\link{get_icg_raw}}
#'  (\emph{A tibble saved as an object in the enviroment after querying \code{\link{get_icg_raw}}}).
#'
#' @param viewer para elegir si la tabla se ve en el visor o se imprime el tibble para ser utilizado
#'  (\emph{choose to view the table in the viewer or print the tibble to be used}).
#'
#' @return devuelve un tibble con \code{class "tbl_df","tbl", "data.frame"} con el número de ola y el mes y año correspondiente
#'  (\emph{returns a tibble with \code{class "tbl_df", "tbl", "data.frame"} with the wave number and the corresponding month and year}).
#'
#'
#' @seealso
#' \code{\link{get_icg_raw}}
#'
#' @export


show_waves <- function(data = NULL,
                       viewer = FALSE){

  assertthat::assert_that(!is.null(data),
                          msg = glue::glue("'data' can not be NULL. Yoy can download ir with 'get_icg_raw() function"))
  #bind the variable locally
  anio <- mes <- fecha <- NULL

    waves <- data %>%
      dplyr::mutate(fecha = base::as.Date(base::paste0(anio,"-",mes,"-01"))) %>%
      dplyr::select(ola, fecha) %>%
      dplyr::group_by(ola) %>%
      dplyr::arrange(fecha) %>%
      dplyr::slice(2) %>%
      dplyr::ungroup() %>%
      dplyr::mutate(mes = lubridate::month(fecha), anio = lubridate::year(fecha)) %>%
      dplyr::select(-fecha)

  if(viewer == FALSE){

    waves

    } else {

      waves %>%
         gt::gt()


    }

  }


