# In this script, you will calculate basic descriptive statistics using the
# 'Descriptives.csv' dataset, including:
#       - Frequencies
#       - Minimum/maximum values
#       - Measures of central tendency (mean, median, mode)
#       - Variability (standard deviation, variance, range)
#       - Generate histogram and bar graph

###################

# Install required package(s): 
install.packages("modeest") # This package calculates mode

# Activate required package(s) in current R session:
library(modeest)

# Import 'Descriptives.csv' using read.csv() function and name it 'descrip':
descrip <- read.csv("insert pathway to file w/ forward slashes/Descriptives.csv")

# View 'descrip' using print() function:
print(descrip)

# View structure of 'descrip' using str() function:
str(descrip)

# It should look something like this in the console:

# 'data.frame':	20 obs. of  5 variables:
#  $ PARTICIPANT_ID: int  1015 1007 1012 1001 1006 ...
#  $ AGE           : int  20 21 22 20 22 19 18 22 19 20 ...
#  $ HEIGHT        : num  59.3 59.5 59.7 61.3 63 ...
#  $ WEIGHT        : num  132 189 178 181 131 ...
#  $ GENDER        : chr  "woman" "man" "woman" "woman" ...

# Ensure each variable is in the correct data structure
# (Note that they may already be in the correct data structure):
descrip$PARTICIPANT_ID <- as.factor(descrip$PARTICIPANT_ID)
descrip$AGE <- as.integer(descrip$AGE)
descrip$HEIGHT <- as.numeric(descrip$HEIGHT)
descrip$WEIGHT <- as.numeric(descrip$WEIGHT)
descrip$GENDER <- as.factor(descrip$GENDER)

# Confirm that each variable is in correct data structure:
str(descrip)

# It should look like this in the console:

# 'data.frame':	20 obs. of  5 variables:
#  $ PARTICIPANT_ID: Factor w/ 20 levels "1001","1002",..: 15 7 12 1 6 17 13 19 9 14 ...
#  $ AGE           : int  20 21 22 20 22 19 18 22 19 20 ...
#  $ HEIGHT        : num  59.3 59.5 59.7 61.3 63 ...
#  $ WEIGHT        : num  132 189 178 181 131 ...
#  $ GENDER        : Factor w/ 2 levels "man","woman": 2 1 2 2 2 2 2 2 1 1 ...

#   Obtain minimum and maximum values of AGE using min() and max() functions:
min(descrip$AGE) # min = 18
max(descrip$AGE) # max = 23

#   Obtain range of AGE using range() function:
range(descrip$AGE) # range = 18, 23

#   Obtain mean of AGE using mean() function:
mean(descrip$AGE) # mean = 20.5

#   Obtain mean of HEIGHT
mean(descrip$HEIGHT)
#   Result is NA due to missing data; add "na.rm = TRUE" to tell R that you
#  want it to omit missing data; "na" = not available; "rm" = remove

mean(descrip$HEIGHT, na.rm = TRUE) # mean = 64.55

#   Obtain median of AGE using median() function:
median(descrip$AGE) # median = 21

#   Obtain mode of AGE using mfv() function:
mfv(descrip$AGE) # mode = 21, 22

#   Obtain standard deviation of AGE using sd() function:
sd(descrip$AGE) # sd = 1.50

#   Obtain variance of AGE using var() function:
var(descrip$AGE) # variance = 2.26

#   Obtain frequency table of categorical variable GENDER
#   using the table() function:
table(descrip$GENDER)

#   It should look like this:
#     man  woman 
#     11     9 

#   Obtain histogram of AGE (continuous variable) using
#   the hist() function. It will appear in the viewer panel.
hist(descrip$AGE)


#   Obtain bar graph of GENDER using the plot() function.
#   It will appear in the viewer panel.
plot(descrip$GENDER)



# more info on descriptives: http://www.sthda.com/english/wiki/descriptive-statistics-and-graphics
# more info on graphs: https://www.programmingr.com/statistics/how-to-plot-categorical-data-in-r/
