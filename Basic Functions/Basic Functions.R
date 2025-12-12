# In this script, you will conduct basic functions using the 'data.csv'
# dataset, including:
#   - Import and view dataset
#   - View variable type in dataset
#   - Reformat variable types
#   - View first and last few rows of dataset
#   - Remove variable(s) in dataframe
#   - Renaming objects and removing objects in Environment

###################

# Import 'data.csv' and name it 'data'
data <- read.csv("file/path/to/data.csv")

# View variable types in 'data' using str() function
str(data)

# It should look something like this in the console:

#     'data.frame':	8 obs. of  4 variables:
#     $ participant: int  1 2 3 4 5 6 7 8
#     $ score      : int  76 92 45 78 34 66 89 67
#     $ rank       : chr  "associate" "assistant" "full" "associate"
#     $ salary     : num  "92372" "88938" "103828" "90375"

# View variable type of a single variable
str(data$participant) # integer

# Reformatting variable type #

# Change participant variable from integer (int) to factor
data$participant <- as.factor(data$participant)

# Change rank variable from character (chr) to factor
data$rank <- as.factor(data$rank)

# Change salary variable from character (chr) to numeric
data$salary <- as.numeric(data$salary)

# Now re-check variable types in 'data'
str(data)

# It should now look something like this:

#   'data.frame':	8 obs. of  4 variables:
#    $ participant: Factor w/ 8 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8
#    $ score      : int  76 92 45 78 34 66 89 67
#    $ rank       : Factor w/ 3 levels "assistant","associate",..: 2 1 3 2 1 2 1 3
#    $ salary     : num  92372 88938 103828 90375 103777 ...

# More info about various data structures in R can be found here:
# https://statsandr.com/blog/data-types-in-r/


# Print first 6 rows of 'data' in console using head() function
head(data)

# Print last 6 rows of 'data' in console using tail() function
tail(data)

# Remove a column from 'data'
data$column_name <- NULL

# Remove multiple columns from 'data'
data <- data[, -c(1, 3)] # Removes the 1st and 3rd columns from 'data'

# Remove object from environment panel
name_of_object <- NULL

# Rename 'data' to 'mydata' using as.data.frame() function
mydata <- as.data.frame(data)

# If a dataframe is in another format other than a dataframe and
# you want it to be in dataframe format, use the as.data.frame() function
data <- as.data.frame()
