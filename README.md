# GetDataCourseProject
Data Science Specialization
Course 3: Getting and Cleaning Data
Course Project
Fausto Martín López

## Functionality

As instructed in the course project, the script included, run_analysis.R, does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Requisites

In order to function properly, the script requires that you have downloaded and extracted the Samsung data for the project in a subfolder named "UCI HAR Dataset" in the workspace.

## Running the script

To run the script, just execute/source it. It doesn't require loading any extra libraries.

## Result

The scripts generates a tidy dataset in a flat file with the name "tidyDataSet.txt" in the subfolder "UCI HAR Dataset".
This file contains one row for each activity and subject pair and columns for subject, activity and the features that were a mean or standard deviation metric.

## Process

1. Read common data for both training and test datasets:
	a. Features related to mean and standard deviations (ids and names)
	b. Activities (ids and names)

2. Read Test and Training datasets sequentially , doing for both:
	a. Read desired features (mean and standard deviation)
	b. Assign proper names to variables
	c. Read and assign activities
	d. Read and assign subjects

3. Merge Test and Training datasets

4. Reshape merged dataset by activity and subject:
	a. Melt
	b. DCast calculating the mean

5. Write tidy dataset to file-system
