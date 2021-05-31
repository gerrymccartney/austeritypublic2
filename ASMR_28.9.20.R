##Wrangle HMD mortality text files into single df (thanks to Frank)

library(tidyverse)

#to get around issue of R not finding subfolder in austeritypublic2, change working directory
###start here, code below not working

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

#add useful country labels
Countries <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Country_list.xlsx")
df2 <- merge(df2, Countries, by = "File")

#calculation of ASMRs for each country and year
#residual problems with missing data and useful labels not being carried over in merge

asmr <- df2 %>%
  group_by(File, Year) %>%
  summarise(asmrF = sum(Female*Popn, na.rm = TRUE), 
            asmrM = sum(Male*Popn, na.rm = TRUE), 
            asmrT = sum(Total*Popn, na.rm = TRUE))

#merge in more useful country labels
#code redundant as added earlier to df2
Countries <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/Country_list.xlsx")
asmr <- merge(asmr, Countries, by = "File")


#start plotting - intention is to do 'small multiples' using 'facet_wrap()'
#https://www.r-graph-gallery.com/223-faceting-with-ggplot2.html 

#library(tidyverse)
library(dplyr) 
library(ggplot2)

#Building code for plot of ASMR for total population

asmr_plotT <- asmr %>% 
  ggplot(aes(x = Year, y = asmrT)) +
  geom_line() + 
  xlab("Year") +
  ylab("ASMR") +
  xlim(1987, 2020) +
  ylim(0, 2500) +
  ggtitle("Trend in Age Standardised Mortality Rate (ASMR) for the total population") + 
  facet_wrap(~Country)

asmr_plotT

#Female graph

asmr_plotF <- asmr %>% 
  ggplot(aes(x = Year, y = asmrF)) +
  geom_line() + 
  xlab("Year") +
  ylab("ASMR") +
  xlim(1987, 2020) +
  ylim(0, 2000) +
  ggtitle("Trend in female Age Standardised Mortality Rate (ASMR)") + 
  facet_wrap(~Country)

asmr_plotF

#Male graph

asmr_plotM <- asmr %>% 
  ggplot(aes(x = Year, y = asmrM)) +
  geom_line() + 
  xlab("Year") +
  ylab("ASMR") +
  xlim(1987, 2020) +
  ylim(0, 3500) +
  ggtitle("Trend in male Age Standardised Mortality Rate (ASMR)") + 
  facet_wrap(~Country)

asmr_plotM

#Calculation of age-specific mortality rates
#(<1, 1 to 14, 15 to 29, 30 to 49, 50 to 69 and 70+ years)

#mortality rate for those aged under 1 year (per 1,000)
#need to multiple rates by 100 to get per 100,000
asmr_under_one <- df2 %>%
  filter(Age == "0") %>%
  mutate(Female2 = Female *100, 
         Male2 = Male *100, 
         Total2 = Total *100)

#graph mortality rate for those aged under 1 year 
#Females

asmr_under_one_plotF <- asmr_under_one %>% 
  ggplot(aes(x = Year, y = Female2)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 3) +
  ggtitle("Trend in Mortality Rate for female population aged <1 year per 100,000 per year") + 
  facet_wrap(~Country)

#Males
asmr_under_one_plotM <- asmr_under_one %>% 
  ggplot(aes(x = Year, y = Male2)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 3) +
  ggtitle("Trend in Mortality Rate for male population aged <1 year per 100,000 per year") + 
  facet_wrap(~Country)

#Total
asmr_under_one_plotT <- asmr_under_one %>% 
  ggplot(aes(x = Year, y = Total2)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 3) +
  ggtitle("Trend in Mortality Rate for total population aged <1 year per 100,000 per year") + 
  facet_wrap(~Country)

asmr_under_one_plotF
asmr_under_one_plotM
asmr_under_one_plotT

#mortality rate for those aged 1-14 years per 100,000
##worked when I put summarise as the last rather than 2nd function

asmr_one_fourteen <- df2 %>%
  group_by(Country, Year) %>%
  mutate(Female2 = ((Female * 100000) / 15000), 
         Male2 = ((Male * 100000) / 15000), 
         Total2 = ((Total * 100000) / 15000)) %>% 
  filter(Age %in% c("1-4", "5-9", "10-14")) %>% 
  summarise(asmrF = sum(Female*Popn, na.rm = TRUE), 
          asmrM = sum(Male*Popn, na.rm = TRUE), 
          asmrT = sum(Total*Popn, na.rm = TRUE)) 

#plot the 1-14y data

asmr_one_fourteen_plotT <- asmr_one_fourteen %>% 
  ggplot(aes(x = Year, y = asmrT)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 10) +
  ggtitle("Trend in Mortality Rate for total population aged 1-14 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_one_fourteen_plotF <- asmr_one_fourteen %>% 
  ggplot(aes(x = Year, y = asmrF)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 10) +
  ggtitle("Trend in Mortality Rate for female population aged 1-14 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_one_fourteen_plotM <- asmr_one_fourteen %>% 
  ggplot(aes(x = Year, y = asmrM)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 12) +
  ggtitle("Trend in Mortality Rate for male population aged 1-14 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_one_fourteen_plotT
asmr_one_fourteen_plotF
asmr_one_fourteen_plotM

#mortality rate for those aged 15-29 years per 100,000

asmr_15to29 <- df2 %>%
  group_by(Country, Year) %>%
  mutate(Female2 = ((Female * 100000) / 17500), 
         Male2 = ((Male * 100000) / 17500), 
         Total2 = ((Total * 100000) / 17500)) %>% 
  filter(Age %in% c("15-19", "20-24", "25-29")) %>% 
  summarise(asmrF = sum(Female*Popn, na.rm = TRUE), 
            asmrM = sum(Male*Popn, na.rm = TRUE), 
            asmrT = sum(Total*Popn, na.rm = TRUE)) 

#plot the 15-29y data

asmr_15to29T <- asmr_15to29 %>% 
  ggplot(aes(x = Year, y = asmrT)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 50) +
  ggtitle("Trend in Mortality Rate for total population aged 15-29 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_15to29F <- asmr_15to29 %>% 
  ggplot(aes(x = Year, y = asmrF)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 20) +
  ggtitle("Trend in Mortality Rate for female population aged 15-29 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_15to29M <- asmr_15to29 %>% 
  ggplot(aes(x = Year, y = asmrM)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 80) +
  ggtitle("Trend in Mortality Rate for male population aged 15-29 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_15to29T
asmr_15to29F
asmr_15to29M

#mortality rate for those aged 30-49 years per 100,000

asmr_30to49 <- df2 %>%
  group_by(Country, Year) %>%
  mutate(Female2 = ((Female * 100000) / 27500), 
         Male2 = ((Male * 100000) / 27500), 
         Total2 = ((Total * 100000) / 27500)) %>% 
  filter(Age %in% c("30-34", "35-39", "40-44", "45-49")) %>% 
  summarise(asmrF = sum(Female*Popn, na.rm = TRUE), 
            asmrM = sum(Male*Popn, na.rm = TRUE), 
            asmrT = sum(Total*Popn, na.rm = TRUE)) 

#plot the 30-49y data

asmr_30to49T <- asmr_30to49 %>% 
  ggplot(aes(x = Year, y = asmrT)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 250) +
  ggtitle("Trend in Mortality Rate for total population aged 30-49 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_30to49F <- asmr_30to49 %>% 
  ggplot(aes(x = Year, y = asmrF)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 150) +
  ggtitle("Trend in Mortality Rate for female population aged 30-49 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_30to49M <- asmr_30to49 %>% 
  ggplot(aes(x = Year, y = asmrM)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 400) +
  ggtitle("Trend in Mortality Rate for male population aged 30-49 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_30to49T
asmr_30to49F
asmr_30to49M

#mortality rate for those aged 50-69 years per 100,000

asmr_50to69 <- df2 %>%
  group_by(Country, Year) %>%
  mutate(Female2 = ((Female * 100000) / 24500), 
         Male2 = ((Male * 100000) / 24500), 
         Total2 = ((Total * 100000) / 24500)) %>% 
  filter(Age %in% c("50-54", "55-59", "60-64", "65-69")) %>% 
  summarise(asmrF = sum(Female*Popn, na.rm = TRUE), 
            asmrM = sum(Male*Popn, na.rm = TRUE), 
            asmrT = sum(Total*Popn, na.rm = TRUE)) 

#plot the 50-69y data

asmr_50to69T <- asmr_50to69 %>% 
  ggplot(aes(x = Year, y = asmrT)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 700) +
  ggtitle("Trend in Mortality Rate for total population aged 50-69 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_50to69F <- asmr_50to69 %>% 
  ggplot(aes(x = Year, y = asmrF)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 400) +
  ggtitle("Trend in Mortality Rate for female population aged 50-69 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_50to69M <- asmr_50to69 %>% 
  ggplot(aes(x = Year, y = asmrM)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1987, 2020) +
  ylim(0, 1100) +
  ggtitle("Trend in Mortality Rate for male population aged 50-69 years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_50to69T
asmr_50to69F
asmr_50to69M

#mortality rate for those aged 70+ years per 100,000

asmr_70up <- df2 %>%
  group_by(Country, Year) %>%
  mutate(Female2 = ((Female * 100000) / 14000), 
         Male2 = ((Male * 100000) / 14000), 
         Total2 = ((Total * 100000) / 14000)) %>% 
  filter(Age %in% c("70-74", "75-79", "80-84", "85-89", "90-94", "95-99", "100-104", "105-109", "110+")) %>% 
  summarise(asmrF = sum(Female*Popn, na.rm = TRUE), 
            asmrM = sum(Male*Popn, na.rm = TRUE), 
            asmrT = sum(Total*Popn, na.rm = TRUE)) 

#plot the 70+y data

asmr_70upT <- asmr_70up %>% 
  ggplot(aes(x = Year, y = asmrT)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1988, 2020) +
  ylim(0, 2000) +
  ggtitle("Trend in Mortality Rate for total population aged 70+ years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_70upF <- asmr_70up %>% 
  ggplot(aes(x = Year, y = asmrF)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1988, 2020) +
  ylim(0, 2000) +
  ggtitle("Trend in Mortality Rate for female population aged 70+ years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_70upM <- asmr_70up %>% 
  ggplot(aes(x = Year, y = asmrM)) +
  geom_line() + 
  xlab("Year") +
  ylab("Mortality rate per 100,000") +
  xlim(1988, 2020) +
  ylim(0, 2000) +
  ggtitle("Trend in Mortality Rate for male population aged 70+ years per 100,000 per year") + 
  facet_wrap(~Country)

asmr_70upT
asmr_70upF
asmr_70upM

#Wrangle data to get year on year percentage change in outcomes 
#adapting code from https://stackoverflow.com/questions/36110977/r-how-to-calculate-percentage-of-change-between-two-rows (example 4)

asmr_change <- asmr %>%
  arrange(Country, Year) %>%
  group_by(Country) %>%
  mutate(asmrF2 = ((asmrF-lag(asmrF))/lag(asmrF)) * 100,
         asmrM2 = ((asmrM-lag(asmrM))/lag(asmrM)) * 100,
         asmrT2 = ((asmrT-lag(asmrT))/lag(asmrT)) * 100)

#colours added with code from https://stackoverflow.com/questions/42114180/how-to-specify-different-colors-with-ggplot
#not working, can't afford the time to do it properly
#would be good to show positive change as green, negative as red. 

#asmr_changeT <- asmr_change %>% 
  #ggplot(aes(Year, asmrT2)) + 
 # geom_point(size = 1,
    #         aes(colour = ifelse(asmrT2 > 0, ">0", 
  #                               if(asmrT2 <= 0, "<0"~underline)))) +
 # scale_colour_manual(values = c(">0" = "green", "<0" = "red"), 
 #                     name = "Year on year % change") + 
 # xlab("Year") +
 # ylab("Year on year percentage change in age standardised mortality rate") +
 # xlim(1988, 2020) +
 # ylim(-12, 12) +
  #ggtitle("Year on year percentage change in mortality rate for the total population") + 
  #facet_wrap(~Country)

#asmr_changeT  
  
# year on year % change

asmr_changeT <- asmr_change %>% 
ggplot(aes(Year, asmrT2)) + geom_line() + 
  xlab("Year") +
  ylab("Year on year percentage change in age standardised mortality rate") +
  xlim(1988, 2020) +
  ylim(-12, 12) +
  ggtitle("Year on year percentage change in mortality rate for the total population") + 
  facet_wrap(~Country)

asmr_changeT


## create excel sheet for Walshy with ASMR data by country, sex, year
install.packages("writexl") 
library("writexl")
write_xlsx(asmr,"D:/Mortality_trends/Austerity/Austerity_analysis/austeritypublic2/asmrdataforWalshy.xlsx")




