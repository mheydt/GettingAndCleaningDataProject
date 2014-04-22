# using plyr as it's joins are real nice
# and helps with keeping ordering
# I make sure the subject*, y_*, and x* files are kept in the same order
# and the original data says these are in sequence
# Technically, I don't think the structure of that data is very good,
# as there should be a sequence # in the y_* and x_* for all obervations.
# I could add it in here, but it's not needed to get the tidy set we want
library(plyr)

# read in all needed data
activity_labels <- read.table("data/activity_labels.txt")
features <- read.table("data/features.txt")
subject_train <- read.table("data/train/subject_train.txt")
subject_test <- read.table("data/test/subject_test.txt")
x_train <- read.table("data/train/X_train.txt")
y_train <- read.table("data/train/Y_train.txt")
x_test <- read.table("data/test/X_test.txt")
y_test <- read.table("data/test/Y_test.txt")

# do some renaming for convieniece
names(activity_labels) <- c("Activity.ID", "Activity.Description")
names(y_test) <- c("Activity.ID")
names(subject_test) <- c("Subject.ID")
names(y_train) <- c("Activity.ID")
names(subject_train) <- c("Subject.ID")

# merge together all the test and training data
all_subjects <- rbind(subject_test, subject_train)
all_y <- rbind(y_test, y_train)

# do merging of y_test, subject_test, and descriptive activity name
# plyr is nice as it does not reorder through the join
# when done, subject_y_joined data frame is three nicely named columns
# of combined data from subject_[test|train], y_[test|train], and the correct 
# descriptive activity label
subject_y_binded <- cbind(all_subjects, all_y)
subject_y_joined <- join(subject_y_binded, activity_labels)

# now, we need to merge in the x_[test|train data], but only thise columns
# that are means or standard deviations

# do some munging of the features set 
# now extract features with "mean" and "std" in their names
features_mean <- features[grep("mean", features$V2),]
features_std <- features[grep("std", features$V2),]

# make one list of features (combined mean and std)
features_all = rbind(features_mean, features_std)
# add a numeric feature id field based off of V1, so that we can sort correctly
features_all$Feature.ID <- as.numeric(as.character(features_all$V1))

# I found this out late in the project: () in the column names causes issues in reloading
# so I'm going to strip them before renaming
# all this is so I can do equivalence of the written data to that in memory
features_all$Cleaned.Name = gsub("-", ".", gsub("\\(\\)", "", as.character(features_all$V2)))
# hyphens suck too: they get made into '.' when writing to the file

# order by Feature.ID
# after this we have a nice list of features that can be used later to select columns from the larger data set
features_all <- features_all[order(features_all$Feature.ID),]
  
# concat the x_test and x_train, but only columns with mean or std
# the whole point of the as.numerid Feature.ID is so we can extract these
all_x <- rbind(x_test, x_train)[,features_all$Feature.ID]

# all_x now have 10299 records, with just the needed columns (but they are still named V*)
# so let's rename them
names(all_x) <- features_all[as.factor(features_all$Feature.ID),c("Cleaned.Name")]

# Now we have nice descripting column names!

# one last thing to do: combine subject_y_joined and all_x
all_gathered <- cbind(subject_y_joined, all_x)

# all done!  Let's verify
# 1. Merges the training and the test sets to create one data set.
#     Yep
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#     Yep, extracted from features.txt, and used to filter, and rename
# 3. Uses descriptive activity names to name the activities in the data set
#     Yep, added column names
# 4. Appropriately labels the data set with descriptive activity names. 
#     Yep, activities looked up from the labels
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#     Yep

#write.table(all_gathered, "all_gathered.txt")

# let's do a little check: load it back in, and check it

#reloaded <- read.table("all_gathered.txt")
#head(reloaded)

# calculate averages based upon grouping on Subject.ID and Activity.Description
averages_by_subject_and_activity <- ddply(
  all_gathered, 
  .(Subject.ID, Activity.Description), 
  function (f){ colMeans(f[,c(4:dim(f)[2])])})

# write the summarizations
write.table(averages_by_subject_and_activity, "averages_by_subject_and_activity.txt")
