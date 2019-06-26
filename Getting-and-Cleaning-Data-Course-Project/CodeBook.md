## Code Book : Datascience - Getting and Cleaning Data - Course Project 

This assignment uses data from the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UC Irvine Machine
Learning Repository - Human Activity Recognition Using Smartphones Dataset</a>.

The goal of this project is to prepare tidy data, that can be used for later analysis, by creating one R script called run_analysis.R that does the following.
1/ Merges the training and the test sets to create one data set.
2/ Extracts only the measurements on the mean and standard deviation for each measurement.
3/ Uses descriptive activity names to name the activities in the data set
4/ Appropriately labels the data set with descriptive variable names.
5/ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Source Dataset Information
The dataset used was downloaded from the provided course link. 
* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Human Activity Recognition Using Smartphones</a> [59.6Mb]
* <b>Description</b>: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The zip file contains the following folders and files
    -UCI HAR Dataset/
        -test/
            +Inertial Signals/ (data in this folder not used)
            subject_test.txt
            X_test.txt
            y_test.txt
        -training/
            +Inertial Signals/ (data in this folder not used)
            subject_train.txt
            X_train.txt
            y_train.txt
        activity_labels.txt
        features.txt
        features_info.txt
        README.txt

Please refer to the dataset README.txt file for further information on the source dataset. 


## The run_analysis.R script performs the following steps on the source dataset
 .	Downloads the original zipped dataset to the users working directory, if not already present.
 .	Unzips the downloaded dataset to the users working directory, if not already present.

# 1/ Merges the training and the test sets to create one data set.
 .	The train and test datasets for each group subject (subject_*.txt), activity (y_*.txt) and features (X_*.txt) are combined using rbind.
    Note: Ensure to rbind the files in the same order so as not to mix up the data ie. train then test files.
 .	Column names are then added to each group dataset.
       "subject dataset" column set to "subject".
       "activities dataset" column set to "activity".
       "features dataset" columns loaded from features.txt 
 .	The 3 group datasets are then combined into one dataset using cbind.

# 2/ Extracts only the measurements on the mean and standard deviation for each measurement.
 .	A new dataset is then created by extracting only the subject, activity, *mean() & *std() columns.

# 3/ Uses descriptive activity names to name the activities in the data set
 .	The activity column values are then converted from numbers to descriptive factors using the activity_labels.txt file.

# 4/ Appropriately labels the data set with descriptive variable names.
 .	The column names are then modified to have clear descriptive names, using gsub. 
       t -> time
       f -> frequency domain  
       Acc -> Accelerometer
       Gyro -> Gyroscope
       Mag -> Magnitude
 .	Some of the columns names had duplicate "Body" so these were also fixed.    
       Body-Body -> Body
       
# 5/ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 .	A new summary dataset is then created that has the average of each variable for each activity and each subject, using R functions aggregate and mean.
 .	The column names of the measures where then prefixed with "average-", using paste, to represent that they are now averages.
 .	The new dataset (SubjectActivityAverage.txt) is then written to the users working directory.  

## Dataset description
    The dataset was created with the following versions
        Date of Source file download: "2019-06-26 17:41:32 AEST"
        R version: 3.6.0 (2019-04-26).
        Platform: x86_64-w64-mingw32/x64 (64-bit)(Windows 10 x64 (build 17134)).

    The created data set is SubjectActivityAverage.txt

    Dimensions: 180 rows, 68 columns
    Each row contains the averages of the different measurements for each activity and each subject. 
    The dataset is complete (no missing values)
    
    Columns
        subject: 30 unique id's
        activity : 6 unique factor levels: "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"
    	The remaining 66 colums are numeric averages of the different mean and standard deviation messurement captured for the subject and activity
    	average-time-Body-Accelerometer-mean()-X    			
    	average-time-Body-Accelerometer-mean()-Y    			
    	average-time-Body-Accelerometer-mean()-Z    			
    	average-time-Body-Accelerometer-std()-X     			
    	average-time-Body-Accelerometer-std()-Y     			
    	average-time-Body-Accelerometer-std()-Z     			
    	average-time-Gravity-Accelerometer-mean()-X 			
    	average-time-Gravity-Accelerometer-mean()-Y 			
    	average-time-Gravity-Accelerometer-mean()-Z 			
    	average-time-Gravity-Accelerometer-std()-X  			
    	average-time-Gravity-Accelerometer-std()-Y  			
    	average-time-Gravity-Accelerometer-std()-Z      			
    	average-time-Body-Accelerometer-Jerk-mean()-X   			
    	average-time-Body-Accelerometer-Jerk-mean()-Y   			
    	average-time-Body-Accelerometer-Jerk-mean()-Z   			
    	average-time-Body-Accelerometer-Jerk-std()-X    			
    	average-time-Body-Accelerometer-Jerk-std()-Y    			
    	average-time-Body-Accelerometer-Jerk-std()-Z    			
    	average-time-Body-Gyroscope-mean()-X            			
    	average-time-Body-Gyroscope-mean()-Y            			
    	average-time-Body-Gyroscope-mean()-Z            			
    	average-time-Body-Gyroscope-std()-X             			
    	average-time-Body-Gyroscope-std()-Y             			
    	average-time-Body-Gyroscope-std()-Z             			
    	average-time-Body-Gyroscope-Jerk-mean()-X       			
    	average-time-Body-Gyroscope-Jerk-mean()-Y       			
    	average-time-Body-Gyroscope-Jerk-mean()-Z       			
    	average-time-Body-Gyroscope-Jerk-std()-X        			
    	average-time-Body-Gyroscope-Jerk-std()-Y        			
    	average-time-Body-Gyroscope-Jerk-std()-Z        			
    	average-time-Body-Accelerometer-Magnitude-mean() 			
    	average-time-Body-Accelerometer-Magnitude-std() 			
    	average-time-Gravity-Accelerometer-Magnitude-mean() 			
    	average-time-Gravity-Accelerometer-Magnitude-std() 			
    	average-time-Body-Accelerometer-Jerk-Magnitude-mean() 			
    	average-time-Body-Accelerometer-Jerk-Magnitude-std() 			
    	average-time-Body-Gyroscope-Magnitude-mean() 			
    	average-time-Body-Gyroscope-Magnitude-std() 			
    	average-time-Body-Gyroscope-Jerk-Magnitude-mean() 			
    	average-time-Body-Gyroscope-Jerk-Magnitude-std() 			
    	average-frequency-Domain-Body-Accelerometer-mean()-X 			
    	average-frequency-Domain-Body-Accelerometer-mean()-Y 			
    	average-frequency-Domain-Body-Accelerometer-mean()-Z 			
    	average-frequency-Domain-Body-Accelerometer-std()-X 			
    	average-frequency-Domain-Body-Accelerometer-std()-Y 			
    	average-frequency-Domain-Body-Accelerometer-std()-Z 			
    	average-frequency-Domain-Body-Accelerometer-Jerk-mean()-X 			
    	average-frequency-Domain-Body-Accelerometer-Jerk-mean()-Y 			
    	average-frequency-Domain-Body-Accelerometer-Jerk-mean()-Z 			
    	average-frequency-Domain-Body-Accelerometer-Jerk-std()-X 			
    	average-frequency-Domain-Body-Accelerometer-Jerk-std()-Y 			
    	average-frequency-Domain-Body-Accelerometer-Jerk-std()-Z 			
    	average-frequency-Domain-Body-Gyroscope-mean()-X 			
    	average-frequency-Domain-Body-Gyroscope-mean()-Y 			
    	average-frequency-Domain-Body-Gyroscope-mean()-Z 			
    	average-frequency-Domain-Body-Gyroscope-std()-X 			
    	average-frequency-Domain-Body-Gyroscope-std()-Y 			
    	average-frequency-Domain-Body-Gyroscope-std()-Z 			
    	average-frequency-Domain-Body-Accelerometer-Magnitude-mean()	
    	average-frequency-Domain-Body-Accelerometer-Magnitude-std()	
    	average-frequency-Domain-Body-Accelerometer-Jerk-Magnitude-mean()	
    	average-frequency-Domain-Body-Accelerometer-Jerk-Magnitude-std()	
    	average-frequency-Domain-Body-Gyroscope-Magnitude-mean()	
    	average-frequency-Domain-Body-Gyroscope-Magnitude-std()	
    	average-frequency-Domain-Body-Gyroscope-Jerk-Magnitude-mean()	
    	average-frequency-Domain-Body-Gyroscope-Jerk-Magnitude-std() 	
