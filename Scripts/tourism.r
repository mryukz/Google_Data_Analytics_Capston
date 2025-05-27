# necessary packages 
packages <- c('tidyverse', 'janitor', 'dplyr', 'ggplot2')
# load packages
lapply(packages, library, character.only=TRUE)

#load dataset
arrivals <- read.csv("C:/Users/999901/Downloads/total_visitors.csv")
stays <- read.csv("C:/Users/999901/Downloads/By_prefecture.csv")

#cleaning dataframe for arrivals
arrivals_clean <- data.frame(arrivals) %>% 
  select(-Growth.Rate...) %>% clean_names() %>% 
  rename(country = country_area, month = month_abbr, visitors = visitor_arrivals) %>% 
  mutate(visitors = as.numeric(gsub(",", "", visitors, fixed = TRUE))) %>% replace(is.na(.),0)

#Data frame cleaning
stays <- data.frame(stays) %>% 
  select(-Purpose) %>% clean_names() %>% 
  rename(country = country_area, prefecture = item1) %>% 
  mutate(overnight_stays = as.numeric(gsub(",", "", overnight_stays, fixed = TRUE))) %>% 
  replace(is.na(.),0)

#check NA
sum(is.na(arrivals))

#join

glimpse(stays)
glimpse(arrivals)

