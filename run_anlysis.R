#Download the data in the working directory and unzip
library(dplyr)
path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")

#IMPORT ALL THE DATA
#save the train and test data and labels into variables.
train_data <- read.table(file.path(path, "UCI HAR Dataset/train/X_train.txt"), header = FALSE)
train_labels <- read.table(file.path(path, "UCI HAR Dataset/train/y_train.txt"),col.names = c("Activity"), header = FALSE)
train_subject <- read.table(file.path(path, "UCI HAR Dataset/train/subject_train.txt"),col.names = c("SubjNum"), header = FALSE)
test_data <- read.table(file.path(path, "UCI HAR Dataset/test/X_test.txt"),header = FALSE)
test_labels <- read.table(file.path(path, "UCI HAR Dataset/test/y_test.txt"), col.names = c("Activity"),header = FALSE)
test_subject <- read.table(file.path(path, "UCI HAR Dataset/test/subject_test.txt"),col.names = c("SubjNum"), header = FALSE)

#save the activity labels and the features in variables
activityLabels <- read.table(file.path(path, "UCI HAR Dataset/activity_labels.txt"), col.names = c("classLabels", "activityName"))
features <- read.table(file.path(path, "UCI HAR Dataset/features.txt"), col.names = c("index", "featureNames"))

# 1. Merges the training and the test sets to create one data set.
DB_ALL <- rbind(test_data,train_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
featuresNeeded <- grep("(mean|std)\\(\\)", features$featureNames)
DB_mean_std <- DB_ALL[,featuresNeeded]

#3. Uses descriptive activity names to name the activities in the data set
DB_mean_std <- cbind(rbind(test_labels,train_labels),DB_mean_std)
DB_mean_std$Activity <- factor(DB_mean_std$Activity, levels = activityLabels$classLabels, labels = activityLabels$activityName)   

# 4. Appropriately labels the data set with descriptive variable names.
variables<- features[featuresNeeded,]$featureNames
variables <- gsub('[()]', '', variables)
names(DB_mean_std)[2:67] <- variables

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
DB_mean_std <- cbind(rbind(test_subject ,train_subject),DB_mean_std)
names(DB_mean_std)[1] <- "Subject"
DB_mean_std <- DB_mean_std %>% group_by(Subject,Activity) %>% summarise_each(mean)
write.table(DB_mean_std,file="tidy_data.txt",row.names = FALSE)
