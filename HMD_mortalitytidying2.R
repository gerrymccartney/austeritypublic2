#Import mortality txt files from HMD for calculation of ASMRs and age-specific mortality rates

AUSm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/AUS.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

AUTm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/AUT.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

BELm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/BEL.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

BGRm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/BGR.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

BLRm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/BLR.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

CANm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/CAN.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

CHEm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/CHE.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

CHLm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/CHL.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

CZEm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/CZE.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

DEUTEm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/DEUTE.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

DEUTNPm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/DEUTNP.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

DEUTWm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/DEUTW.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

DNKm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/DNK.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

ESPm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/ESP.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

ESTm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/EST.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

FINm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/FIN.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

FRACNPm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/FRACNP.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

FRATNPm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/FRATNP.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

GBR_NIRm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/GBR_NIR.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

GBR_NPm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/GBR_NP.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

GBR_SCOm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/GBR_SCO.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

GBRCENWm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/GBRCENW.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

GBRTENWm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/GBRTENW.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

GRCm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/GRC.Mx_5x1.txt",
                      sep = "", 
                      col.names = c("year", "age", "female", "male", "total"),
                      skip = 3)

HKGm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/HKG.Mx_5x1.txt",
                      sep = "", 
                      col.names = c("year", "age", "female", "male", "total"),
                      skip = 3)

HRVm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/HRV.Mx_5x1.txt",
                       sep = "", 
                       col.names = c("year", "age", "female", "male", "total"),
                       skip = 3)

HUNm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/HUN.Mx_5x1.txt",
                      sep = "", 
                      col.names = c("year", "age", "female", "male", "total"),
                      skip = 3)

IRLm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/IRL.Mx_5x1.txt",
                      sep = "", 
                      col.names = c("year", "age", "female", "male", "total"),
                      skip = 3)

ISLm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/ISL.Mx_5x1.txt",
                       sep = "", 
                       col.names = c("year", "age", "female", "male", "total"),
                       skip = 3)

ISRm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/ISR.Mx_5x1.txt",
                      sep = "", 
                      col.names = c("year", "age", "female", "male", "total"),
                      skip = 3)

ITAm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/ITA.Mx_5x1.txt",
                       sep = "", 
                       col.names = c("year", "age", "female", "male", "total"),
                       skip = 3) 
                     
JPNm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/JPN.Mx_5x1.txt",
                        sep = "", 
                        col.names = c("year", "age", "female", "male", "total"),
                        skip = 3)

KORm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/KOR.Mx_5x1.txt",
                        sep = "", 
                        col.names = c("year", "age", "female", "male", "total"),
                        skip = 3)

LTUm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/LTU.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

LUXm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/LUX.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

LVAm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/LVA.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

NLDm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/NLD.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

NORm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/NOR.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

NZL_MAm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/NZL_MA.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

NZL_NMm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/NZL_NM.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

NZL_NPm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/NZL_NP.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

POLm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/POL.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

PRTm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/PRT.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

RUSm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/RUS.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

SVKm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/SVK.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3) 

SVNm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/SVN.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

SWEm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/SWE.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

TWNm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/TWN.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

UKRm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/UKR.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

USAm <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1/USA.Mx_5x1.txt",
                   sep = "", 
                   col.names = c("year", "age", "female", "male", "total"),
                   skip = 3)

#data all uploaded by listed as sequential age groups within years. All needs tidied. Desperately wanting to revert to excel. 
#create tibbles

library(tidyverse)

library("tibble")

AUSm_tbl <- as_tibble(AUSm)
AUTm_tbl <- as_tibble(AUTm)
BELm_tbl <- as_tibble(BELm)
BGRm_tbl <- as_tibble(BGRm)
BLRm_tbl <- as_tibble(BLRm)
CANm_tbl <- as_tibble(CANm)
CHEm_tbl <- as_tibble(CHEm)
CHLm_tbl <- as_tibble(CHLm)
CZEm_tbl <- as_tibble(CZEm)
DEUTEm_tbl <- as_tibble(DEUTEm)
DEUTNPm_tbl <- as_tibble(DEUTNPm)
DEUTWm_tbl <- as_tibble(DEUTWm)
DNKm_tbl <- as_tibble(DNKm)
ESPm_tbl <- as_tibble(ESPm)
ESTm_tbl <- as_tibble(ESTm)
FINm_tbl <- as_tibble(FINm)
FRACNPm_tbl <- as_tibble(FRACNPm)
FRATNPm_tbl <- as_tibble(FRATNPm)
GBR_NIRm_tbl <- as_tibble(GBR_NIRm)
GBR_NPm_tbl <- as_tibble(GBR_NPm)
GBR_SCOm_tbl <- as_tibble(GBR_SCOm)
GBRCENWm_tbl <- as_tibble(GBRCENWm)
GBRTENWm_tbl <- as_tibble(GBRTENWm)
GRCm_tbl <- as_tibble(GRCm)
HKGm_tbl <- as_tibble(HKGm) 
HRVm_tbl <- as_tibble(HRVm)
HUNm_tbl <- as_tibble(HUNm)
IRLm_tbl <- as_tibble(IRLm)
ISLm_tbl <- as_tibble(ISLm)
ISRm_tbl <- as_tibble(ISRm)
ITAm_tbl <- as_tibble(ITAm)
JPNm_tbl <- as_tibble(JPNm)
KORm_tbl <- as_tibble(KORm)
LTUm_tbl <- as_tibble(LTUm)
LUXm_tbl <- as_tibble(LUXm)
LVAm_tbl <- as_tibble(LVAm)
NLDm_tbl <- as_tibble(NLDm)
NORm_tbl <- as_tibble(NORm) 
NZL_MAm_tbl <- as_tibble(NZL_MAm)
NZL_NMm_tbl <- as_tibble(NZL_NMm)
NZL_NPm_tbl <- as_tibble(NZL_NPm)
POLm_tbl <- as_tibble(POLm)
PRTm_tbl <- as_tibble(PRTm)
RUSm_tbl <- as_tibble(RUSm)
SVKm_tbl <- as_tibble(SVKm)
SVNm_tbl <- as_tibble(SVNm)
SWEm_tbl <- as_tibble(SWEm)
TWNm_tbl <- as_tibble(TWNm)
UKRm_tbl <- as_tibble(UKRm)
USAm_tbl <- as_tibble(USAm) 

# Creating new dataframe to store ASMR results

library(tidyverse)
library(readxl)

ASMR <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/ASMR.xlsx")

#Creating dataframe with ESP2013 to refer to 
#note upper bin in ESP2013 is 95+, but data in HMD goes up to 110+
#expanded version of ESP now uploaded

Standard <- read_excel("D:/Mortality_trends/Austerity/Austerity_analysis/Data/ESP_expanded.xlsx")

#Breaking it down. Below codes selects all the 1921 data for total population

##AUSm[AUSm$year == "1921", c("total")] 

#Now the code selects only the 1921 data for the youngest age group 

##AUSm[AUSm$year == "1921" & AUSm$age == "0", c("total")] 

#Now to take this value and multiply it by the standard population
#turns out the data in the mortality spreadsheets is current saved as factors

##is.numeric(AUSm$total)
##class(AUSm$total)
##class(Standard$age)

#problem may have occurred because I didn't include stringsAsFactors=FALSE when reading in the table 
#gone back and added that to read.table and rerun the tibble. 
#still not working, check standard. 
#standard column for population is numeric

##x <- (AUSm[AUSm$year == "1921" & AUSm$age == "0", c("total")])

##
##is.numeric(x)
##is.numeric(y)

#despite adding stringsAsFactors=FALSE and rerunning, none of the values are numeric yet. 
#code below converts only the relevant columns of the AUSm_tbl and Standard dfs to numeric. 

AUSm_tbl$female <- as.numeric(as.character(AUSm_tbl$female))
AUSm_tbl$male <- as.numeric(as.character(AUSm_tbl$male))
AUSm_tbl$total <- as.numeric(as.character(AUSm_tbl$total))

AUTm_tbl$female <- as.numeric(as.character(AUTm_tbl$female))
AUTm_tbl$male <- as.numeric(as.character(AUTm_tbl$male))
AUTm_tbl$total <- as.numeric(as.character(AUTm_tbl$total))

BELm_tbl$female <- as.numeric(as.character(BELm_tbl$female))
BELm_tbl$male <- as.numeric(as.character(BELm_tbl$male))
BELm_tbl$total <- as.numeric(as.character(BELm_tbl$total))

BGRm_tbl$female <- as.numeric(as.character(BGRm_tbl$female))
BGRm_tbl$male <- as.numeric(as.character(BGRm_tbl$male))
BGRm_tbl$total <- as.numeric(as.character(BGRm_tbl$total))

BLRm_tbl$female <- as.numeric(as.character(BLRm_tbl$female))
BLRm_tbl$male <- as.numeric(as.character(BLRm_tbl$male))
BLRm_tbl$total <- as.numeric(as.character(BLRm_tbl$total))

CANm_tbl$female <- as.numeric(as.character(CANm_tbl$female))
CANm_tbl$male <- as.numeric(as.character(CANm_tbl$male))
CANm_tbl$total <- as.numeric(as.character(CANm_tbl$total))

CHEm_tbl$female <- as.numeric(as.character(CHEm_tbl$female))
CHEm_tbl$male <- as.numeric(as.character(CHEm_tbl$male))
CHEm_tbl$total <- as.numeric(as.character(CHEm_tbl$total))

CHLm_tbl$female <- as.numeric(as.character(CHLm_tbl$female))
CHLm_tbl$male <- as.numeric(as.character(CHLm_tbl$male))
CHLm_tbl$total <- as.numeric(as.character(CHLm_tbl$total))

CZEm_tbl$female <- as.numeric(as.character(CZEm_tbl$female))
CZEm_tbl$male <- as.numeric(as.character(CZEm_tbl$male))
CZEm_tbl$total <- as.numeric(as.character(CZEm_tbl$total))

DEUTEm_tbl$female <- as.numeric(as.character(DEUTEm_tbl$female))
DEUTEm_tbl$male <- as.numeric(as.character(DEUTEm_tbl$male))
DEUTEm_tbl$total <- as.numeric(as.character(DEUTEm_tbl$total))

DEUTNPm_tbl$female <- as.numeric(as.character(DEUTNPm_tbl$female))
DEUTNPm_tbl$male <- as.numeric(as.character(DEUTNPm_tbl$male))
DEUTNPm_tbl$total <- as.numeric(as.character(DEUTNPm_tbl$total))

DEUTWm_tbl$female <- as.numeric(as.character(DEUTWm_tbl$female))
DEUTWm_tbl$male <- as.numeric(as.character(DEUTWm_tbl$male))
DEUTWm_tbl$total <- as.numeric(as.character(DEUTWm_tbl$total))

DNKm_tbl$female <- as.numeric(as.character(DNKm_tbl$female))
DNKm_tbl$male <- as.numeric(as.character(DNKm_tbl$male))
DNKm_tbl$total <- as.numeric(as.character(DNKm_tbl$total))

ESPm_tbl$female <- as.numeric(as.character(ESPm_tbl$female))
ESPm_tbl$male <- as.numeric(as.character(ESPm_tbl$male))
ESPm_tbl$total <- as.numeric(as.character(ESPm_tbl$total))

ESTm_tbl$female <- as.numeric(as.character(ESTm_tbl$female))
ESTm_tbl$male <- as.numeric(as.character(ESTm_tbl$male))
ESTm_tbl$total <- as.numeric(as.character(ESTm_tbl$total))

FINm_tbl$female <- as.numeric(as.character(FINm_tbl$female))
FINm_tbl$male <- as.numeric(as.character(FINm_tbl$male))
FINm_tbl$total <- as.numeric(as.character(FINm_tbl$total))

FRACNPm_tbl$female <- as.numeric(as.character(FRACNPm_tbl$female))
FRACNPm_tbl$male <- as.numeric(as.character(FRACNPm_tbl$male))
FRACNPm_tbl$total <- as.numeric(as.character(FRACNPm_tbl$total))

FRATNPm_tbl$female <- as.numeric(as.character(FRATNPm_tbl$female))
FRATNPm_tbl$male <- as.numeric(as.character(FRATNPm_tbl$male))
FRATNPm_tbl$total <- as.numeric(as.character(FRATNPm_tbl$total))

GBR_CENWm_tbl$female <- as.numeric(as.character(GBR_CENWm_tbl$female))
GBR_CENWm_tbl$male <- as.numeric(as.character(GBR_CENWm_tbl$male))
GBR_CENWm_tbl$total <- as.numeric(as.character(GBR_CENWm_tbl$total))

GBR_NIRm_tbl$female <- as.numeric(as.character(GBR_NIRm_tbl$female))
GBR_NIRm_tbl$male <- as.numeric(as.character(GBR_NIRm_tbl$male))
GBR_NIRm_tbl$total <- as.numeric(as.character(GBR_NIRm_tbl$total))

GBR_NPm_tbl$female <- as.numeric(as.character(GBR_NPm_tbl$female))
GBR_NPm_tbl$male <- as.numeric(as.character(GBR_NPm_tbl$male))
GBR_NPm_tbl$total <- as.numeric(as.character(GBR_NPm_tbl$total))

GBR_SCOm_tbl$female <- as.numeric(as.character(GBR_SCOm_tbl$female))
GBR_SCOm_tbl$male <- as.numeric(as.character(GBR_SCOm_tbl$male))
GBR_SCOm_tbl$total <- as.numeric(as.character(GBR_SCOm_tbl$total))

GBR_TENWm_tbl$female <- as.numeric(as.character(GBR_TENWm_tbl$female))
GBR_TENWm_tbl$male <- as.numeric(as.character(GBR_TENWm_tbl$male))
GBR_TENWm_tbl$total <- as.numeric(as.character(GBR_TENWm_tbl$total))

GBRCENWm_tbl$female <- as.numeric(as.character(GBRCENWm_tbl$female))
GBRCENWm_tbl$male <- as.numeric(as.character(GBRCENWm_tbl$male))
GBRCENWm_tbl$total <- as.numeric(as.character(GBRCENWm_tbl$total))

GRCm_tbl$female <- as.numeric(as.character(GRCm_tbl$female))
GRCm_tbl$male <- as.numeric(as.character(GRCm_tbl$male))
GRCm_tbl$total <- as.numeric(as.character(GRCm_tbl$total))

HRVm_tbl$female <- as.numeric(as.character(HRVm_tbl$female))
HRVm_tbl$male <- as.numeric(as.character(HRVm_tbl$male))
HRVm_tbl$total <- as.numeric(as.character(HRVm_tbl$total))

HUNm_tbl$female <- as.numeric(as.character(HUNm_tbl$female))
HUNm_tbl$male <- as.numeric(as.character(HUNm_tbl$male))
HUNm_tbl$total <- as.numeric(as.character(HUNm_tbl$total))

IRLm_tbl$female <- as.numeric(as.character(IRLm_tbl$female))
IRLm_tbl$male <- as.numeric(as.character(IRLm_tbl$male))
IRLm_tbl$total <- as.numeric(as.character(IRLm_tbl$total))

ISLm_tbl$female <- as.numeric(as.character(ISLm_tbl$female))
ISLm_tbl$male <- as.numeric(as.character(ISLm_tbl$male))
ISLm_tbl$total <- as.numeric(as.character(ISLm_tbl$total))

ITAm_tbl$female <- as.numeric(as.character(ITAm_tbl$female))
ITAm_tbl$male <- as.numeric(as.character(ITAm_tbl$male))
ITAm_tbl$total <- as.numeric(as.character(ITAm_tbl$total))

KORm_tbl$female <- as.numeric(as.character(KORm_tbl$female))
KORm_tbl$male <- as.numeric(as.character(KORm_tbl$male))
KORm_tbl$total <- as.numeric(as.character(KORm_tbl$total))

LTUm_tbl$female <- as.numeric(as.character(LTUm_tbl$female))
LTUm_tbl$male <- as.numeric(as.character(LTUm_tbl$male))
LTUm_tbl$total <- as.numeric(as.character(LTUm_tbl$total))

LUXm_tbl$female <- as.numeric(as.character(LUXm_tbl$female))
LUXm_tbl$male <- as.numeric(as.character(LUXm_tbl$male))
LUXm_tbl$total <- as.numeric(as.character(LUXm_tbl$total))

LVAm_tbl$female <- as.numeric(as.character(LVAm_tbl$female))
LVAm_tbl$male <- as.numeric(as.character(LVAm_tbl$male))
LVAm_tbl$total <- as.numeric(as.character(LVAm_tbl$total))

NLDm_tbl$female <- as.numeric(as.character(NLDm_tbl$female))
NLDm_tbl$male <- as.numeric(as.character(NLDm_tbl$male))
NLDm_tbl$total <- as.numeric(as.character(NLDm_tbl$total))

NORm_tbl$female <- as.numeric(as.character(NORm_tbl$female))
NORm_tbl$male <- as.numeric(as.character(NORm_tbl$male))
NORm_tbl$total <- as.numeric(as.character(NORm_tbl$total))

NZL_MAm_tbl$female <- as.numeric(as.character(NZL_MAm_tbl$female))
NZL_MAm_tbl$male <- as.numeric(as.character(NZL_MAm_tbl$male))
NZL_MAm_tbl$total <- as.numeric(as.character(NZL_MAm_tbl$total))

NZL_NMm_tbl$female <- as.numeric(as.character(NZL_NMm_tbl$female))
NZL_NMm_tbl$male <- as.numeric(as.character(NZL_NMm_tbl$male))
NZL_NMm_tbl$total <- as.numeric(as.character(NZL_NMm_tbl$total))

NZL_NPm_tbl$female <- as.numeric(as.character(NZL_NPm_tbl$female))
NZL_NPm_tbl$male <- as.numeric(as.character(NZL_NPm_tbl$male))
NZL_NPm_tbl$total <- as.numeric(as.character(NZL_NPm_tbl$total))

POLm_tbl$female <- as.numeric(as.character(POLm_tbl$female))
POLm_tbl$male <- as.numeric(as.character(POLm_tbl$male))
POLm_tbl$total <- as.numeric(as.character(POLm_tbl$total))

PRTm_tbl$female <- as.numeric(as.character(PRTm_tbl$female))
PRTm_tbl$male <- as.numeric(as.character(PRTm_tbl$male))
PRTm_tbl$total <- as.numeric(as.character(PRTm_tbl$total))

RUSm_tbl$female <- as.numeric(as.character(RUSm_tbl$female))
RUSm_tbl$male <- as.numeric(as.character(RUSm_tbl$male))
RUSm_tbl$total <- as.numeric(as.character(RUSm_tbl$total))

SVKm_tbl$female <- as.numeric(as.character(SVKm_tbl$female))
SVKm_tbl$male <- as.numeric(as.character(SVKm_tbl$male))
SVKm_tbl$total <- as.numeric(as.character(SVKm_tbl$total))

SVNm_tbl$female <- as.numeric(as.character(SVNm_tbl$female))
SVNm_tbl$male <- as.numeric(as.character(SVNm_tbl$male))
SVNm_tbl$total <- as.numeric(as.character(SVNm_tbl$total))

SWEm_tbl$female <- as.numeric(as.character(SWEm_tbl$female))
SWEm_tbl$male <- as.numeric(as.character(SWEm_tbl$male))
SWEm_tbl$total <- as.numeric(as.character(SWEm_tbl$total))

TWNm_tbl$female <- as.numeric(as.character(TWNm_tbl$female))
TWNm_tbl$male <- as.numeric(as.character(TWNm_tbl$male))
TWNm_tbl$total <- as.numeric(as.character(TWNm_tbl$total))

UKRm_tbl$female <- as.numeric(as.character(UKRm_tbl$female))
UKRm_tbl$male <- as.numeric(as.character(UKRm_tbl$male))
UKRm_tbl$total <- as.numeric(as.character(UKRm_tbl$total))

USAm_tbl$female <- as.numeric(as.character(USAm_tbl$female))
USAm_tbl$male <- as.numeric(as.character(USAm_tbl$male))
USAm_tbl$total <- as.numeric(as.character(USAm_tbl$total))

#fixes standard population as numeric

Standard$population <- as.numeric(as.character(Standard$population))


#now relevant data are converted to numerical values 
#got it working for single value

  #(AUSm[AUSm$year == "1921" & AUSm$age == "0", c("total")])*(Standard[Standard$age == "0", c("population")])

#first attempt to manipulate data to create new column in ASMR

#now to make the above into a function that I can then apply elsewhere. Substituting variables into year and population. 
#variables data is the dataframe to be used; year is the year; population is M/F/total

#Standardisation function below. Needs top bin issue resolved. Otherwise good. 
###problem with below. Need to check back with original function###

standardisation <- function(data, year, population) {
    (data[data$year == year & data$age == "0", c(population)])*(Standard[Standard$age == "0-1", c("population")])+
    (data[data$year == year & data$age == "1-4", c(population)])*(Standard[Standard$age == "1-4", c("population")])+
    (data[data$year == year & data$age == "5-9", c(population)])*(Standard[Standard$age == "5-9", c("population")])+
    (data[data$year == year & data$age == "10-14", c(population)])*(Standard[Standard$age == "10-14", c("population")])+
    (data[data$year == year & data$age == "15-19", c(population)])*(Standard[Standard$age == "15-19", c("population")])+
    (data[data$year == year & data$age == "20-24", c(population)])*(Standard[Standard$age == "20-24", c("population")])+
    (data[data$year == year & data$age == "25-29", c(population)])*(Standard[Standard$age == "25-29", c("population")])+
    (data[data$year == year & data$age == "30-34", c(population)])*(Standard[Standard$age == "30-34", c("population")])+
    (data[data$year == year & data$age == "35-39", c(population)])*(Standard[Standard$age == "35-39", c("population")])+
    (data[data$year == year & data$age == "40-44", c(population)])*(Standard[Standard$age == "40-44", c("population")])+
    (data[data$year == year & data$age == "45-49", c(population)])*(Standard[Standard$age == "45-49", c("population")])+
    (data[data$year == year & data$age == "50-54", c(population)])*(Standard[Standard$age == "50-54", c("population")])+
    (data[data$year == year & data$age == "55-59", c(population)])*(Standard[Standard$age == "55-59", c("population")])+
    (data[data$year == year & data$age == "60-64", c(population)])*(Standard[Standard$age == "60-64", c("population")])+
    (data[data$year == year & data$age == "65-69", c(population)])*(Standard[Standard$age == "65-69", c("population")])+
    (data[data$year == year & data$age == "70-74", c(population)])*(Standard[Standard$age == "70-74", c("population")])+
    (data[data$year == year & data$age == "75-79", c(population)])*(Standard[Standard$age == "75-79", c("population")])+
    (data[data$year == year & data$age == "80-84", c(population)])*(Standard[Standard$age == "80-84", c("population")])+
    (data[data$year == year & data$age == "85-89", c(population)])*(Standard[Standard$age == "85-89", c("population")])+
    (data[data$year == year & data$age == "90-94", c(population)])*(Standard[Standard$age == "90-94", c("population")])+
    (data[data$year == year & data$age == "85-89", c(population)])*(Standard[Standard$age == "85-89", c("population")])+
    (data[data$year == year & data$age == "90-94", c(population)])*(Standard[Standard$age == "90-94", c("population")])+
    (data[data$year == year & data$age == "95-99", c(population)])*(Standard[Standard$age == "95-99", c("population")])+
    (data[data$year == year & data$age == "100-104", c(population)])*(Standard[Standard$age == "100-104", c("population")])+
    (data[data$year == year & data$age == "105-109", c(population)])*(Standard[Standard$age == "105-109", c("population")])+
    (data[data$year == year & data$age == "110+", c(population)])*(Standard[Standard$age == "110+", c("population")])
  }

#the function has now worked (though the value looks too high to be accurate - may be bugs somewhere yet)

standardisation(AUSm_tbl, "2000", "total")

#next steps
#write a loop to run the standardisation function for each year, for M/F/T, for each country
#remembering to change dfs to numeric
#and to write the results into a new df (ASMR). Will need to start here with writing out of results. 
#check https://stackoverflow.com/questions/51800824/save-function-output-to-vector-or-column-in-data-frame-r

#Frank's advice - use map function

library(dplyr)
library(purrr)

#need to check code below

list_mortality_files <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/HMD_mortality_country_list.xls",
                                   sep = "", 
                                   c("country", "country_code", "mortality_table_code"),
                                   skip = 1) 

list_mortality_files <- list.files(path = "D:/Mortality_trends/Austerity/Austerity_analysis/Data/Mx_5x1") 
df <- list_mortality_files %>%
  map_df(read_table(.x, sep = "", 
                    col.names = c("year", "age", "female", "male", "total"),
                    skip = 3 ))

