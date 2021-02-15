library(tidyverse)
library(janitor)
meteor <- read_csv("weekend_homework/meteorite_landings.csv")

meteor_clean <- meteor %>%
  clean_names()



meteor_clean_col <- meteor_clean %>% 
  mutate(geo_location = str_replace_all(geo_location, "\\(|\\)", ""))


meteor_clean_col <- meteor_clean_col %>%
  separate(geo_location, c("latitude", "longitude"),
           sep = ", ", 
           convert = TRUE)


meteor_clean_col[is.na(meteor_clean_col)] <-0

meteor_clean_col <- filter(meteor_clean_col, mass_g < 100)
meteor_clean_col <- arrange(meteor_clean_col, desc(year))       
meteor_clean_col       

       
col_correct <- c("id", 
                 "name", 
                 "mass_g", 
                 "fall", 
                 "year", 
                 "latitude", 
                 "longitude"), 
assert(in_set("id", 
              "name", 
              "mass_g", 
              "fall", 
              "year", 
              "latitude", 
              "longitude"), meteor_clean_col)


stopifnot(
  names(meteor_clean_col ) %in% c("id", "name", "mass (g)", "fall", "year", "GeoLocation"))


meteor_clean_col %>% 
  verify(latitude >= -90 & latitude <= 90) %>% 
  verify(longitude >= -180 & longitude <= 180)