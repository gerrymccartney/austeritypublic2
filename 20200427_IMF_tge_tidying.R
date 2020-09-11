#Tidying total government expenditures dataset as a % of GDP (from IMF)

#packages

library(tidyverse)
library(readxl)

#read in all countries tge data from txt files on stick from IMF
#none of the code below is working yet - it doesn't seem to like the file

gov_exp <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Government_expenditure_pcGDP3.xlsx")

#wow! fixed by adding x to the end of the filepath

#read in file on government revenue, CAPB and unemployment all from IMF

gov_rev <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Government_revenues_pcGDP2.xlsx")
CAPB <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/CAPB2.xlsx")
unemployment <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/IMF_unemployment.xlsx") 

#getting data out into excel

library(openxlsx)
write.xlsx(CAPB,
           sheetName = "CAPB", 
           file = "out_file.xlsx")

#Success!!!!

#uploading OECD data on public social spending 

library(tidyverse)
library(readxl)

pss <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/public_social_spending.xlsx")

#checking git configuration

git config --global -- list.

git config


#initial error running readxl - the suggested fix online was to reinstall dplyr. now working. 

install.packages("dplyr")
library(dplyr)

# uploading GDP data

library(tidyverse)
library(readxl)

GDP <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/GDP_uploadtoR.xlsx")

