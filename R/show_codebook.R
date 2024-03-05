#' Muestra libro de códigos
#'   (\emph{(Show codebook)})
#'@description
#'
#' Función para explorar la estructura de datos del ICG
#' (\emph{Function to explore the ICG data structure})
#'
#'@return Devuelve un objeto "tbl_df" "tbl" "data.frame" con el libro de códigos del ICG o una "sjTable" con el nombre de las variables, las etiquetas, los valores y las etiquetas de los valores
#'  (\emph{object "tbl_df" "tbl" "data.frame" with the ICG codebook or a "sjTable" with the variables' names, labels, values and value labels})
#'
#'@details Función para obtener la tabla con el libro de códigos
#'  (\emph{Function to show the codebook table})
#'
#' @param data un tibble guardado como objeto en el enviroment luego de consultar \code{\link{get_icg_raw}}
#'  (\emph{A tibble saved as an object in the enviroment after querying \code{\link{get_icg_raw}}}).
#'
#' @param viewer para elegir si la tabla se ve en el visor o se imprime el tibble para ser utilizado
#'  (\emph{choose to view the table in the viewer or print the tibble to be used}).
#'
#'@export


show_codebook <- function(data = NULL,
                          viewer = FALSE){

  if(viewer == FALSE){

    icg_codebook

        }

  else{

    if(is.null(data)){

      data <- opinAr::get_icg_raw() #Download data if needed

      assertthat::assert_that(is.data.frame(data),
                              msg = glue::glue({data}," should be data.frame downloaded with get_icg_raw()"))

      assertthat::assert_that(dim(data)[2] == 28,
                              msg = glue::glue({data}," should be data.frame downloaded with get_icg_raw()"))

      #preview data structure

    sjPlot::view_df(data)

    } else {

      sjPlot::view_df(data)}

      }
  }

