
################################################################################
###	General Instructions for scritp.
###
###	REMOVE THIS HEADER BEFORE FINAL SUBMISSION
###
###	You should create one R script called run_analysis.R that does the following.
###		- Merges the training and the test sets to create one data set.
###		- Extracts only the measurements on the mean and standard deviation for
###		  each measurement. 
###		- Uses descriptive activity names to name the activities in the data set
###		- Appropriately labels the data set with descriptive variable names. 
###		- From the data set in step 4, creates a second, independent tidy
###		  data set with the average of each variable for each activity and
###		  each subject.



################################################################################
###	Load the Test data set and organize it

###	Read in the Subject data
testSubj <- read.csv( "./data/test/subject_test.txt", col.names = c("SubjectID") )

###	Read in the Feature data
testFeatures <- read.table( "./data/test/X_test.txt")

###	Read in the Activity labels
testActivities <- read.table( "./data/test/y_test.txt", col.names = c("ActivityTypeID"))

###	Read in the Feature labels
testFeatureLbls <- read.table( "./data/features.txt", col.names = c("FeatureColumn", "FeatureName") )




################################################################################
###	Load the Train data set and organize it












