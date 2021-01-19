#### Preamble ####
# Purpose: Use opendatatoronto to get homelessness data
# Author: Rohan Alexander
# Contact: rohan.alexander@utoronto.ca
# Date: 19 January 2021
# Pre-requisites: None
# TODOs: - 


#### Workspace set-up ####
# install.packages("opendatatoronto")
library(opendatatoronto)
library(tidyverse)


#### Get data ####
all_data <- 
  opendatatoronto::search_packages("Daily Shelter Occupancy") %>% 
  opendatatoronto::list_package_resources() %>% 
  filter(name == "daily-shelter-occupancy-2017-csv") %>% # This is the row we are interested in. Come back here to get other years.
  select(id) %>% 
  opendatatoronto::get_resource()


#### Save data ### 
write_csv(all_data, "inputs/raw_data.csv")


