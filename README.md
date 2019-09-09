# Getting-and-cleaning-data-JHU-proj
Repo to push the project files according to the Getting and Cleaning data course by JHU on Coursera

## About the dataset
### Human Activity Recognition Using Smartphones Dataset Version 1.0 by UCI

Data set URL : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### What does the script do?

Although the script run_analysis.R has comments at each step indicating how I obtained the required tidy dataset, I will list down
the important steps.

#### Steps
1. Download the data, unzip and set the appropriate working directory.
2. Load the training data. The training set contains the volunteers and the type of activity they performed and their readings in different files. These are column binded first. Similarly column bind the test data.
3. The names of the columns are not descriptive. They are stored in another file(features.txt). Assign these names to the column names of the datasets and give appropriate names to subject number and type of activity columns.
4. Merge the training and test datasets.
5. Type of activity is a number here which isn't very descriptive. Extract the labels from activity_labels.txt, convert activity into a categorical variable and assign the labels to the levels of activity.
6. Select only those columns which contain "mean" or "std" in their name using grep. For select function from dplyr to work you need to remove duplicate column names which can be done using make.unique() function.
7. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
