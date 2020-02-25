#Data is stored in this location:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Download the data
# This will create a file called data.zip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")

#This will unzip the data into the UCI HAR Dataset folder
unzip("data.zip")

