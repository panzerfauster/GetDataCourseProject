# Data Science Specialization
# Course 3: Getting and Cleaning Data
# Course Project
# Fausto Martín López

### This code works with data in order prepare a tidy data set that can be used for later analysis.
### The Samsung data for the project should be available in a subfolder named "UCI HAR Dataset" in the workspace.



library(reshape2)



## Read common data

# Read Features names to use
featuresNames <- read.table("UCI HAR Dataset/features.txt")
featuresNames <- featuresNames[grepl("-mean()",featuresNames$V2,fixed=TRUE)|grepl("-std()",featuresNames$V2,fixed=TRUE),c(1,2)]
colnames(featuresNames) <- c("id", "name")

# Read Activities names
activitiesNames <- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activitiesNames) <- c("id", "name")



## Read Test data set

# Read Features
features <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresNames$id]
names(features) <- featuresNames$name
dataSetTest <- features

# Read Activities
activities <- read.table("UCI HAR Dataset/test/y_test.txt")
names(activities) <- "activity"
activities$activity <- factor(activities$activity, levels=activitiesNames$id, labels=activitiesNames$name)
dataSetTest <- cbind(dataSetTest, activities)

# Read Subjects
subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subjects) <- "subject"
dataSetTest <- cbind(dataSetTest, subjects)



## Read Training data set

# Read Features
features <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresNames$id]
names(features) <- featuresNames$name
dataSetTrain <- features

# Read Activities
activities <- read.table("UCI HAR Dataset/train/y_train.txt")
names(activities) <- "activity"
activities$activity <- factor(activities$activity, levels=activitiesNames$id, labels=activitiesNames$name)
dataSetTrain <- cbind(dataSetTrain, activities)

# Read Subjects
subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subjects) <- "subject"
dataSetTrain <- cbind(dataSetTrain, subjects)



## Merge Test and Training datasets
dataSet <- rbind(dataSetTest, dataSetTrain)



## Reshape merged dataset

# Melt
dataSetLong <- melt(dataSet, id=c("activity", "subject"))

# DCast
dataSetWide <- dcast(dataSetLong, activity + subject ~ variable, mean)

# Write tidy dataset
write.table(dataSetWide, "UCI HAR Dataset/tidyDataSet.txt", row.names=FALSE, quote=FALSE)
