COURSE PROJECT GETTING AND CLEANING DATA

## Data for the project:

#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

# You should create one R script called run_analysis.R that does the following.  

# Merges the training and the test sets to create one data set.

# Extracts only the measurements on the mean and standard deviation for each measurement. 

# Uses descriptive activity names to name the activities in the data set

# Appropriately labels the data set with descriptive variable names. 

# From the data set in step 4, creates a second, independent tidy data set 
#      with the average of each variable for each activity and each subject.

#########################################################################################

library(tidyverse)
library(data.table)
library(reshape2)

# Read in test data
test_files <- list.files("C:/Users/USER/Documents/R WORKING DIRECTORY/data/couse3project/test/", full.names = TRUE)
test_data <- lapply(test_files, fread)
test_data <- bind_rows(test_data, .id = "id")
test_data$id <- gsub(".txt", "", test_data$id)
test_data$id <- as.numeric(test_data$id)

# Read in train data
train_files <- list.files("C:/Users/USER/Documents/R WORKING DIRECTORY/data/couse3project/train/", full.names = TRUE)
train_data <- lapply(train_files, fread)
train_data <- bind_rows(train_data, .id = "id")
train_data$id <- gsub(".txt", "", train_data$id)
train_data$id <- as.numeric(train_data$id)

merged_data <- rbind(test_data, train_data)

# Extract column indices for mean and standard deviation measurements
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", names(merged_data))
mean_std_cols <- c(mean_std_cols, c(562, 563)) # Include activity and subject columns


allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)

# turn activities & subjects into factors
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

# for mean

mean(allData.melted$value)

# for std dev

sd(allData.melted$value)


################################################################################