# Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.
This is the final project of the Getting and Cleaning Data Course Project on Coursera.

This file explains how all of the scripts work and how they are connected.
The original data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Goal of the Project
The goal of the project is to create:
1. A tidy data set 
2. A link to a Github repository with the script for performing the analysis 
3. A code book that describes the variables, the data, and any transformations or work that has been performed to clean up the data called CodeBook.md.
4. Analysis R Script

## Review Criteria
1. The tidy_data is the final results at the end of the scripts. It creates a second, independent tidy data set with the average of each variable for each activity and each subject.

2. In this repository all the file are saved

3. The codebook describes the variables, the data, and any transformations or work that has been performed to clean up the data

4. The script does the following
un_analysis.R that does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files that have been used
- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

