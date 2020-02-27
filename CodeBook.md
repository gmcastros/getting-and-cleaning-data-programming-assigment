Getting and Cleaning Data Programming Assesment

Code Book
The activities required are:
    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
Variables:
The following variables contain the data from the downloaded files.
subject_train_data
x_train_data
y_train_data
subject_test_data
x_test_data
y_test_data

features_data
activity_labels_data

all_data: This variable contains the merge of the test and train data variables mentioned above.
filtered_data: This variable contains the data with only the std and mean variables. Along with the Subject and Activity
filtered_data_with_activity_names: This variable add the ActivityType column to the filtered_data variable.
aggregated_data: This variable has the data with the average of each variable grouped by Subject and ActivityType.

File:
aggregated_data.txt: This one contains the result of the aggregation which is Step 5.
