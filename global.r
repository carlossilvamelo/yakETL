
#------------------------ imports ------------------------
#install.packages("readxl")
#install.packages("stringr")
#install.packages("shinyjs")
#install.packages("shinyWidgets")
#install.packages("shinydashboard")

#devtools::install_github("hadley/shinySignals")
#install.packages("stringr")
#library("readxl")
#library("doParallel")
#library("stringr")
library("shinyjs")
#library("stats")
#library("compiler")
library(shiny)
library(shinyWidgets)
library(jsonlite)
library(httr)
#library(devtools)
#devtools::install_github("alexioannides/elasticsearchr")
#library(elasticsearchr)

library(shinydashboard)

#----------------------- initializarions -----------------

ROOT = paste(getwd(),"/",sep = "")


#--------------------------------

modalDicas <- function(texto) {
  blub <- modalDialog(
    title = "Informações",texto,
    footer = modalButton("Fechar")
  )
  return(blub)
}
