# This script will show you how to perform the following correlations using
# the "marathon.csv" dataset:
#   - Pearson
#   - Point-Biserial

###################

# Import 'marathon.csv' using read.csv() and name it 'marathon':
marathon <- read.csv("insert pathway to file w/ forward slashes/marathon.csv")

# View structure of 'marathon' using str():
str(marathon)

# Ensure each variable is in the correct data structure.
# (Note that they may already be in the correct data structure):
marathon$PARTICIPANT_ID <- as.factor(marathon$PARTICIPANT_ID)
marathon$AGE <- as.integer(marathon$AGE)
marathon$HEIGHT <- as.numeric(marathon$HEIGHT)
marathon$WEIGHT <- as.numeric(marathon$WEIGHT)
marathon$GENDER <- as.factor(marathon$GENDER)
marathon$CLASS <- ordered(marathon$CLASS, levels =
                            c("firstyear",
                              "sophomore",
                              "junior",
                              "senior"))  # ordinal variable

# Confirm that each variable is in correct data structure:
str(marathon)

# It should look like this in the console:

#'data.frame':	20 obs. of  6 variables:
#  $ PARTICIPANT_ID: Factor w/ 20 levels "1001","1002",..: 18 10 11 16 3 2 20 5 8 4 ...
#  $ AGE           : int  21 22 18 22 21 21 18 23 21 20 ...
#  $ HEIGHT        : num  68.1 67.7 67.4 67.3 67 ...
#  $ WEIGHT        : num  189 170 192 161 155 ...
#  $ GENDER        : Factor w/ 2 levels "man","woman": 1 1 1 1 2 1 1 1 2 1 ...
#  $ CLASS         : Ord.factor w/ 4 levels "firstyear"<"sophomore"<..: 1 3 2 4 4 1 3 3 4 4 ...


# Use cor.test() to run Pearson correlation between WEIGHT and HEIGHT
#   the cor.test() function structure:
#                                       cor.test(x variable,
#                                                y variable,
#                                                method = "pearson",
#                                                         "kendall",
#                                                         "spearman")
cor.test(marathon$WEIGHT,
         marathon$HEIGHT,
         method = "pearson")

# You should see something like this in the console:

#   Pearson's product-moment correlation

#   data:  marathon$WEIGHT and marathon$HEIGHT
#   t = 1.1163, df = 18, p-value = 0.279
#   alternative hypothesis: true correlation is not equal to 0
#   95 percent confidence interval:
#   -0.2119347  0.6264345
#   sample estimates:
#         cor 
#   0.2544498 


# Use cor.test() to run a Point-Biserial correlation between HEIGHT and GENDER

# First, check out the marathon$GENDER variable
marathon$GENDER # man, woman
            
# Note that GENDER is a factor. We need to convert it into a new integer
# variable such that man = 1 and woman = 0. The level that goes after ==
# is the level = 1. Name this new variable GENDER_NUM and add it to the
# 'marathon' dataset:
marathon$GENDER_NUM <- as.integer(marathon$GENDER == "man")
        
# Confirm that GENDER_NUM is an integer in 'marathon'
str(marathon$GENDER_NUM)

# Now we can run a Point-Biserial correlation between HEIGHT and GENDER_NUM.
# Remember that a Point-Biserial correlation is just a Pearson correlation
# between a continuous variable and a dichotomous variable:
cor.test(marathon$HEIGHT,
         marathon$GENDER_NUM,
         method = "pearson")

# You should see something like this in the console:  

#   Pearson's product-moment correlation

#   data:  marathon$HEIGHT and marathon$GENDER_NUM
#   t = 2.3778, df = 18, p-value = 0.0287
#   alternative hypothesis: true correlation is not equal to 0
#   95 percent confidence interval:
#   0.05918983 0.76575428
#   sample estimates:
#       cor 
#   0.4889049 


