# IMPORTING DATA

# 1. set directory
setwd("c:/Users/Io/Dropbox/Malawi/")

# 2. set some options
options(scipen = 999) # surpress scientific notation
options("stringsAsFactors" = FALSE)
options(digits = 4)

# 3. install required packages
library('haven')
library('stringr')
library('gdata')
library('car')
library('reshape2')
library('plyr')
library('dplyr') 
library('RColorBrewer')
library('raster')

#source("M:/TZAYG/plus.R") 
#source("M:/TZAYG/missing.plot.R") 

#Create database of Household characteristics by merging
# create database of household characteristics for the HEAD of the household
#tmp <- tempfile(fileext = ".Year_1/Household")
HHMODB <- read_dta("./Year_1/Household/HH_MOD_B.dta")
HHMODC <- read_dta("./Year_1/Household/HH_MOD_C.dta")
HHMODD <- read_dta("./Year_1/Household/HH_MOD_D.dta")
HHMODE <- read_dta("./Year_1/Household/HH_MOD_E.dta")
HHMODF <- read_dta("./Year_1/Household/HH_MOD_F.dta")
HHMODG1 <- read_dta("./Year_1/Household/HH_MOD_G1.dta")
HHMODG2 <- read_dta("./Year_1/Household/HH_MOD_G2.dta")
HHMODG3 <- read_dta("./Year_1/Household/HH_MOD_G3.dta")
HHMODI1 <- read_dta("./Year_1/Household/HH_MOD_I1.dta")
HHMODI2 <- read_dta("./Year_1/Household/HH_MOD_I2.dta")
HHMODJ <- read_dta("./Year_1/Household/HH_MOD_J.dta")
HHMODK <- read_dta("./Year_1/Household/HH_MOD_K.dta")
HHMODL <- read_dta("./Year_1/Household/HH_MOD_L.dta")
HHMODM <- read_dta("./Year_1/Household/HH_MOD_M.dta")
HHMODN1 <- read_dta("./Year_1/Household/HH_MOD_N1.dta")
HHMODN2 <- read_dta("./Year_1/Household/HH_MOD_N2.dta")
HHMODO <- read_dta("./Year_1/Household/HH_MOD_O.dta")
HHMODP <- read_dta("./Year_1/Household/HH_MOD_P.dta")
HHMODQ <- read_dta("./Year_1/Household/HH_MOD_Q.dta")
HHMODR <- read_dta("./Year_1/Household/HH_MOD_R.dta")
HHMODS1 <- read_dta("./Year_1/Household/HH_MOD_S1.dta")
HHMODS2 <- read_dta("./Year_1/Household/HH_MOD_S2.dta")
HHMODT <- read_dta("./Year_1/Household/HH_MOD_T.dta")

HHdata <- left_join(HHMODB, HHMODC)


head <- select(HHMODB, case_id, hh_b03, hh_b04, hh_b05a, hh_b18, hh_b22, hh_b23) %>%
  ddply(.(case_id), transform, hh.size = length(sbmemno)) %>% filter(hh_b04 == "head") %>%
  select(id_code, hh_b03, hh_b04, hh_b05a, hh_b18, hh_b22, hh_b23)
all(unique(HQSECBU$case_id) %in% unique(head$case_id)) # TRUE

