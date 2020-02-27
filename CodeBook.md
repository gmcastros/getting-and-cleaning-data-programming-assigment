#Getting and Cleaning Data Programming Assesment

#Code Book
The activities required are:
    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
#Variables:
The following variables contain the data from the downloaded files.
_subject_train_data_
_x_train_data_
_y_train_data_
_subject_test_data_
_x_test_data_
_y_test_data_
_features_data_
_activity_labels_data_

_all_data_: This variable contains the merge of the test and train data variables mentioned above.
_filtered_data_: This variable contains the data with only the std and mean variables. Along with the Subject and Activity
_filtered_data_with_activity_names_: This variable add the ActivityType column to the filtered_data variable.
_aggregated_data_: This variable has the data with the average of each variable grouped by Subject and ActivityType.

#File:
_aggregated_data.txt_: This one contains the result of the aggregation which is Step 5.
