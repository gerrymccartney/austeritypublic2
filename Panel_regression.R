#Tidy panel data and run panel regression models 

# https://bookdown.org/ccolonescu/RPoE4/panel-data-models.html 

#install packages

install.packages("plm")
install.packages("tseries")
install.packages("dynlm")
install.packages("vars")
install.packages("nlWaldTest")
install.packages("lmtest")
install.packages("PoEdata")
install.packages("forecast") 
install.packages("systemfit")
install.packages("AER")
install.packages("xtable")
install.packages("gplots")

#rm(list=ls()) #Removes all items in Environment!
library(plm) 
library(tseries) # for `adf.test()`
library(dynlm) #for function `dynlm()`
library(vars) # for function `VAR()`
library(nlWaldTest) # for the `nlWaldtest()` function
library(lmtest) #for `coeftest()` and `bptest()`.
library(broom) #for `glance(`) and `tidy()`
library(PoEdata) #for PoE4 datasets
library(car) #for `hccm()` robust standard errors
library(sandwich)
library(knitr) #for `kable()`
library(forecast) 
library(systemfit)
library(AER)
library(xtable)
library(dplyr)

library(tidyverse) # Modern data science library 
library(car)       # Companion to applied regression 
library(gplots)    # Various programing tools for plotting data
library(tseries)   # For timeseries analysis

#steps
#1. merge outcome data into file with austerity data 

#start with clean austerity df 
paneldata <- allausterity4

#add lifespan variation (total population) and rename to useful column title
#only merging data with existing years (i.e. from 1980, not 1921)
paneldata <- merge (allausterity4, lsvT, by=c("Year", "Country"), 
                    all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, lsvT = eddagger)

#add lifespan variation (males and females) and rename to useful column titles
paneldata <- merge (paneldata, lsvF, by=c("Year", "Country"), 
                    all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, lsvF = eddagger)
paneldata <- merge (paneldata, lsvM, by=c("Year", "Country"), 
                    all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, lsvM = eddagger)

#add ASMR data for all ages
paneldata <- merge(paneldata, asmr, by=c("Year", "Country"), 
                   all.x = TRUE, all.y = FALSE)
#tidy columns (deleting extraneous ones)
paneldata <- paneldata[, -11]
paneldata <- paneldata[, -c(14:18)] 

#add ASMR data by age
#need to re-label columns with specific age groups
#start with 0-1 year olds
paneldata <- merge(paneldata, asmr_under_one, by=c("Year", "Country"), 
                     all.x = TRUE, all.y = FALSE)
paneldata <- paneldata[, -c(14:15)] 
paneldata <- paneldata [, -c(14:22)]
paneldata = rename(paneldata, F_0_1 = Female2)
paneldata = rename(paneldata, M_0_1 = Male2)
paneldata = rename(paneldata, T_0_1 = Total2)

#1-14 year olds
paneldata <- merge(paneldata, asmr_one_fourteen, by=c("Year", "Country"), 
                   all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, F_1_14 = asmrF.y)
paneldata = rename(paneldata, M_1_14 = asmrM.y)
paneldata = rename(paneldata, T_1_14 = asmrT.y)

#15-29 year olds
paneldata <- merge(paneldata, asmr_15to29, by=c("Year", "Country"), 
                   all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, F_15_29 = asmrF)
paneldata = rename(paneldata, M_15_29 = asmrM)
paneldata = rename(paneldata, T_15_29 = asmrT)

#30-49 year olds
paneldata <- merge(paneldata, asmr_30to49, by=c("Year", "Country"), 
                   all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, F_30_49 = asmrF)
paneldata = rename(paneldata, M_30_49 = asmrM)
paneldata = rename(paneldata, T_30_49 = asmrT)

#50-69 year olds
paneldata <- merge(paneldata, asmr_50to69, by=c("Year", "Country"), 
                   all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, F_50_69 = asmrF)
paneldata = rename(paneldata, M_50_69 = asmrM)
paneldata = rename(paneldata, T_50_69 = asmrT)

#70+ year olds
paneldata <- merge(paneldata, asmr_70up, by=c("Year", "Country"), 
                   all.x = TRUE, all.y = FALSE)
paneldata = rename(paneldata, F_70up = asmrF)
paneldata = rename(paneldata, M_70up = asmrM)
paneldata = rename(paneldata, T_70up = asmrT)

#add data on government revenue and government expenditure to allow testing of the Alesina hypothesis about tax cuts v spending change
#as an extension

paneldata <- merge(paneldata, govexppcgdp, by=c("Country", "Year"))
paneldata <- merge(paneldata, govrevpcgdp, by=c("Country", "Year"))

#delete extraneous column
paneldata <- paneldata[, -c(33)]

#add life expectancy data 
paneldata <- merge(paneldata, LE, by=c("Country", "Year"))

#delete extraneous columns
paneldata <- paneldata[, -c(38:42)]
paneldata <- paneldata[, -c(34)]

#rename LE columns
paneldata = rename(paneldata, LE_F = Female)
paneldata = rename(paneldata, LE_M = Male)
paneldata = rename(paneldata, LE_T = Total)

#####
#2. run panel regressions
#remember 2 year lag

#2.1 LE on AAFI

#https://bookdown.org/ccolonescu/RPoE4/panel-data-models.html#the-fixed-effects-model
#this isn't working yet, changing the lag makes no difference
#not sure about whether the '-1' is correct or not

#this code seems to be running better
#https://rstudio-pubs-static.s3.amazonaws.com/372492_3e05f38dd3f248e89cdedd317d603b9a.html 

#creating the panel

library(xtable)

#declare the dataset as panel data
AAFIpd <- pdata.frame(paneldata, index=c("Country", "Year"))

#exploratory data analysis
coplot(AAFIvalues ~ Year|Country, type="b", data=AAFIpd) 
scatterplot(LE_T~Year|Country, data=AAFIpd)
scatterplot(AAFIvalues ~ Year|Country, data=AAFIpd)

#heterogeneity across countries
plotmeans(LE_T ~ Country, data = AAFIpd)
#heterogeneity across years
plotmeans(LE_T ~ Year, data = AAFIpd)

#basic OLS model, no lag yet
#think this treats every datapoint as independent
ols.LEonAAFI <- lm(LE_T ~ AAFIvalues, data = paneldata)
summary(ols.LEonAAFI)

#scatterplot of basic OLS model
ols.LEonAAFI.scatter <- ols.LEonAAFI$fitted
ggplot(paneldata, aes(x = AAFIvalues, y = LE_T))+
  geom_point() +
  geom_smooth(method=lm)

#fixed effects, no lag yet
#(note LSDV means 'least squares dummary variable' - the dummy
#variable being that which accounts for the fixed, country, effect)

#to address error of 'variable lengths differ', try removing
#NAs from dataset entirely

#remove missing data
paneldata2 <- paneldata[complete.cases(paneldata),]

#fixed effects regression
FE.LEonAAFI <-lm(LE_T ~ AAFIvalues + factor(Country) - 1, 
                 data = paneldata2,
                 na.action=na.omit)
summary(FE.LEonAAFI)

## this is generating an implausibly high R2 value (0.9996) 
#which also doesn't seem to match with scatterplot

#scatterplot of the data

#using code from here: https://rstudio-pubs-static.s3.amazonaws.com/372492_3e05f38dd3f248e89cdedd317d603b9a.html#42_fixed_effects_model

FE.LEonAAFI.scatter <- FE.LEonAAFI$fitted
scatterplot(FE.LEonAAFI.scatter ~ paneldata2$AAFIvalues | paneldata2$Country,  
            xlab ="AAFI", ylab ="LE Total", boxplots = FALSE,smooth = FALSE)
abline(lm(paneldata2$LE_T~paneldata2$AAFIvalues),lwd=3, col="red")

##now with lagged data

#https://stackoverflow.com/questions/8910268/general-lag-in-time-series-panel-data

#first tidy column titles
colnames(paneldata2) [11] <- "asmrF"
colnames(paneldata2) [12] <- "asmrM"
colnames(paneldata2) [13] <- "asmrT"

#Create lagged outcome variables in the df

paneldata3 <-pdata.frame(paneldata2,index=c("Country","Year"))  
paneldata3 <- paneldata3 %>%
  group_by(Country) %>%
#lag LE data by 2 and 5y
  mutate(LE_T_lag2 = lag(LE_T, 2)) %>%
  mutate(LE_T_lag5 = lag(LE_T, 5)) %>%
  mutate(LE_F_lag2 = lag(LE_F, 2)) %>%
  mutate(LE_F_lag5 = lag(LE_F, 5)) %>%
  mutate(LE_M_lag2 = lag(LE_M, 2)) %>%
  mutate(LE_M_lag5 = lag(LE_M, 5)) %>%
#lag LSV data by 2 and 5y
  mutate(lsvT_lag2 = lag(lsvT, 2)) %>%
  mutate(lsvT_lag5 = lag(lsvT, 5)) %>%
  mutate(lsvF_lag2 = lag(lsvF, 2)) %>%
  mutate(lsvF_lag5 = lag(lsvF, 5)) %>%
  mutate(lsvM_lag2 = lag(lsvM, 2)) %>%
  mutate(lsvM_lag5 = lag(lsvM, 5)) %>%
#lag asmr data by 2 and 5y
  mutate(asmrT_lag2 = lag(asmrT, 2)) %>%
  mutate(asmrT_lag5 = lag(asmrT, 5)) %>%
  mutate(asmrF_lag2 = lag(asmrF, 2)) %>%
  mutate(asmrF_lag5 = lag(asmrF, 5)) %>%
  mutate(asmrM_lag2 = lag(asmrM, 2)) %>%
  mutate(asmrM_lag5 = lag(asmrM, 5)) %>%
#lag 0-1y age-specific data by 2 and 5y
  mutate(F_0_1_lag2 = lag(F_0_1, 2)) %>%
  mutate(F_0_1_lag5 = lag(F_0_1, 5)) %>%
  mutate(M_0_1_lag2 = lag(M_0_1, 2)) %>%
  mutate(M_0_1_lag5 = lag(M_0_1, 5)) %>%
  mutate(T_0_1_lag2 = lag(T_0_1, 2)) %>%
  mutate(T_0_1_lag5 = lag(T_0_1, 5)) %>%
#lag 1-14y age-specific data by 2 and 5y
  mutate(F_1_14_lag2 = lag(F_1_14, 2)) %>%
  mutate(F_1_14_lag5 = lag(F_1_14, 5)) %>%
  mutate(M_1_14_lag2 = lag(M_1_14, 2)) %>%
  mutate(M_1_14_lag5 = lag(M_1_14, 5)) %>%
  mutate(T_1_14_lag2 = lag(T_1_14, 2)) %>%
  mutate(T_1_14_lag5 = lag(T_1_14, 5)) %>%
#lag 15-29y age-specific data by 2 and 5y
  mutate(F_15_29_lag2 = lag(F_15_29, 2)) %>%
  mutate(F_15_29_lag5 = lag(F_15_29, 5)) %>%
  mutate(M_15_29_lag2 = lag(M_15_29, 2)) %>%
  mutate(M_15_29_lag5 = lag(M_15_29, 5)) %>%
  mutate(T_15_29_lag2 = lag(T_15_29, 2)) %>%
  mutate(T_15_29_lag5 = lag(T_15_29, 5)) %>%
#lag 30-49y age-specific data by 2 and 5y
  mutate(F_30_49_lag2 = lag(F_30_49, 2)) %>%
  mutate(F_30_49_lag5 = lag(F_30_49, 5)) %>%
  mutate(M_30_49_lag2 = lag(M_30_49, 2)) %>%
  mutate(M_30_49_lag5 = lag(M_30_49, 5)) %>%
  mutate(T_30_49_lag2 = lag(T_30_49, 2)) %>%
  mutate(T_30_49_lag5 = lag(T_30_49, 5)) %>%
#lag 50-69y age-specific data by 2 and 5y
  mutate(F_50_69_lag2 = lag(F_50_69, 2)) %>%
  mutate(F_50_69_lag5 = lag(F_50_69, 5)) %>%
  mutate(M_50_69_lag2 = lag(M_50_69, 2)) %>%
  mutate(M_50_69_lag5 = lag(M_50_69, 5)) %>%
  mutate(T_50_69_lag2 = lag(T_50_69, 2)) %>%
  mutate(T_50_69_lag5 = lag(T_50_69, 5)) %>%
#lag 70up y age-specific data by 2 and 5y
  mutate(F_70up_lag2 = lag(F_70up, 2)) %>%
  mutate(F_70up_lag5 = lag(F_70up, 5)) %>%
  mutate(M_70up_lag2 = lag(M_70up, 2)) %>%
  mutate(M_70up_lag5 = lag(M_70up, 5)) %>%
  mutate(T_70up_lag2 = lag(T_70up, 2)) %>%
  mutate(T_70up_lag5 = lag(T_70up, 5)) 



#new df created to get rid of NAs for relevant column for LE_T_lag2
#cumbersome solution...

paneldata4 <- paneldata3[,c(1:37)]
paneldata4 <- paneldata4[complete.cases(paneldata4), ]
              
#fixed effects regression with 2 year lag

FE.LEonAAFI.lag2 <-lm(LE_T_lag2 ~ AAFIvalues + 
                        factor(Country) - 1, 
                      data = paneldata4)
summary(FE.LEonAAFI.lag2)

#scatterplot of the data with 2 year lag

FE.LEonAAFI.scatterlag2 <- FE.LEonAAFI.lag2$fitted

scatterplot(FE.LEonAAFI.scatterlag2 ~ paneldata4$AAFIvalues | paneldata4$Country,
            xlab ="AAFI", 
            ylab ="LE Total lagged 2 years", 
            boxplots = FALSE, 
            smooth = FALSE) 
abline(lm(paneldata4$LE_T_lag2 ~ paneldata4$AAFIvalues),lwd=3, col="red") 

##should I be using the plm package a la https://www.youtube.com/watch?v=1pST2lUx6QM&t=213s 
#try with plm package
# https://bookdown.org/ccolonescu/RPoE4/panel-data-models.html 

#Confirmation of unbalanced panel
pdim(paneldata3)

#fixed effects using plm package
FE.LEonAAFI.lag2.plm <- plm(LE_T_lag2 ~ AAFIvalues, data=paneldata4, model="within")
summary(FE.LEonAAFI.lag2.plm)

# Display the fixed effects (constants for each country)
fixef(FE.LEonAAFI.lag2.plm)

#2.2 Real pc Government Expenditure (now slightly changed) v LE, no adjustments 

#2.3 Public social spending v LE, no adjustments

#2.4 CAPB v LE, no adjustments


#3. run check statistics
#4. run sensitivity analyses
#5. calculate deficit on government expenditure measure
#6. run per protocol analysis on that outcome