#' \code{opinAr} package
#'
#' Caja de Herramientas para el procesamiento de la base del ICG
#' See the README on
#' \href{https://github.com/PoliticaArgentina/opinAr/blob/master/README.md}{Github}
#'
#' @docType package
#' @name opinAr
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines

if(getRversion() >= "2.15.1")  utils::globalVariables(c(".",
                                                        "icg",
                                                        "value",
                                                        "eval_gob_rec",
                                                        "benef_gob_rec",
                                                        "adm_gp_rec",
                                                        "cor_gob_rec",
                                                        "resol_prob_rec",
                                                        "ola",
                                                        "icg_weighted",
                                                        "eval_gob_rec_weighted",
                                                        "benef_gob_rec_weighted",
                                                        "adm_gp_rec_weighted",
                                                        "cor_gob_rec_weighted",
                                                        "resol_prob_rec_weighted",
                                                        "ano"))
