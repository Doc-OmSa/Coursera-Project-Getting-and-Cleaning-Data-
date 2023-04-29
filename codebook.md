---
title: "COURSE 3 GETTING AND CLEANING DATA"
author: "Doc OmSa"
date: "`r Sys.Date()`"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# Course Project: Getting and Cleaning Data

In this project, we will work with the ["Human Activity Recognition Using Smartphones"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset, which contains data collected from the accelerometers from the Samsung Galaxy S smartphone.

## Data

The dataset can be downloaded from the following link:

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## R Script

The R script for this project is called `run_analysis.R`. It does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Required Libraries

Before running the script, make sure to install and load the following libraries:

* `tidyverse`
* `data.table`
* `reshape2`


### Step 1: Merging the Data

The script reads in the test and train data files and merges them into one dataset using `rbind`.

test_files <- list.files("./data/couse3project/test/", full.names = TRUE)
test_data <- lapply(test_files, fread)
test_data <- bind_rows(test_data, .id = "id")
test_data$id <- gsub(".txt", "", test_data$id)
test_data$id <- as.numeric(test_data$id)

train_files <- list.files("./data/couse3project/train/", full.names = TRUE)
train_data <- lapply(train_files, fread)
train_data <- bind_rows(train_data, .id = "id")
train_data$id <- gsub(".txt", "", train_data$id)
train_data$id <- as.numeric(train_data$id)

merged_data <- rbind(test_data, train_data)


### Step 2: Extracting Mean and Standard Deviation Measurements

We only keep the measurements for the mean and standard deviation using `grep`.

mean_std_cols <- grep("mean\(\)|std\(\)", names(merged_data))
mean_std_cols <- c(mean_std_cols, c(562, 563)) # Include activity and subject columns

merged_data <- merged_data[, mean_std_cols]

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


