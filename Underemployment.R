#read in time-related underemployment data (from IMF, %)

install.packages("naniar")
library(tidyverse)
library(readxl)
library(naniar)

#read in data

ue <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/IMF_unemployment_tidy.xlsx")  

#create long file from wide data

ue2 <- ue %>%
  gather('Australia', 'Austria', 'Belgium', 'Canada', 'Chile', 'Croatia', 'Czech Republic', 'Denmark', 'Estonia', 
         'Finland', 'France', 'Germany', 'Greece', 'Hong Kong SAR', 'Hungary', 'Iceland', 'Ireland', 'Israel',
         'Italy', 'Japan', 'Korea, Republic of', 'Latvia', 'Lithuania', 'Luxembourg', 'Netherlands', 
         'New Zealand', 'Norway', 'Poland', 'Portugal', 'Slovak Republic', 'Slovenia', 'Spain', 'Sweden',
         'Switzerland', 'Taiwan Province of China', 'United Kingdom', 'United States', 
         key = "Country", 
         value = "Underemployment")

#to replace "no data" with "NA"

ue2 [ue2=="no data"]<-NA
ue2$Underemployment <- as.numeric(ue2$Underemployment)

#plot underemployment data
  
underemployment_plot <- ue2 %>% 
  ggplot(aes(Year, Underemployment)) + 
  geom_line() + 
  xlab("Year") +
  ylab("Percentage of underemployment") +
  xlim(1988, 2020) +
  ylim(0, 30) +
  ggtitle("Percentage underemployment") + 
  facet_wrap(~Country)

underemployment_plot
