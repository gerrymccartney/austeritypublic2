#INITIAL DATA TIDYING TO GET HMD LIFE EXPECTANCY DATA FROM TEXT FILES INTO USABLE FORMATS

#packages

library(readr)

#read in all countries LE data from txt files on stick from HMD

AUS <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/AUS.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

AUT <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/AUT.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

BEL <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/BEL.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

BGR <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/BGR.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

BLR <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/BLR.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

CAN <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/CAN.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

CHE <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/CHE.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

CHL <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/CHL.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

CZE <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/CZE.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

DEUTE <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/DEUTE.E0per.txt", 
                    sep = "", 
                    col.names = c("year", "female", "male", "total"), 
                    skip = 3)

DEUTNP <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/DEUTNP.E0per.txt", 
                     sep = "", 
                     col.names = c("year", "female", "male", "total"), 
                     skip = 3)

DEUTW <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/DEUTW.E0per.txt", 
                    sep = "", 
                    col.names = c("year", "female", "male", "total"), 
                    skip = 3)

DNK <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/DNK.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

ESP <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/ESP.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

EST <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/EST.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

FIN <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/FIN.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

FRACNP <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/FRACNP.E0per.txt", 
                     sep = "", 
                     col.names = c("year", "female", "male", "total"), 
                     skip = 3)

FRATNP <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/FRATNP.E0per.txt", 
                     sep = "", 
                     col.names = c("year", "female", "male", "total"), 
                     skip = 3)

GBR_NIR <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/GBR_NIR.E0per.txt", 
                      sep = "", 
                      col.names = c("year", "female", "male", "total"), 
                      skip = 3)

GBR_NP <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/GBR_NP.E0per.txt", 
                     sep = "", 
                     col.names = c("year", "female", "male", "total"), 
                     skip = 3)

GBR_SCO <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/GBR_SCO.E0per.txt", 
                      sep = "", 
                      col.names = c("year", "female", "male", "total"), 
                      skip = 3)

GBRCENW <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/GBRCENW.E0per.txt", 
                      sep = "", 
                      col.names = c("year", "female", "male", "total"), 
                      skip = 3)

GBRTENW <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/GBRTENW.E0per.txt", 
                      sep = "", 
                      col.names = c("year", "female", "male", "total"), 
                      skip = 3)

GRC <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/GRC.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

HKG <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/HKG.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

HRV <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/HRV.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

HUN <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/HUN.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

IRL <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/IRL.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

ISL <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/ISL.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

ITA <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/ITA.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

JPN <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/JPN.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

KOR <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/KOR.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

LTU <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/LTU.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

LUX <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/LUX.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

LVA <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/LVA.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

NLD <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/NLD.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

NOR <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/NOR.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

NZL_MA <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/NZL_MA.E0per.txt", 
                     sep = "", 
                     col.names = c("year", "female", "male", "total"), 
                     skip = 3)

NZL_NM <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/NZL_NM.E0per.txt", 
                     sep = "", 
                     col.names = c("year", "female", "male", "total"), 
                     skip = 3)

NZL_NP <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/NZL_NP.E0per.txt", 
                     sep = "", 
                     col.names = c("year", "female", "male", "total"), 
                     skip = 3)

POL <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/POL.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

PRT <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/PRT.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

RUS <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/RUS.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

SVK <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/SVK.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

SVN <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/SVN.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

SWE <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/SWE.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

TWN <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/TWN.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

UKR <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/UKR.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)

USA <- read.table("D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed/USA.E0per.txt", 
                  sep = "", 
                  col.names = c("year", "female", "male", "total"), 
                  skip = 3)


# Create list of files for mass upload 

list_of_files <- list.files(path = "D:/Mortality_trends/Austerity/Austerity_analysis/Data/e0_per_uncompressed", recursive = TRUE,
                            pattern = "\\.txt$", 
                            full.names = TRUE)



#Merging data across HMD individual country data objects to create single files for descriptive analysis for M, W, T. 
#First need to convert data frames to tibbles

# Loading
library("tibble")

AUS_tbl <- as_tibble(AUS)
AUT_tbl <- as_tibble(AUT)
BEL_tbl <- as_tibble(BEL)
BGR_tbl <- as_tibble(BGR)
BLR_tbl <- as_tibble(BLR)
CAN_tbl <- as_tibble(CAN)
CHE_tbl <- as_tibble(CHE)
CHL_tbl <- as_tibble(CHL)
CZE_tbl <- as_tibble(CZE)
DEUTE_tbl <- as_tibble(DEUTE)
DEUTNP_tbl <- as_tibble(DEUTNP)
DEUTW_tbl <- as_tibble(DEUTW)
DNK_tbl <- as_tibble(DNK)
DT_tbl <- as_tibble(DT)
ESP_tbl <- as_tibble(ESP)
EST_tbl <- as_tibble(EST)
FIN_tbl <- as_tibble(FIN)
FRACNP_tbl <- as_tibble(FRACNP)
FRATNP_tbl <- as_tibble(FRATNP)
GBR_NIR_tbl <- as_tibble(GBR_NIR)
GBR_NP_tbl <- as_tibble(GBR_NP)
GBR_SCO_tbl <- as_tibble(GBR_SCO)
GBRCENW_tbl <- as_tibble(GBRCENW)
GBRTENW_tbl <- as_tibble(GBRTENW)
GRC_tbl <- as_tibble(GRC)
HKG_tbl <- as_tibble(HKG) 
HRV_tbl <- as_tibble(HRV)
HUN_tbl <- as_tibble(HUN)
IRL_tbl <- as_tibble(IRL)
ISL_tbl <- as_tibble(ISL)
ITA_tbl <- as_tibble(ITA)
JPN_tbl <- as_tibble(JPN)
KOR_tbl <- as_tibble(KOR)
LTU_tbl <- as_tibble(LTU)
LUX_tbl <- as_tibble(LUX)
LVA_tbl <- as_tibble(LVA)
NLD_tbl <- as_tibble(NLD)
NOR_tbl <- as_tibble(NOR) 
NZL_MA_tbl <- as_tibble(NZL_MA)
NZL_NM_tbl <- as_tibble(NZL_NM)
NZL_NP_tbl <- as_tibble(NZL_NP)
POL_tbl <- as_tibble(POL)
PRT_tbl <- as_tibble(PRT)
RUS_tbl <- as_tibble(RUS)
SVK_tbl <- as_tibble(SVK)
SVN_tbl <- as_tibble(SVN)
SWE_tbl <- as_tibble(SWE)
TWN_tbl <- as_tibble(TWN)
UKR_tbl <- as_tibble(UKR)
USA_tbl <- as_tibble(USA) 

#correcting wee inconsistency in DT data

library("dplyr")

DT_tbl <- DT_tbl %>% rename(year = Year)

#renaming columns in each tibble to include country name

library("dplyr")

AUS_tbl <- AUS_tbl %>% rename(AUSfemale = female, AUSmale = male, AUStotal = total)
AUT_tbl <- AUT_tbl %>% rename(AUTfemale = female, AUTmale = male, AUTtotal = total)
BEL_tbl <- BEL_tbl %>% rename(BELfemale = female, BELmale = male, BELtotal = total)
BGR_tbl <- BGR_tbl %>% rename(BGRfemale = female, BGRmale = male, BGRtotal = total)
BLR_tbl <- BLR_tbl %>% rename(BLRfemale = female, BLRmale = male, BLRtotal = total)
CAN_tbl <- CAN_tbl %>% rename(CANfemale = female, CANmale = male, CANtotal = total)
CHE_tbl <- CHE_tbl %>% rename(CHEfemale = female, CHEmale = male, CHEtotal = total)
CHL_tbl <- CHL_tbl %>% rename(CHLfemale = female, CHLmale = male, CHLtotal = total)
CZE_tbl <- CZE_tbl %>% rename(CZEfemale = female, CZEmale = male, CZEtotal = total)
DEUTE_tbl <- DEUTE_tbl %>% rename(DEUTEfemale = female, DEUTEmale = male, DEUTEtotal = total)
DEUTNP_tbl <- DEUTNP_tbl %>% rename(DEUTNPfemale = female, DEUTNPmale = male, DEUTNP = total)
DEUTW_tbl <- DEUTW_tbl %>% rename(DEUTWfemale = female, DEUTWmale = male, DEUTWtotal = total)
DNK_tbl <- DNK_tbl %>% rename(DNKfemale = female, DNKmale = male, DNKtotal = total)
DT_tbl <- DT_tbl %>% rename(DTfemale = Female, DTmale = Male, DTtotal = Total)
ESP_tbl <- ESP_tbl %>% rename(ESPfemale = female, ESPmale = male, ESPtotal = total)
EST_tbl <- EST_tbl %>% rename(ESTfemale = female, ESTmale = male, ESTtotal = total)
FIN_tbl <- FIN_tbl %>% rename(FINfemale = female, FINmale = male, FINtotal = total)
FRACNP_tbl <- FRACNP_tbl %>% rename(FRACNPfemale = female, FRACNPmale = male, FRACNPtotal = total)
FRATNP_tbl <- FRATNP_tbl %>% rename(FRATNPfemale = female, FRATNPmale = male, FRATNPtotal = total)
GBR_NIR_tbl <- GBR_NIR_tbl %>% rename(GBR_NIRfemale = female, GBR_NIRmale = male, GBR_NIRtotal = total) 
GBR_NP_tbl <- GBR_NP_tbl %>% rename(GBR_NPfemale = female, GBR_NPmale = male, GBR_NPtotal = total) 
GBR_SCO_tbl <- GBR_SCO_tbl %>% rename(GBR_SCOfemale = female, GBR_SCOmale = male, GBR_SCOtotal = total) 
GBRCENW_tbl <- GBRCENW_tbl %>% rename(GBRCENW_female = female, GBRCENW_male = male, GBRCENW_total = total)
GBRTENW_tbl <- GBRTENW_tbl %>% rename(GBRTENWfemale = female, GBRTENWmale = male, GBRTENWtotal = total) 
GRC_tbl <- GRC_tbl %>% rename(GRCfemale = female, GRCmale = male, GRCtotal = total)
HKG_tbl <- HKG_tbl %>% rename(HKGfemale = female, HKGmale = male, HKGtotal = total) 
HRV_tbl <- HRV_tbl %>% rename(HRVfemale = female, HRVmale = male, HRVtotal = total) 
HUN_tbl <- HUN_tbl %>% rename(HUNfemale = female, HUNmale = male, HUNtotal = total)
IRL_tbl <- IRL_tbl %>% rename(IRLfemale = female, IRLmale = male, IRLtotal = total)
ISL_tbl <- ISL_tbl %>% rename(ISLfemale = female, ISLmale = male, ISLtotal = total)
ITA_tbl <- ITA_tbl %>% rename(ITAfemale = female, ITAmale = male, ITAtotal = total)
JPN_tbl <- JPN_tbl %>% rename(JPNfemale = female, JPNmale = male, JPNtotal = total)
KOR_tbl <- KOR_tbl %>% rename(KORfemale = female, KORmale = male, KORtotal = total)
LTU_tbl <- LTU_tbl %>% rename(LTUfemale = female, LTUmale = male, LTUtotal = total)
LUX_tbl <- LUX_tbl %>% rename(LUXfemale = female, LUXmale = male, LUXtotal = total)
LVA_tbl <- LVA_tbl %>% rename(LVAfemale = female, LVAmale = male, LVAtotal = total)
NLD_tbl <- NLD_tbl %>% rename(NLDfemale = female, NLDmale = male, NLDtotal = total)
NOR_tbl <- NOR_tbl %>% rename(NORfemale = female, NORmale = male, NORtotal = total) 
NZL_MA_tbl <- NZL_MA_tbl %>% rename(NZL_MAfemale = female, NZL_MAmale = male, NZL_MAtotal = total)
NZL_NM_tbl <- NZL_NM_tbl %>% rename(NZL_NMfemale = female, NZL_NMmale = male, NZL_NMtotal = total)
NZL_NP_tbl <- NZL_NP_tbl %>% rename(NZL_NPfemale = female, NZL_NPmale = male, NZL_NPtotal = total)
POL_tbl <- POL_tbl %>% rename(POLfemale = female, POLmale = male, POLtotal = total)
PRT_tbl <- PRT_tbl %>% rename(PRTfemale = female, PRTmale = male, PRTtotal = total)
RUS_tbl <- RUS_tbl %>% rename(RUSfemale = female, RUSmale = male ,RUStotal = total)
SVK_tbl <- SVK_tbl %>% rename(SVKfemale = female, SVKmale = male, SVKtotal = total)
SVN_tbl <- SVN_tbl %>% rename(SVNfemale = female, SVNmale = male, SVNtotal = total)
SWE_tbl <- SWE_tbl %>% rename(SWEfemale = female, SWEmale = male, SWEtotal = total)
TWN_tbl <- TWN_tbl %>% rename(TWNfemale = female, TWNmale = male, TWNtotal = total)
UKR_tbl <- UKR_tbl %>% rename(UKRfemale = female, UKRmale = male, UKRtotal = total)
USA_tbl <- USA_tbl %>% rename(USAfemale = female, USAmale = male, USAtotal = total)

#all tables now coded with country names in the columns 
#slow way of joining tibbles below. Note that the final table will need re-ordered on year. 


e01 <- dplyr::full_join(AUS_tbl, AUT_tbl, by = "year")
e02 <- dplyr::full_join(e01, BEL_tbl, by = "year")
e03 <- dplyr::full_join(e02, BGR_tbl, by = "year")
e04 <- dplyr::full_join(e03, BLR_tbl, by = "year")
e05 <- dplyr::full_join(e04, CAN_tbl, by = "year")
e06 <- dplyr::full_join(e05, CHE_tbl, by = "year")
e07 <- dplyr::full_join(e06, CHL_tbl, by = "year")
e08 <- dplyr::full_join(e07, CZE_tbl, by = "year")
e09 <- dplyr::full_join(e08, DEUTE_tbl, by = "year")
e010 <- dplyr::full_join(e09, DEUTNP_tbl, by = "year")
e011 <- dplyr::full_join(e010, DEUTW_tbl, by = "year")
e012 <- dplyr::full_join(e011, DNK_tbl, by = "year")
e013 <- dplyr::full_join(e012, ESP_tbl, by = "year")
e014 <- dplyr::full_join(e013, EST_tbl, by = "year")
e015 <- dplyr::full_join(e014, FIN_tbl, by = "year")
e016 <- dplyr::full_join(e015, FRACNP_tbl, by = "year")
e017 <- dplyr::full_join(e016, FRATNP_tbl, by = "year")
e018 <- dplyr::full_join(e017, GBR_NIR_tbl, by = "year")
e019 <- dplyr::full_join(e018, GBR_NP_tbl, by = "year")
e020 <- dplyr::full_join(e019, GBR_SCO_tbl, by = "year")
e021 <- dplyr::full_join(e020, GBRCENW_tbl, by = "year")
e022 <- dplyr::full_join(e021, GRC_tbl, by = "year")
e023 <- dplyr::full_join(e022, HKG_tbl, by = "year")
e024 <- dplyr::full_join(e023, HRV_tbl, by = "year")
e025 <- dplyr::full_join(e024, HUN_tbl, by = "year")
e026 <- dplyr::full_join(e025, IRL_tbl, by = "year")
e027 <- dplyr::full_join(e026, ISL_tbl, by = "year")
e028 <- dplyr::full_join(e027, ITA_tbl, by = "year")
e029 <- dplyr::full_join(e028, JPN_tbl, by = "year")
e030 <- dplyr::full_join(e029, KOR_tbl, by = "year")
e031 <- dplyr::full_join(e030, LTU_tbl, by = "year")
e032 <- dplyr::full_join(e031, LUX_tbl, by = "year")
e033 <- dplyr::full_join(e032, LVA_tbl, by = "year")
e034 <- dplyr::full_join(e033, NLD_tbl, by = "year")
e035 <- dplyr::full_join(e034, NOR_tbl, by = "year")
e036 <- dplyr::full_join(e035, NZL_MA_tbl, by = "year")
e037 <- dplyr::full_join(e036, NZL_NM_tbl, by = "year")
e038 <- dplyr::full_join(e037, NZL_NP_tbl, by = "year")
e039 <- dplyr::full_join(e038, POL_tbl, by = "year")
e040 <- dplyr::full_join(e039, PRT_tbl, by = "year")
e041 <- dplyr::full_join(e040, RUS_tbl, by = "year")
e042 <- dplyr::full_join(e041, SVK_tbl, by = "year")
e043 <- dplyr::full_join(e042, SVN_tbl, by = "year")
e044 <- dplyr::full_join(e043, SWE_tbl, by = "year")
e045 <- dplyr::full_join(e044, TWN_tbl, by = "year")
e046 <- dplyr::full_join(e045, UKR_tbl, by = "year")
e047 <- dplyr::full_join(e046, GBRTENW_tbl, by = "year")
e0_combined <- dplyr::full_join(e047, USA_tbl, by = "year")

#ordering by year

e0_combined_ordered <- e0_combined %>% arrange(year)


