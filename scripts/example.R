#### Building and analyzing a price index with R ####
# Steve Martin
# July 2020

#---- Bring in libraries ----
library(dplyr)
library(gpindex)

#---- Bring in data ----
source('https://raw.githubusercontent.com/ppd-dpp/cours-indices-des-prix/master/scripts/get_data.R')

#---- Step 1: Make the weights ----
# Make product weights
weights_prov <- weights %>%
  group_by(year, province) %>%
  summarize(weight = sum(weight)) %>%
  mutate(share_prov = weights_scale(weight)) %>%
  select(-weight)