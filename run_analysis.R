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

features_data <- read.table(features)
activity_labels_data <- read.table(activity_labels)

#Assign the names here
colnames (subject_train_data) <- "Subject"
colnames (y_train_data) <- "Activity"
colnames (x_train_data) <- features_data[,2]

colnames (subject_test_data) <- "Subject"
colnames (y_test_data) <- "Activity"
colnames (x_test_data) <- features_data[,2]

# This is the dataset with all data
all_data <- rbind(cbind(subject_test_data, x_test_data, y_test_data)
                  ,cbind(subject_train_data, x_train_data, y_train_data))


#Step 2. Extracts only the measurements on the mean and standard deviation for each measurement

# Get the indexes where "mean" or "std" says. Use a regular expresion
# line sample form file: fBodyGyro-mean()-Z
mean_std_indexes <- grep("mean\\(\\)|std\\(\\)", features_data[[2]])

#Get the data related to mean and std using the previously collected indexes
filtered_data <- all_data[, mean_std_variables]

#Step 3. Uses descriptive activity names to name the activities in the data set
#sample:
#  V1                 V2
#1  1            WALKING
colnames(activity_labels_data) <- c("Activity", "Activity Type")
#filtered_data[[2]] <- factor(filtered_data[[2]], levels = activity_labels_data[[1]], labels = activity_labels_data[[2]])
filtered_data_with_activity_names <- merge(filtered_data,activity_labels_data,by="Activity", all.x = TRUE)
#Step 4: Appropriately labels the data set with descriptive variable names.
# Names are here


#Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
filtered_data_with_names <- aggregate(. ~Subject+~Activity,filtered_data,mean)
write.table(filtered_data_with_names, "filtered_data_with_names_2.txt", row.name=FALSE)