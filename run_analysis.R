"R script to load, collect and clean the UCI human activity
 recognition using smartphones data as per the getting and
 cleaning data course by JHU on coursera.
 =========================================================
 Author : Tanmay Shishodia
 ========================================================="

"Load the required libraries"
library(data.table)
library(dplyr)

"Download the data .zip file"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./UCI HAR Dataset.zip")
unzip("./UCI HAR Dataset.zip")

"Set working directory"
setwd("./UCI HAR Dataset")

"Load feature names to give descriptive names to variables"
features <- fread("features.txt", header = FALSE)

"Load training dataset"
X_train <- fread("./train/X_train.txt")
names(X_train) <- features$V2 
y_train <- fread("./train/y_train.txt")
subject_train <- fread("./train/subject_train.txt")
train_set <- cbind(subject_train, y_train, X_train)

"Load test dataset"
X_test <- fread("./test/X_test.txt")
names(X_test) <- features$V2
y_test <- fread("./test/y_test.txt")
subject_test <- fread("./test/subject_test.txt")
test_set <- cbind(subject_test, y_test, X_test)

"Merge training and test datasets"
total <- rbind(train_set, test_set)
names(total)[1:2] <- c("SubjectNum", "Activity")

"Load activity labels to describe activities instead of numbers for better understanding"
activity_labels <- fread("activity_labels.txt")
total$Activity <- as.factor(total$Activity)
levels(total$Activity) <- activity_labels$V2

"Make column names unique (for select function to work)"
names(total) <- make.unique(names(total))

"Extract only the measurements on the mean and standard deviation"
total <- select(total, grep("SubjectNum|Activity|mean\\(\\)|std\\(\\)", names(total)))

"Group by subject number and type of activity and calculate mean on that"
tidy_set <- total[, lapply(.SD, mean) , by = .(SubjectNum, Activity)]

"Arrange data by subject number"
tidy_set <- arrange(tidy_set, SubjectNum)
View(tidy_set)


