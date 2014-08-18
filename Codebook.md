 Codebook for run_analysis.R\
\
Author: Monica Ransom\
\
###Description\


 The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.\'a0 \
### Source Data\
A full description is available at the site where the data was obtained\

 "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" \
\
###Dataset used for analysis\

"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" \
\
###Dataset Information\
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. \
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. \
\
For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 

- An identifier of the subject who carried out the experiment.\

##run_analysis.R\

##import the data into R\
This reads each of the datasets into R using read.csv\
##add column names to the data\
This adds PATIENT and EXERCISE column names to previously unnamed data as well as labeling the remainder of the columns with the names provided in feature_names.txt\
##merge data sets\
This binds the datasets together into one data frame called data\

##Extract only columns dealing with standard deviation and mean\
I choose to pull all columns with any reference to std, mean, Std, Mean to be complete in addressing the question.  This left me with 81 columns of data in the variable dataset1\
\
##to rename the activities with appropriate names\
Used the given names in activitie_labels.txt to replace the number designations in the data files.  These names are human readable and much more user friendly than previous labels\
\
##To clean up column names\
I substituted freq for f and time for t to make the column names more reader friendly I felt that the slightly longer names were more meaningful while still short enough to not make the column size unwieldy.  I felt as though the rest of the names were descriptive enough for the average person to read.\
\
##Create a second set of data dataset2 with the avg of each variable for each person\
I used the data set we built and used melt and dcast to obtain the averaged dataset requested.
\

\
}