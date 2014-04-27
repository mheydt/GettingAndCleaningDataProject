# readme.md

The "run_analysis.R" file performs a task of making a tidy data set out of the Human Activity Recognition Using Smartphones Dataset.

It is worth noting that this script uses the Plyr package, so make sure that is installed before running

The script reads the following files from the data set:

* activity_labels.txt
* features.txt
* subject_train.txt
* subject_test.txt
* X_train.txt
* Y_train.txt
* X_test.txt
* Y_test.txt

From that data, the mean and standard deviation variables are extracted and summarized by subject and activity, and written to the "averages_by_subject_and_activity.txt" file, which is an R table written to a file.

Please refer to the script for detailed description on how the data is processed, but in a nutshell the following steps are performed:

* Rename several of the columns in the data sets, for convenience of understanding the code
* Merge together the test and train data sets (subject and y_* files)
* Then merge the y_* files into the test data
* Join the activity labels data into the data set, to have descriptive names for the activities instead of a simple integer
* The features table is searched for labels with "mean" and "std", extracting the labels for each, and merged to a single table
* A numeric feature column is added to facilitate sorting, 
* Only those columns representing mean and std are extracted from the original data
* The columns are then renamed to descriptive labels
* Plyr is then used to summarize the columns by subject and activity
* And the result is written to averages_by_subject_and_activity.txt
