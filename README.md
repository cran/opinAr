
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Datos de `opin`ión de política `Ar`rgentina usando `R` <a><img src="man/figures/logo.png" width="200" align="right" /></a>

### ICG

`{opinAr}` brinda herramientas que facilitan el acceso y el trabajo con
datos de opinión del *Índice de Confianza en el Gobierno* (ICG),
relevados por la Universidad Torcuato Di Tella.

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/opinAr)](https://CRAN.R-project.org/package=opinAr)
[![R build
status](https://github.com/PoliticaArgentina/opinAr/workflows/R-CMD-check/badge.svg)](https://github.com/PoliticaArgentina/opinAr/actions)

<!-- badges: end -->

-   `get_icg_raw()` descarga la base de microdatos del ICG

-   `show_codebook()` permite explorar el libro de códgios (variables,
    etiquetas y valores)

-   `show_waves()` lista las olas de la encuesta con sus respectivos
    años y meses

-   `compute_icg()`permite calcular el índice general y el de las
    distintas dimensiones

------------------------------------------------------------------------

### Índice de Confianza en el Gobierno. Escuela de Gobierno. Universidad Torcuato Di Tella [utdt.edu/icg](https://www.utdt.edu//ver_contenido.php?id_contenido=1351&id_item_menu=2970)

*El ICG tiene como objetivo medir la evolución de la opinión pública
respecto de la labor que desarrolla el gobierno nacional. Está diseñado
de forma de captar lo que los ciudadanos piensan respecto de aspectos
esenciales del gobierno nacional, a partir de la estimación de cinco
dimensiones*:

*\* La imagen o evaluación general del gobierno.*

*\* La percepción sobre si se gobierna pensando en el bien general o en
el de sectores particulares.*

*\* La eficiencia en la administración del gasto público.*

*\* La honestidad de los miembros del gobierno.*

*\* La capacidad del gobierno para resolver los problemas del país.*

*El índice se presenta en una escala que varía entre un mínimo de 0 y un
máximo de 5.*

------------------------------------------------------------------------

### INSTALACIÓN

### Versión en desarrollo (*Development version*)

``` r
# install.packages('devtools') si no tiene instalado devtools

devtools::install_github("politicaargentina/opinAr")
```

### ARTÍCULOS (*Articles*)

-   [DATOS
    (*Data*)](https://politicaargentina.github.io/opinAr/articles/data.html)

-   [CÁLCULO DE INDICADORES
    (*Computations*)](https://politicaargentina.github.io/opinAr/articles/data.html)

### CITAR (*Cite*)

Para citar `{opinAr}` usar (*to cite package ‘opinAr’ in publications
use*):

       Camila Higa and Juan Pablo Ruiz Nicolini (2021).
      opinAr: Argentina´s Public Opinion Toolbox. R
      package version 0.0.1.

Una entrada para usuarios (*an entry for LaTeX users*):

      @Manual{,
        title = {opinAr: Argentina´s Public Opinion Toolbox},
        author = {Camila {Higa} and Juan Pablo Ruiz Nicolini},
        year = {2021},
        note = {R package version 0.0.1},
      }

## `{opinAr}` es parte del universo de paquetes **polAr**

![](https://github.com/PoliticaArgentina/data_warehouse/raw/master/hex/collage.png)<!-- -->
