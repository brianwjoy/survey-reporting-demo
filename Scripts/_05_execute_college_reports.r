## ---------------------------
##
## Script name: _05_execute_college_reports.r
##
## Purpose of script: iterate through list of colleges and
##                    execute .qmd file for each one
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

# Load Packages -----------------------------------------------------------

library(tidyverse)


# Open Survey Data --------------------------------------------------------

df <- readr::read_rds("./Data/Clean Data/Demo_Satisfaction_Survey.rds")


# Create List of Colleges -------------------------------------------------

df_colleges <- df %>% 
  distinct(college_code,
           college_desc)


# Create Report Building Function -----------------------------------------

build_college_pdfs <- function(college_code,
                               college_desc,
                               ...){
  quarto::quarto_render(
    input = "../Scripts/_04_college_report.qmd",
    execute_params = list(
      college_code = college_code,
      college_desc = college_desc),
    output_file = glue::glue("Survey Report Demo {college_code}.pdf")
    )
}


# Change Directory for Output ---------------------------------------------

setwd("./Output")


# Iterate through Colleges ------------------------------------------------

walk2(df_colleges$college_code,
      df_colleges$college_desc,
      build_college_pdfs)


# Return to Default Working Directory -------------------------------------

setwd("../")

# Clear Environment -------------------------------------------------------

rm(list = ls())
pacman::p_unload("all")
