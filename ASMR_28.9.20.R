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

#code to change NAs to 0

df[is.na(df)] <- 0

#working directory changed back

setwd("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/")

#read in standard population

library(readxl) 

Standard <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/ESP_expanded.xlsx")

#fixes standard population as numeric

Standard$Age <- as.character(Standard$Age)
Standard$Popn <- as.numeric(Standard$Popn)

#joining standard population and mortality data to create df2, matching on age group 

df2 <- merge(df, Standard, by = "Age")

#merge in more useful country labels

Countries <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Country_list.xlsx")
df3 <- merge(df2, Countries, by = "File")


#calculation of ASMRs for each country and year
#residual problems with missing data and useful labels not being carried over in merge
##START HERE

asmr <- df3 %>%
  group_by(File, Year) %>%
  summarise(asmrF = sum(Female*Popn, na.rm = TRUE), 
            asmrM = sum(Male*Popn, na.rm = TRUE), 
            asmrT = sum(Total*Popn, na.rm = TRUE))


#start plotting - intention is to do 'small multiples' using 'facet_wrap()'
#https://www.r-graph-gallery.com/223-faceting-with-ggplot2.html 

#library(tidyverse)
library(dplyr) 
library(ggplot2)

#Building code for plot of ASMR for total population
#Lines are intermittent but there isn't corresponding missing data in the file. ? what is the problem

asmr_plotT <- asmrT %>% 
  ggplot(aes(x = Year, y = asmr)) +
  geom_line() + 
  xlab("Year") +
  ylab("ASMR") +
  xlim(1988, 2018) +
  ylim(0, 2000) +
  ggtitle("Trend in Age Standardised Mortality Rate (ASMR) for the total population") + 
  facet_wrap(~File)

asmr_plotT

#Female graph

asmr_plotF <- asmrF %>% 
  ggplot(aes(x = Year, y = asmr)) +
  geom_line() + 
  xlab("Year") +
  ylab("ASMR") +
  xlim(1988, 2018) +
  ylim(0, 2000) +
  ggtitle("Trend in female Age Standardised Mortality Rate (ASMR)") + 
  facet_wrap(~File)

asmr_plotF

#Male graph

asmr_plotM <- asmrM %>% 
  ggplot(aes(x = Year, y = asmr)) +
  geom_line() + 
  xlab("Year") +
  ylab("ASMR") +
  xlim(1988, 2018) +
  ylim(0, 2000) +
  ggtitle("Trend in male Age Standardised Mortality Rate (ASMR)") + 
  facet_wrap(~File)

asmr_plotM

