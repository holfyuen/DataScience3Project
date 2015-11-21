Codebook for Getting and Cleaning Data Course Project.

Raw data: X_test.txt and X_train.txt are test and train data collected (with 561 variables), features.txt contains the column headers of test and train data, subject_test.txt and subject_train.txt contain identifiers (1-30) of subjects, y_test.txt and y_train.txt contain identifiers (1-6) of activities. activity_labels.txt matches 1-6 to names of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

Firstly, the codes merges the training and the test sets to create one data set, extracts mean and standard deviation for each measurement (total 66 variables), uses descriptive activity names (instead of numbers) to name the activities in the data set, and labels the data set with descriptive variable names. Then the codes create another tidy data set with the average of each variable for each activity and each subject.

Codebook: First two variables are Subject and Activity Label. The other 66 variables are means of each variable in the merged data set, grouped by Subject and Activity Label.

