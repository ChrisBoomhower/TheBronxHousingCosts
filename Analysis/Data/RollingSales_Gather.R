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


## You need a perl interpreter to do this on Windows.
## It's automatic in Mac
#bk <- read.xls("rollingsales_brooklyn.xls",pattern="BOROUGH")

# So, save the file as a csv and use read.csv instead
bk <- read.csv("rollingsales_bronx.csv",skip=4,header=TRUE)

## Check the data
head(bk)
summary(bk)
str(bk) # Very handy function!

## clean/format the data with regular expressions
## More on these later. For now, know that the
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.
bk$SALE.PRICE.N <- as.numeric(gsub("[^[:digit:]]","", bk$SALE.PRICE))
count(is.na(bk$SALE.PRICE.N))

names(bk) <- tolower(names(bk)) # make all variable names lower case
## Get rid of leading digits
bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))

## Change sale.date to Date forat in R
bk$sale.date <- as.Date(bk$sale.date)
bk$year.built <- as.numeric(as.character(bk$year.built))

## do a bit of exploration to make sure there's not anything
## weird going on with sale prices
attach(bk)
hist(sale.price.n) # Something weird here
hist(sale.price.n[sale.price.n>0], breaks = 2000) # Breaks modified by Chris

if(length(which(sale.price.n == 0)) != 0) { # Conditional added by Chris to account for when 0's
    hist(gross.sqft[sale.price.n==0])       # do not exist in data such as in Bronx data set
} else { hist(gross.sqft[sale.price.n>0], breaks = 1000) }

detach(bk)

## keep only the actual sales

bk.sale <- bk[bk$sale.price.n!=0,]
plot(bk.sale$gross.sqft,bk.sale$sale.price.n)
plot(log(bk.sale$gross.sqft),log(bk.sale$sale.price.n))
