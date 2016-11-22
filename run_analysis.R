library(reshape2)
library(plyr)

# unzipping archive files in Downloads folder
setwd("C:/Users/admin/Downloads/")  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Loading activity and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activitylabel","activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names=c("index","featurelabels"))
#Changing to character type
activityLabels$activity <- as.character(activityLabels$activity)
features$featurelabels <- as.character(features$featurelabels)

#Reading subject ids for test and train
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))
#Combine subjects in train and test sets into single data frame
subject_all <- rbind(subject_train, subject_test)

#Read in features data for test and train. 
features_test <- read.table("UCI HAR Dataset/test/X_test.txt")
features_train <- read.table("UCI HAR Dataset/train/X_train.txt")
#Combine training and test data for features into single data frame
features_all <- rbind(features_test, features_train)

#Read in features labels for mean and std alone using grep for indexing
meanstd<- grep(".*mean.*|.*std.*", features$featurelabels)
index.names <- features[meanstd,2]
#Verifying extraction of mean and std labels
index.names
#Subsetting feature values to mean() and std() labels
colnames(features_all)<-features$featurelabels
featuresubset<-features_all[,index.names]


#Read in activity data for test and train. 
activity_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
activity_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
#Combine training and test data for features into single data frame
activity_all <- rbind(activity_test, activity_train)
colnames(activity_all)<-"activitylabel"
activity_all<-join(activity_all,activityLabels,by="activitylabel")

# merge 
superset <- cbind(subject_all, activity_all,featuresubset)

molten <- melt(superset, id = c("Subject", "activity"))
molten2 <- dcast(molten, Subject + activity ~ variable, mean)

#Output file
write.table(all.data.wide,file="tidy_dataset.txt") 
