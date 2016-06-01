# TheBronxHousingCosts
##### Live Session Assignment 3 & 4
##### 5/31/16

![](https://specialedandme.files.wordpress.com/2008/03/confused-look.jpg?w=250&h=193)

Image courtesy of Wordpress.com, 2008

<br>

####This project is in response to Live Session Assignment 3/4 and was compiled by Randy Lisbona, Jose Quinonez, and Chris Boomhower. It is a representation of a working, reproducible project and is structured such that anyone interested could easily replicate the same results.

####The original assignment guidelines provided by Dr. Monnie McGee are as follows:
> * I will have code for an analysis of Brooklyn housing data on the course website (from pages 49 and 50 in the O’Neil and Schutt text). The code is not available yet. You can use the code on pages 49-50 of O’Neil and Schutt if you want to work ahead, but it probably doesn’t work in places. It’s old R Code.
* Using the Rolling Data Sales website, download and examine another housing sales data set (not the one we will use in live session, which is linked here - Rolling Housing Sales for NYC).
* Goal: Create an RStudio project for the analysis of this data set. Your file structure within the project should include the following:
    * A README file in the project root directory that includes an explanation of the purpose of the project and the other files
    * A data directory containing files to load in and clean up the data. The clean up should include finding out where there are outliers or missing values, deciding how you will treat them, making sure the dates are formatted correctly, making sure values you think are numerical are being treated as such (correct R class), etc.
    * An Analysis directory containing a file (or files) for exploratory data analysis on the clean data to visualize compare the square footage and sales price for your neighborhood.
    * A Paper directory containing a file (plain text or Markdown) that explains any meaningful patterns in this dataset.
* Note: I am indifferent to the names of the directories as long as they a generally descriptive of the contents and follow naming conventions discussed in Gandrud.
* Deliverable: A link to a repository on GitHub containing the above. I need only one link per group. Since this is a group project, I expect you to divide the labor.

<br>

####Key project files are as follows:
* **/Analysis/Data/rollingsales_bronx.csv** - This is the raw NYC-Bronx home sale price data analyzed during this project and was obtained from [http://www1.nyc.gov/home/search/index.page?search-terms=Rolling+sales+update](http://www1.nyc.gov/home/search/index.page?search-terms=Rolling+sales+update)
* **/Analysis/Data/RollingSales_Gather.R** - This R module imports, cleans, and explores the data in preparation for merging and analysis.
* **/Analysis/Data/RollingSales_MergeData.R** - This R module extracts the clean data of interest and assigns it to a data frame for analysis.
* **/Analysis/RollingSales_Analysis.R** - This R module plots the data of interest, sale price with respect to square footage, and further assess the effects of outliers.
* **/Paper/TheBronxHousingCosts_Paper.md** - This is the central writeup for the project and sources all project code modules to display code outputs and to provide project flow summary and analysis discussion.

<br>

####<font color='red'>**To access our Paper writeup, please click the following link:**</font> [Link to TheBronxHousingCosts_Paper.md](https://github.com/ChrisBoomhower/TheBronxHousingCosts/blob/master/Paper/TheBronxHousingCosts_Paper.md "https://github.com/ChrisBoomhower/TheBronxHousingCosts/blob/master/Paper/TheBronxHousingCosts_Paper.md")