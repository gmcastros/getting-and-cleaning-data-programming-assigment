#Data is stored in this location:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download the data
# This will create a file called data.zip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")

#This will unzip the data into the UCI HAR Dataset folder
unzip("data.zip")

#Run 
# install.packages("dplyr") 
# install.packages("Rcpp")
# if you don't have the library
library(dplyr)

# File list with names, to make it easier to load them
activity_labels <- "UCI HAR Dataset/activity_labels.txt"
features <- "UCI HAR Dataset/features.txt"
subject_train <- "UCI HAR Dataset/train/subject_train.txt"
y_train <- "UCI HAR Dataset/train/y_train.txt"
x_train <- "UCI HAR Dataset/train/X_train.txt"
subject_test <- "UCI HAR Dataset/test/subject_test.txt"
y_test <- "UCI HAR Dataset/test/y_test.txt"
x_test <- "UCI HAR Dataset/test/X_test.txt"

#Step 1: We need to create a single dataset. For this we need to merge the files:
# train sets
# test sets
subject_train_data <- read.table(subject_train)
y_train_data <- read.table(y_train)
x_train_data <- read.table(x_train)

subject_test_data <- read.table(subject_test)
y_test_data <- read.table(y_test)
x_test_data <- read.table(x_test)

all_data <- rbind(cbind(subject_test_data, x_test_data, y_test_data)
                  ,cbind(subject_train_data, x_train_data, y_train_data))

