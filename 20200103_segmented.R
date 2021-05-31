library(tidyverse)
library(segmented)
library(broom)
library(ggplot2)
library(segmented)

#SEGMENTED REGRESSION CODE 3.1.21

# 1. LIFE EXPECTANCY

#fit the segmented regression for total population life expectancy
sfit <- LE %>%
  filter(Year>=1987 & Year<=2019) %>%
  split(.$Country) %>%
  map(~segmented(lm(Total ~ Year, data = .x), seg.Z=~Year, segmented.default=TRUE))

#get model coefficients note may get warnings as segmented not a method covered by 
#tidy but it works
sfitcoef <- sfit %>%
  map_dfr(~tidy(.x), .id="Country")

#model predictions using broken.line from the segmented package
pred_sfit <- sfit %>%
  map_dfr(~broken.line(.x, se.fit=TRUE), .id="Country", term=Null) 

#add year and merge back with observed le data  
# presumes all countries have data going back to 1987               
pred_sfit_data <- pred_sfit %>%
  group_by(Country) %>%
  mutate(Year=1986+row_number()) %>% 
  ungroup() %>%
  left_join(select(LE, Country, Year, ex), by=c("Country", "Year"))

#plot using facet_wrap for each country
#I haven’t put in vertical line for cut point but could add

pred_sfit_data %>%
  ggplot(aes(y = ex, x = Year)) + 
  geom_point() +
  geom_path(aes(y=fit), col = "blue", size = 1) +
  xlab("Year") +
  ylab("Life expectancy at birth (years)") +
  xlim(1987, 2020) +
  ylim(10, 20) +
  ggtitle("Life expectancy at birth for the total population") +
  theme_bw() +
  facet_wrap(vars(Country))


