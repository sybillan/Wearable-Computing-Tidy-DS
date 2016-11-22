# Wearable-Computing-Tidy-DS
Respository for final assignment on getting and cleaning data for R

# Assignment Objectives
Purpose of this project is to demonstrate the ability to collect, work with, and clean a data set.

# Goals
-The submitted data set is tidy.    

-The Github repo contains the required scripts.

-GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

-The README that explains the analysis files is clear and understandable.

The goal is to prepare tidy data that can be used for later analysis.


# Data Sources

About the experiment source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Actual Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


In the r script, the code merges the training and the test sets to create one data set. It extracts only the measurements on the mean and standard deviation for each measurement using grep. The descriptive activity labels have been used to name the activities in the data set
and similarly performed for variable names. At the end, an independent tidy data set is written into with the average of each variable for each activity and each subject.

