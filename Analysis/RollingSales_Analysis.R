###########################################################
#
# Students: Chris Boomhower, Randy Lisbona, Jose Quinonez
# Live Session Assignment 3/4
# 06/02/2016
#
# RollingSales_Gather.R: ????????????????
#
# Project R code modified from Benjamin Reddy's code, taken
# from pages 49-50 of O'Neil and Schutt
#
###########################################################


## plot 1-, 2-, and 3-family home sale price with respect to sqft
plot(log(bk.homes$gross.sqft),log(bk.homes$sale.price.n))
summary(bk.homes[which(bk.homes$sale.price.n<100000),])


## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log(bk.homes$sale.price.n) <=5) + 0
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
plot(log(bk.homes$gross.sqft),log(bk.homes$sale.price.n), main = "Plot log of gross sqft vs sale price for outliers")
