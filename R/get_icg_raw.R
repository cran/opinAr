#' Descarga base de microdatos del ICG
#'   (\emph{(Universidad Torcuato Di Tella)})
#'@description
#'
#'Función que ...
#'
#'@return Devuelve un objeto "tbl_df" "tbl" "data.frame" con los microdatos del ICG....
#'
#'@details Respecto el origen de los datos se puede consultar la documentación en
#' \href{https://www.utdt.edu/ver_contenido.php?id_contenido=1351&id_item_menu=2970}{\code{https://www.utdt.edu/ver_contenido.php?id_contenido=1351&id_item_menu=2970}}.
#'
#'
#'@export


get_icg_raw <- function(){


  # download message one per session hack
  if(base::getOption('descarga-icg', TRUE)){


    message(glue::glue("Indice de Confianza en el Gobierno. Escuela de Gobierno. Universidad Torcuato Di Tella.
  Base de datos descargada el {format(Sys.Date(), '%d %B de %Y')}. Fuente: https://www.utdt.edu/icg. Backup: https://github.com/PoliticaArgentina/data_warehouse"))

    options('descarga-icg' = FALSE)

    }


  ###### DATA SOURCE INFORMATION ########

  # DATA SOURCE URL AND PATH
  main = "https://www.utdt.edu"
  url = "https://www.utdt.edu/ver_contenido.php?id_contenido=17876&id_item_menu=28756"


  # CONDITIONAL LINK BUILIDING
  # .dta or .zip published data

  source <- rvest::read_html(url) %>%
    rvest::html_nodes("a.noicon") %>% # Look for all URLs
    rvest::html_attr('href') %>%
    dplyr::as_tibble()


  # Check for .zip file

  check_zip <- source %>%
    dplyr::filter(stringr::str_detect(value,"\\.zip"))


  icg_file <- if(dim(check_zip)[1] == 1) {
  # GET .dta FILE LINK

  link_zip <- source %>%
    dplyr::filter(stringr::str_detect(value,"\\.zip")) %>% # ICG dta.zip file
    dplyr::transmute(value = as.character(glue::glue("{main}{value}"))) %>%  # Create file link
    dplyr::pull()


  # Download file from URL

  # Create temfiles

  temp <- base::tempfile()

  temp2 <- base::tempfile()

  # Download .zip

  utils::download.file(url = link_zip,  temp, quiet = TRUE)


  # Unzip files

  utils::unzip(zipfile = temp, exdir = temp2)

  # Select .dta file path
   base::list.files(temp2, pattern = ".dta$", full.names=TRUE)

  } else {

     source %>%
      dplyr::filter(stringr::str_detect(value,".dta")) %>% # ICG dta.zip file
      dplyr::transmute(value = as.character(glue::glue("{main}{value}"))) %>%  # Create file link
      dplyr::pull()


  }




  ########################################
  # DOWNLOADING INSTRUTCTIONS

  # Load data from temfile path workflow

  # Set default value for try()

  default <- NULL

  df <- base::suppressWarnings(base::try(default <-  haven::read_dta(icg_file) %>%
                                           janitor::clean_names() %>%
                                           dplyr::rename(anio = ano),
                                         silent = TRUE))




  if(is.null(default)){

    df <- base::suppressWarnings(base::try(default <- haven::read_dta(file = "https://github.com/politicaargentina/data_warehouse/raw/master/opinAr/data_raw/icg.dta") %>%
      janitor::clean_names() %>%
        dplyr::rename(anio = ano),
    silent = TRUE))

   if(is.null(default)){

      df <- base::message("Fail to download data. Source is not available // La fuente de datos no esta disponible")

       } else {

            df <- df

            }

               df

      } else {

      df
    }

}
