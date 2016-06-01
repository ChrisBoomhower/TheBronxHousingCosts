###########################################################
#
# Students: Chris Boomhower, Randy Lisbona, Jose Quinonez
# Live Session Assignment 3/4
# 06/02/2016
#
# Makefile.R: Loads necessary libraries, sets working
#             working directories, and links modular
#             project files together.
#
# Project R code modified from Benjamin Reddy's code, taken
# from pages 49-50 of O'Neil and Schutt
#
###########################################################

require(gdata)
require(plyr) #Added by Monnie McGee
# Randy Setting  I'm getting an error in the Source(rollingsales_gather) deal with it later
setwd("~/GitHub/TheBronxHousingCosts/Analysis/Data")
getwd()

#setwd("~/GitHub/MSDS_6306/LiveSessionHW3-4/TheBronxHousingCosts/Analysis/Data") #Modified for Chris' pc

source("RollingSales_Gather.R")
source("RollingSales_MergeData.R")

setwd("..")


source("RollingSales_Analysis.R")