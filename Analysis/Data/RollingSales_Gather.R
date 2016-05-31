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
<<<<<<< HEAD
hist(sale.price.n, breaks = 10000, xlim = range(0,2e7)) # Something weird here
hist(sale.price.n[sale.price.n>0])

#added color and narrowed the x axis limits
    options(scipen = 9999999)
    sale.mean <- mean(bk$sale.price.n, na.rm=TRUE)
    sale.sd <- sd(bk$sale.price.n, na.rm=TRUE)
    xlimit <- as.integer(sale.mean + 2*sale.sd)  #narrow the upper range of X axis
hist(sale.price.n, main = "improved histogram", xlab = "Sale Price", xlim = c(0, xlimit),breaks = 1000, col = "red")

#### NEED TO FIGURE OUT WHY ERRORING #### 
hist(gross.sqft[sale.price.n==0], main="original")  # original code, doesn't work
#suggested improvement
hist(gross.sqft[!sale.price.n==0],main = "Added ! to exclude all 0 values")

hist(sale.price.n[sale.price.n>0], main ="Original histogram n>0",breaks = 1000, xlim = range(0,2e7))  # Original histogram
hist(sale.price.n[sale.price.n>100], main = "New version N>100", breaks = 10000, col="green", xlim = c(0,1800000)) #Suggested histogram
=======
hist(sale.price.n) # Something weird here
hist(sale.price.n[sale.price.n>0], breaks = 2000) # Breaks modified by Chris

if(length(which(sale.price.n == 0)) != 0) { # Conditional added by Chris to account for when 0's
    hist(gross.sqft[sale.price.n==0])       # do not exist in data such as in Bronx data set
} else { hist(gross.sqft[sale.price.n>0], breaks = 1000) }

>>>>>>> 256b5648750039ac26cdf0ab746a932794507347
detach(bk)

## keep only the actual sales

bk.sale <- bk[bk$sale.price.n!=0,]
plot(bk.sale$gross.sqft,bk.sale$sale.price.n)
plot(log(bk.sale$gross.sqft),log(bk.sale$sale.price.n))
