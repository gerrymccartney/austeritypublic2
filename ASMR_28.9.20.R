##Wrangle HMD mortality text files into single df (thanks to Frank)

library(tidyverse)

#to get around issue of R not finding subfolder in austeritypublic2, change working directory

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Mx_5x1_eligiblepopsonly")
list_of_files <- list.files(path="D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Mx_5x1_eligiblepopsonly") 
names(list_of_files) <- list_of_files
df <- list_of_files %>%
  map_dfr(~read_table(.x,
                      skip = 2, na = "."),.id="File")
df<-(as_tibble(df))

#working directory changed back

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/")

#read in standard population

library(readxl) 

Standard <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/ESP_expanded.xlsx")

#fixes standard population as numeric

Standard$age <- as.character(Standard$Age)
Standard$Popn <- as.numeric(Standard$Popn)

#joining standard population and mortality data to create df2, matching on age group 

df2 <- merge(Standard, df, by = "Age")

#calculation of ASMRs for each country and year

asmr <- df2 %>%
  group_by(File, Year) %>%
  summarise(asmrf = sum(Female*Popn, na.rm = TRUE), 
            asmrm = sum(Male*Popn, na.rm = TRUE), 
            asmrt = sum(Total*Popn, na.rm = TRUE))




