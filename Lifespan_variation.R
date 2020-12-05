#Lifespan variation 

library(tidyverse)
library(dplyr)
library(readxl)
library(ggplot2)

#full lifetable data downloaded from HMD on 5.12.20 and stripped to eligible populations only 
#total population first

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/tltper_1x1_eligiblepopsonly")
list_of_files <- list.files(path="D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/tltper_1x1_eligiblepopsonly") 
names(list_of_files) <- list_of_files
df <- list_of_files %>%
  map_dfr(~read_table(.x,
                      skip = 2, na = "."),.id="FileLSVT")
df<-(as_tibble(df)) 

#code to change NAs to 0

df[is.na(df)] <- 0

#working directory changed back

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/")

#add useful country labels
Countries <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Country_list.xlsx")
df <- merge(df, Countries, by = "FileLSVT")
  
#lifespan variation calculation

lsvT <- df %>%
  group_by(Country, Year) %>% 
  mutate(lost_life = (1-ax)+lead(ex, order_by=Age)) %>% 
  summarise(eddagger =sum(lost_life*(dx/100000), na.rm = TRUE)) 

########
#female data

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/fltper_1x1_eligiblepopsonly")
list_of_files <- list.files(path="D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/fltper_1x1_eligiblepopsonly") 
names(list_of_files) <- list_of_files
df <- list_of_files %>%
  map_dfr(~read_table(.x,
                      skip = 2, na = "."),.id="FileLSVF")
df<-(as_tibble(df)) 

#code to change NAs to 0

df[is.na(df)] <- 0

#working directory changed back

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/")

#add useful country labels
Countries <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Country_list.xlsx")
df <- merge(df, Countries, by = "FileLSVF")

#lifespan variation calculation

lsvF <- df %>%
  group_by(Country, Year) %>% 
  mutate(lost_life = (1-ax)+lead(ex, order_by=Age)) %>% 
  summarise(eddagger =sum(lost_life*(dx/100000), na.rm = TRUE)) 

#######
#male data

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/mltper_1x1_eligiblepopsonly")
list_of_files <- list.files(path="D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/mltper_1x1_eligiblepopsonly") 
names(list_of_files) <- list_of_files
df <- list_of_files %>%
  map_dfr(~read_table(.x,
                      skip = 2, na = "."),.id="FileLSVM")
df<-(as_tibble(df)) 

#code to change NAs to 0

df[is.na(df)] <- 0

#working directory changed back

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/")

#add useful country labels
Countries <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Country_list.xlsx")
df <- merge(df, Countries, by = "FileLSVM")

#lifespan variation calculation

lsvM <- df %>%
  group_by(Country, Year) %>% 
  mutate(lost_life = (1-ax)+lead(ex, order_by=Age)) %>% 
  summarise(eddagger =sum(lost_life*(dx/100000), na.rm = TRUE)) 

#####
#plot total population lifespan variation

LSVT_plot <- lsvT %>% 
  ggplot(aes(Year, eddagger)) + geom_line() + 
  xlab("Year") +
  ylab("Lifespan variation (years)") +
  xlim(1988, 2020) +
  ylim(10, 20) +
  ggtitle("Lifespan variation for the total population") + 
  facet_wrap(~Country)

LSVT_plot

#plot female population lifespan variation

LSVF_plot <- lsvF %>% 
  ggplot(aes(Year, eddagger)) + geom_line() + 
  xlab("Year") +
  ylab("Lifespan variation (years)") +
  xlim(1988, 2020) +
  ylim(10, 20) +
  ggtitle("Female lifespan variation") + 
  facet_wrap(~Country)

LSVF_plot

#plot total population lifespan variation

LSVM_plot <- lsvM %>% 
  ggplot(aes(Year, eddagger)) + geom_line() + 
  xlab("Year") +
  ylab("Lifespan variation (years)") +
  xlim(1988, 2020) +
  ylim(10, 20) +
  ggtitle("Male lifespan variation") + 
  facet_wrap(~Country)

LSVM_plot