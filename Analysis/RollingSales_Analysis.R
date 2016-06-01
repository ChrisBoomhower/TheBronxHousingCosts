###########################################################
#
# Students: Chris Boomhower, Randy Lisbona, Jose Quinonez
# Live Session Assignment 3/4
# 06/02/2016
#
# RollingSales_Analysis.R: This R module plots the data
#                          of interest and further asses
#                          the effects of outliers.
#
# Project R code modified from Benjamin Reddy's code, taken
# from pages 49-50 of O'Neil and Schutt
#
###########################################################


## plot 1-, 2-, and 3-family home sale price with respect to sqft
plot(log(bk.homes$gross.sqft, base = 10),log(bk.homes$sale.price.n, base = 10), main = "Plot log of gross sqft vs sale price with outliers", col = 'red')
summary(bk.homes[which(bk.homes$sale.price.n<100000),])

## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log(bk.homes$sale.price.n) <=5) + 0
bk.homes_NoOutliers <- bk.homes[which(bk.homes$outliers==0),]
plot(log(bk.homes_NoOutliers$gross.sqft, base = 10),log(bk.homes_NoOutliers$sale.price.n, base = 10), main = "Plot log of gross sqft vs sale price without outliers", col = 'blue')
