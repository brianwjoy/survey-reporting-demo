## ---------------------------
##
## Script name: execute_overall_report.r
##
## Purpose of script: execute overall .qmd file
##
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------



# Set Working Directory ---------------------------------------------------

setwd("./Output") #set to desired output file destination


# Render File -------------------------------------------------------------

quarto::quarto_render(
  input = "../Scripts/_02_overall_report.qmd",
  output_file = "Survey Report Demo Overall.pdf"
)


# Return Working Directory to Default -------------------------------------

setwd("../")


# Clear Environment -------------------------------------------------------

rm(list = ls())
