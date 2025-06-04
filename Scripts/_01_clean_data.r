## ---------------------------
##
## Script name: _01_clean_data.r
##
## Purpose of script: Clean Raw Demo Survey Data and Save
##
##
## ---------------------------
##
## Notes:
##   
##
## ---------------------------

# Load Packages -----------------------------------------------------------

library(tidyverse)
library(janitor)
library(pacman)
library(sjlabelled)
source("./Scripts/_00_utility_functions.r")


# Open Raw Data -----------------------------------------------------------

df <- haven::read_sav(file = "./Data/Raw Data/Demo_Satisfaction_Survey.sav") %>% 
  haven::as_factor(only_labelled = TRUE) # converts multiple choice questions
                                         # to factors


# Clean Question Labels ---------------------------------------------------

# Remove repeated text from matrix style questions

df <- df %>% 
  replace_survey_stems(
    starts_with("Q2_"),
    replace_text_regex = "^(.*?\\s-\\s)",
    replacement = ""
  )

# Rename Variables --------------------------------------------------------

df <- df %>% 
  rename(
    sat_mjr_instruction = Q2_1,
    sat_acad_adv = Q2_2,
    sat_mh_resources = Q2_3,
    sat_safety = Q2_4,
    sat_opp_involve = Q2_5,
    sat_facilities = Q2_6,
    sat_housing = Q2_7,
    sat_dining = Q2_8,
    sat_career_svcs = Q2_9,
    sat_belonging = Q2_10,
    sat_overall = Q3,
    sat_value = Q4,
    conf_life_skills = Q5,
    txt_impact_exp = Q6
  )


# Create Dummy Vars for Colleges ------------------------------------------

df <- df %>% 
  mutate(college_code_pivot = college_code,     #create copies otherwise 
         college_desc_pivot = college_desc) %>% # will be lost in pivot
  pivot_wider(names_from = college_code_pivot, 
              values_from = college_desc_pivot, 
              values_fill = "All Others")


# Convert Dummy Vars to Factors -------------------------------------------

df <- df %>% 
  mutate(
    across(
      .cols = c(COB, CENG, CLAS),
      .fns = ~fct_rev(factor(.x, levels = sort(unique(.x))))
    )
  )


# Convert academic classification to factor -------------------------------

df <- df %>% 
  mutate(academic_classification = factor(academic_classification,
                                          levels = c("FR", "SO", "JR", "SR")))

# Save as RDS -------------------------------------------------------------

df %>% 
  write_rds(
    file = "./Data/Clean Data/Demo_Satisfaction_Survey.rds"
  )




# Clear Environment -------------------------------------------------------

rm(list = ls())
pacman::p_unload("all")
