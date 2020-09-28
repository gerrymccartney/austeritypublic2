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
##bugs in this bit, need to discuss with Frank
#problem is that I get data for some years (which looks broadly correct), but with lots of missing dat

asmrF <- df2 %>%
  group_by(File, Year) %>%
  summarise(asmr = sum(Female*Popn))

asmrM <- df2 %>%
  group_by(File, Year) %>%
  summarise(asmr = sum (Male*Popn))

asmrT <- df2 %>%
  group_by(File, Year) %>%
  summarise(asmr = sum (Total*Popn))

#try different approach entirely
#problem with this code is that it appears in the console but not in the df when I reload it

df2 %>%
  select(File, Female, Male, Total, Popn) %>%
  mutate(
    Fm = Female*Popn, 
    Mm = Male*Popn, 
    Tm = Total*Popn)

df2 %>%
  group_by(File, Year) %>%
  summarise(asmrF2 = sum(Fm))

  summarise()
  

  

