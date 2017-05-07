setwd("/Users/user/DataScienceCoursera") ## Set working directory
library(dplyr) ## Load dplyr package for use later in the script
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip") ## Download file and save as dataset.zip
    unzip("dataset.zip") ## Unzip file
setwd("/Users/user/DataScienceCoursera/UCI HAR Dataset") ## Set working directory to one of the folders in the newly unzipped file
  testlab <- read.table("test/y_test.txt") ## The next eight lines create tables from the necessary files in the working directory
  trainlab <- read.table("train/y_train.txt")
  testset <- read.table("test/X_test.txt")
  trainset <- read.table("train/X_train.txt")
  subtrain <- read.table("train/subject_train.txt")
  subtest <- read.table("test/subject_test.txt")
  activity_labels <- read.table("activity_labels.txt")
  features <- read.table("features.txt")
    feature_labels <- as.vector(features$V2) ## Convert to vector the values in variable V2 of the features table and assign to feature_labels. 
  colnames(trainset) <- feature_labels ## Assign feature_labels vector as the variable names of the training and test datasets
  colnames(testset) <- feature_labels
testset2 <- testset[grepl("-mean\\(\\)|-std\\(\\)", names(testset))] ## Subset training and test datasets to variables containing mean() or std().
trainset2 <- trainset[grepl("-mean\\(\\)|-std\\(\\)", names(trainset))]
colnames(trainlab)[1] <- "Activity" ## Assign Activity and Subject to the variable names in vectors for the type of activity being performed and the subject performing the activity
colnames(subtrain)[1] <- "Subject"
colnames(testlab)[1] <- "Activity"
colnames(subtest)[1] <- "Subject"
train_data <- cbind(subtrain, trainlab, trainset2) ## Combine the activity, subject, and training datasets
test_data <- cbind(subtest, testlab, testset2) ## Combine the activity, subject and test datasets
all_data <- rbind(train_data, test_data) ## Combine the training and test datasets
all_data$Activity <- factor(all_data$Activity, levels = activity_labels$V1, labels = activity_labels$V2) ## Reassign the numbers indicating the activity with a text descriptor of the activity
names(all_data)<-gsub("^t", "Time", names(all_data)) ## Expand shorthand variable names to be more descriptive.
names(all_data)<-gsub("^f", "Frequency", names(all_data))
names(all_data)<-gsub("Acc", "Accelerometer", names(all_data))
names(all_data)<-gsub("Gyro", "Gyroscope", names(all_data))
names(all_data)<-gsub("Mag", "Magnitude", names(all_data))
new_data <- aggregate(.~Activity+Subject, all_data, mean) ## Create a new dataset that finds the average value for each variable for each activity performed by each subject
write.table(new_data, "stepfive.txt", row.names = FALSE) ## Save the new dataset as a text file