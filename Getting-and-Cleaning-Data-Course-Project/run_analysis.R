##
## See CodeBook.md and README.md for further information
##
## File download url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Date file downloaded "2019-06-26 17:41:32 AEST"
##
##	R version 3.6.0 (2019-04-26).
##	Platform: x86_64-w64-mingw32/x64 (64-bit)(Windows 10 x64 (build 17134)).

# if data is already present use it else download it
if(!file.exists("./UCI HAR Dataset")) {
    if(!file.exists("./Dataset.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="./Dataset.zip",mehod="curl")
    }

    unzip("./Dataset.zip", exdir=".")
}

################################################################################
# 1. Merges the training and the test sets to create one data set.
#    Ensure rbind order is the same ie. train then test files
################################################################################

subjects <- rbind(read.table("./UCI HAR Dataset/train/subject_train.txt"),
                  read.table("./UCI HAR Dataset/test/subject_test.txt"))
colnames(subjects) <- "subject"


activities <- rbind(read.table("./UCI HAR Dataset/train/y_train.txt"),
                    read.table("./UCI HAR Dataset/test/y_test.txt"))
colnames(activities) <- "activity"


features <- rbind(read.table("./UCI HAR Dataset/train/X_train.txt"),
                  read.table("./UCI HAR Dataset/test/X_test.txt"))
colnames(features) <- read.table("./UCI HAR Dataset/features.txt")[,2]

if (dim(subjects)[1]!=dim(activities)[1] | dim(subjects)[1] != dim(features)[1] )
{
    warning("Different number of rows in tables.  Please check")
}

# Combine subject, activities and features
cmbfil <- cbind(subjects,activities,features)

# clean up files no longer needed
rm(subjects, activities, features)

################################################################################
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement.
################################################################################

cmbfil2 <- cmbfil[c(1:2,grep("mean\\(|std\\(",names(cmbfil)))]
#str(cmbfil2)

################################################################################
# 3. Uses descriptive activity names to name the activities in the data set
################################################################################

activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt")
#str(activity_names)

cmbfil2$activity <- factor(cmbfil2$activity,levels=activity_names[,1],labels=activity_names[,2])
#str(cmbfil2)

################################################################################
# 4. Appropriately label the data set with descriptive variable names.
#
# Glossary
#   t = time
#   f = frequency domain  
#   Acc = Accelerometer
#   Gyro = Gyroscope
#   Mag = Magnitude
################################################################################

tnames <- gsub("([a-z])([A-Z])","\\1-\\2",names(cmbfil2))
tnames <- gsub("^t-","time-",tnames)
tnames <- gsub("^f-","frequency-Domain-",tnames)
tnames <- gsub("-Acc-","-Accelerometer-",tnames)
tnames <- gsub("-Gyro-","-Gyroscope-",tnames)
tnames <- gsub("-Mag-","-Magnitude-",tnames)
#Fix duplicate Body issue  
tnames <- gsub("-Body-Body-","-Body-",tnames)
colnames(cmbfil2) <- tnames

#names(cmbfil2)
#str(cmbfil2)

#write.table(cmbfil2,file="./CleanedWorkFile.txt",row.name=FALSE)

################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
################################################################################

# create new table which each activity averaged per subject & activity
avgfil <- aggregate(. ~ subject + activity,data=cmbfil2, mean)

# rename the labels to include average
wrknames <- names(avgfil)
wrknames[grep("^time|^freq",wrknames)] <- paste("average-", sep="", 
                                                wrknames[grep("^time|^freq",wrknames)]) 
colnames(avgfil) <- wrknames
#names(avgfil)

write.table(avgfil,file="./SubjectActivityAverage.txt",row.name=FALSE)

