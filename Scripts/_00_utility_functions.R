
# Load Packages -----------------------------------------------------------

library(tidyverse)
library(sjlabelled)

# replace_survey_stem function --------------------------------------------

replace_survey_stems <- function(data, item_list, replace_text_regex, replacement){
  old_labels <- data %>% 
    get_label()
  
  new_labels <- data %>% 
    select(all_of(item_list)) %>% 
    get_label() %>% 
    map_chr(., 
            ~str_replace(.x, replace_text_regex, replacement)
    )
  
  combined_labels <- c(new_labels, old_labels[!names(old_labels) %in% names(new_labels)])
  
  data <- 
    data %>% 
    var_labels(!!!combined_labels)
}

