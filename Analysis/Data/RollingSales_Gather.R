###########################################################
#
# Students: Chris Boomhower, Randy Lisbona, Jose Quinonez
# Live Session Assignment 3/4
# 06/02/2016
#
# RollingSales_Gather.R: This R module imports, explores
#                        and cleans the data.
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
# Explore histogram of sales prices
hist(sale.price.n, main = "Histogram of all sale prices", xlab = "Sale Price",breaks = 100, col = "red")

# Explore histogram of sale price where the price is less than $1.8M
hist(sale.price.n[sale.price.n>0], main = "Histogram of all sale prices < $1.8M", breaks = 10000, col="green", xlim = c(0,1800000), xlab = "Sale Price")

# Explore histogram on sq ft by missing or $0 sales prices
if(length(which(sale.price.n == 0)) != 0) { # Conditional added by Chris to account for when 0's
    hist(gross.sqft[sale.price.n==0], main = "Histogram of home square footage with $0 sale prices")       # do not exist in data such as in Bronx data set
} else { hist(gross.sqft[is.na(sale.price.n)], main = "Histogram of home square footage with missing sales prices", breaks = 1000, xlab = "Gross sqft") }

detach(bk)

## keep only the records where sale price <> 0
bk.sale <- bk[bk$sale.price.n!=0,]
str(bk.sale)

plot(bk.sale$gross.sqft,bk.sale$sale.price.n, main ="default plot in example code")
plot(bk.sale$gross.sqft,bk.sale$sale.price.n, xlim = c(0,15000), ylim = c(0,1800000), main ="reduce x and y limits to get a better plot")
plot(log(bk.sale$gross.sqft, base = 10),log(bk.sale$sale.price.n, base = 10), main = "plot log of sqft vs sale price")
