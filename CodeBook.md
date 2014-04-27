# Codebook for "averages_by_subject_and_activity.txt"

To view the data in the file, load it with 
* read.table("averages_by_subject_and_activity.txt")

I have provided a script "load_result.R" which will do this for you.

The data set contains the following 81 variables:

* Subject.ID

The id of the subject from the subject_test.txt and subject_train.txt files.  It is simply an integer that represent a subject under observation.  There are no mappings of the integer to a more descriptive name of the subject.

* Activity.Description

For each subject, there are a number of activities that are measured.  These are pulled from the original activity_labels.txt file and provided instead of an integer activity value for human convenience

The remaining variables are pulled from the x_test.txt and x_train.txt files, and are the calculated averaage of the values in those files grouped by subject id and activity.  For more info please refer to the original data sets features_info.txt file which I have provided.

* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.mean
* tBodyAccMag.std
* tGravityAccMag.mean
* tGravityAccMag.std
* tBodyAccJerkMag.mean
* tBodyAccJerkMag.std
* tBodyGyroMag.mean
* tBodyGyroMag.std
* tBodyGyroJerkMag.mean
* tBodyGyroJerkMag.std
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAcc.meanFreq.X
* fBodyAcc.meanFreq.Y
* fBodyAcc.meanFreq.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyAccJerk.meanFreq.X
* fBodyAccJerk.meanFreq.Y
* fBodyAccJerk.meanFreq.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyGyro.meanFreq.X
* fBodyGyro.meanFreq.Y
* fBodyGyro.meanFreq.Z
* fBodyAccMag.mean
* fBodyAccMag.std
* fBodyAccMag.meanFreq
* fBodyBodyAccJerkMag.mean
* fBodyBodyAccJerkMag.std
* fBodyBodyAccJerkMag.meanFreq
* fBodyBodyGyroMag.mean
* fBodyBodyGyroMag.std
* fBodyBodyGyroMag.meanFreq
* fBodyBodyGyroJerkMag.mean
* fBodyBodyGyroJerkMag.std
* fBodyBodyGyroJerkMag.meanFreq