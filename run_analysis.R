#Data is stored in this location:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download the data
# This will create a file called data.zip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")

#This will unzip the data into the UCI HAR Dataset folder
unzip("data.zip")

#Run this if you don't have dplyr
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

features_data <- read.table(features)
activity_labels_data <- read.table(activity_labels)

#Assign the names here
# Tip: Better to do this at the beginning than later 
colnames (subject_train_data) <- "Subject"
colnames (y_train_data) <- "Activity"
colnames (x_train_data) <- features_data[,2]

colnames (subject_test_data) <- "Subject"
colnames (y_test_data) <- "Activity"
colnames (x_test_data) <- features_data[,2]

test_data <- cbind(subject_test_data, x_test_data, y_test_data)
train_data <- cbind(subject_train_data, x_train_data, y_train_data)

# This is the dataset with all data
all_data <- rbind(test_data , train_data)

#labels
colnames(activity_labels_data) <- c("Activity", "ActivityType")

#Step 2. Extracts only the measurements on the mean and standard deviation for each measurement

# Get the indexes where "mean" or "std" says. Use a regular expresion
# line sample form file: fBodyGyro-mean()-Z
columnas <- colnames(all_data)
#Get the data related to mean and std using a pattern
# Because I added the Subject and Activity columns before. I need to include them in the filter
filtered_data <- all_data[, grep("Subject|Activity|*mean*|*std*", columnas)]

#Step 3. Uses descriptive activity names to name the activities in the data set
#sample:
#  V1                 V2
#1  1            WALKING
#let's make a "join"
filtered_data_with_activity_names <- merge(filtered_data,activity_labels_data,by="Activity", all.x = TRUE)

#Step 4: Appropriately labels the data set with descriptive variable names.
#Did this on Step 1. The all_data dataset already has the labels. It was easier to do it at the beginning than later.

#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# We need to aggregate the data with mean

aggregated_data <- aggregate(.~Subject+ActivityType,filtered_data_with_activity_names,mean)
write.table(aggregated_data, "aggregated_data.txt", row.name=FALSE)
