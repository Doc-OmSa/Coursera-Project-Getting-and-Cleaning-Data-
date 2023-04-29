# Coursera-Project-Getting-and-Cleaning-Data
This repository contains the R script "run_analysis.R" that downloads and processes the 
"Human Activity Recognition Using Smartphones" dataset to create a tidy dataset. 
The dataset consists of the recordings of 30 subjects performing activities of daily living 
while carrying a waist-mounted smartphone with embedded inertial sensors.

# Data for the Project
The data used for this project can be downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Contents
The repository contains the following files:

# README.md: This file

# CodeBook.md: The codebook file that describes the variables, the data, and any 
transformations or work that was performed to clean up the data

# run_analysis.R: The R script that performs the data cleaning process and outputs the tidy dataset

# tidy.txt: The tidy dataset created by the R script

# Instructions
To reproduce the tidy dataset, please follow these instructions:

 Download the dataset from the above link and extract it to a local directory
Set the working directory to the root directory of the extracted dataset using setwd()
Run the R script "run_analysis.R". This will produce the tidy dataset "tidy.txt" in the 
working directory.

#Codebook
The codebook file "CodeBook.md" describes the variables, the data, and any transformations or 
work that was performed to clean up the data. Please refer to this file for more information.

Methodology
The "run_analysis.R" script performs the following steps to create the tidy dataset:

Reads the test and train data and merges them into one dataset
Extracts only the measurements on the mean and standard deviation for each measurement
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Output
The output of the "run_analysis.R" script is a tidy dataset called "tidy.txt" that contains the 
average of each variable for each activity and each subject. The dataset is tidy because each 
variable is in a separate column, each observation is in a separate row, and there is only one 
type of observational unit.

Dependencies
The R script "run_analysis.R" requires the following packages to be installed:

tidyverse
data.table
reshape2

# Credits
The "Human Activity Recognition Using Smartphones" dataset was collected by Jorge L. Reyes-Ortiz, 
Davide Anguita, Alessandro Ghio, and Luca Oneto from the University of Genoa. More information 
about the dataset can be found at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
