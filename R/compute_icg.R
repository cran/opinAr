#' Computa el ICG (\emph{Compute ICG})
#'
#' @description
#' Función para computar resultados del ICG
#'  (\emph{Function to compute ICG results})
#'
#' @param data un tibble guardado como objeto en el enviroment luego de consultar \code{\link{get_icg_raw}}
#'  (\emph{A tibble saved as an object in the enviroment after querying \code{\link{get_icg_raw}}}).
#'
#' @param wave es el número de ola para la que se quiere computar el ICG
#'  (\emph{number of wave to which compute the ICG}).
#'
#' @param segment_by parámetro para computar el ICG segmentado por distintas variables
#'  (\emph{parameter to compute ICG segmented by different variables}).
#'
#' @return devuelve un tibble con \code{class "tbl_df","tbl", "data.frame"} con el valor del ICG y de cada una de sus dimensiones por una o más olas  y segmentado por las variables deseadas
#'  (\emph{returns a tibble with \code{class "tbl_df", "tbl", "data.frame"} with the value of the ICG and the dimensions for one or more waves and segmented by desired variables}).
#'
#'
#' @seealso
#' \code{\link{get_icg_raw}}
#'
#' @export


compute_icg <- function(data,
                        wave = NULL,
                        segment_by = NULL){

  segment_by <- dplyr::enquo(segment_by)

  # Check parameters

  assertthat::assert_that(base::all(wave > min(data$ola)) & all(wave < max(data$ola)),
                          msg = glue::glue({wave}," does not exist. Check the codebook for the right number of wave"))

  assertthat::assert_that(rlang::quo_name(segment_by) %in% c("NULL","zona","edad","sexo","edu","sit_ec"),
                          msg = glue::glue("This segment is not a valid option. Options available are 'zona','edad','sexo','edu','sit_ec'" ))


  if(base::is.null(wave)){

    data2 <- data

  }

  else {

    data2 <- data  %>%
      dplyr::filter(ola %in% wave)
  }

  data2 %>%
    dplyr::mutate(dplyr::across(c(icg, eval_gob_rec, benef_gob_rec, adm_gp_rec, cor_gob_rec, resol_prob_rec),
                                .fns = list(weighted = ~(.*ponderacion_utdt)),
                                .names = "{col}_weighted")) %>%
    dplyr::group_by(ola, !!segment_by) %>% #para que se desplegue por cualquiera de las variables. Ej. nivel educativo
    dplyr::summarise(dplyr::across(c(icg_weighted, eval_gob_rec_weighted, benef_gob_rec_weighted, adm_gp_rec_weighted, cor_gob_rec_weighted, resol_prob_rec_weighted),
                                   .fns = list(weighted = ~(base::round(base::sum(.)/base::sum(ponderacion_utdt), digits = 2))))) %>%  #promedio de ICG
    purrr::set_names(~stringr::str_remove_all(string = ., pattern = "_weighted")) #cambio los nombres de las variables


}
