## Introduction

This assignment uses data from the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UC Irvine Machine
Learning Repository - Human Activity Recognition Using Smartphones Dataset</a>.

The goal of this project was to prepare tidy data, that can be used for later analysis, by creating one R script called run_analysis.R that does the following.
1/ Merges the training and the test sets to create one data set.
2/ Extracts only the measurements on the mean and standard deviation for each measurement.
3/ Uses descriptive activity names to name the activities in the data set
4/ Appropriately labels the data set with descriptive variable names.
5/ From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Source Dataset Information

The dataset used was downloaded from the provided course link. 
* Dataset: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">Human Activity Recognition Using Smartphones</a> [59.7MB]
* Description: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The Source Dataset README.txt provides the following details around the capturing of the data.
    The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
    Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
    wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
    we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
    The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
    partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
    
    The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
    fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which 
    has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration 
    and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
    frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency 
    domain. See 'features_info.txt' for more details. 

Please refer to the source dataset README.txt file for further information. 


# Acknowledgements

The source dataset was produced as part of the following publication and is prohibited from being used commercially.
    Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
    Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
    Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
    Vitoria-Gasteiz, Spain. Dec 2012


## Resultant Dataset information

    CodeBook.md - describes the data and the process steps to summarise the data.
    README.md - this file
    run_analysis.R - R script to download, merge, cleanup and summarise the data.
    SubjectActivityAverage.txt - the file produced by the run_analysis script.  Contains the average of each measurement for each activity and each subject


# Resultant Dataset details

    Dimensions: 180 rows, 68 columns
    Each row contains the averages of the different measurements for each activity and each subject. 
    The dataset is complete (no missing values)
    
    The columns are as follows:
    	subject : the unique id of the person being messured. (class=integer total of 30 people) 		
    	activity : the activity being performed by the subject. (class=factor 6 factors [WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING])	
    	The remaining 66 colums are numeric averages of the different mean and standard deviation measurements captured for the subject and activity
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


## File, Software and run Platform specifics
    Source File download url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    Date file downloaded "2019-06-26 17:41:32 AEST"
    R version 3.6.0 (2019-04-26).
    Platform: x86_64-w64-mingw32/x64 (64-bit)(Windows 10 x64 (build 17134)).











