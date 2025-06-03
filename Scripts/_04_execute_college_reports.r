## ---------------------------
##
## Script name: _04_execute_college_reports.r
##
## Purpose of script:
##
## Author: Brian Joy
##
## Date Created: 2025-05-21
##
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

# Declare Location --------------------------------------------------------

here::i_am("") # specify current file location relative to project dir

# Load Packages -----------------------------------------------------------

library(tidyverse)
library(janitor)
library(pacman)
library(here)


# Clear Environment -------------------------------------------------------

rm(list = ls())
p_unload("all")
