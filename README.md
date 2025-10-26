# Getting and Cleaning Data Project
 Author: Georg Hofer

## Goal of the Project
The purpose of this project is to demonstrate the ability to collect, clean, and prepare data for analysis. The final output is a tidy dataset that summarizes measurements from the Human Activity Recognition Using Smartphones dataset.

## What the Analysis Script Does
1. Merges the training and test datasets.
2. Extracts only the measurements on the mean and standard deviation.
3. Uses descriptive activity names.
4. Labels the variables appropriately.
5. Creates a tidy dataset with averages of each variable for each activity and subject.

## How to Run the Script
Download the dataset and place the 'UCI HAR Dataset' folder in your working directory.
Place the file 'run_analysis.R' in the same directory.
Run the script in R: source("run_analysis.R")
The file 'tidyData.txt' will be generated in your working directory.
