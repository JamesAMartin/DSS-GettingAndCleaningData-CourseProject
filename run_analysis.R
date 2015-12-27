
library(plyr)


################################################################################
####	Load Feature labels and Activity Type Descriptions that are common
####	to both the test data and the training data

###	Feature labels
featureLbls <- read.table( "./data/features.txt", col.names =  c("FeatureColumn", "FeatureName"), stringsAsFactors = FALSE )
	
##	Cleanse the feature label descriptive names until they can be used as column names in R
for( i in 1:nrow(featureLbls) )
{
	##	Strip the invalid characters out of the feature name
	featureLbls[i,]$FeatureName <- as.character( gsub( "\\(", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( "\\)", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( ",", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( "-+", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( "-$", "", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( "-", ".", featureLbls[i,]$FeatureName ) )
}

	
###	Activity descriptions
activityDesc <- read.table( "./data/activity_labels.txt", col.names = c("ActivityTypeID", "ActivityType"))





################################################################################
####	Load the Test data set and organize it

###		Read in the various Test data files

##	Subject data
testSubj <- read.table( "./data/test/subject_test.txt", col.names = c("SubjectID") )

##	Feature data
testFeatures <- read.table( "./data/test/X_test.txt")
names(testFeatures) <- featureLbls$FeatureName

##	Activity data
testActivities <- read.table( "./data/test/y_test.txt", col.names = c("ActivityTypeID"))
testActivities$Idx = c(1:nrow(testActivities))
testActivities <- merge( testActivities, activityDesc, by.x = "ActivityTypeID", by.y = "ActivityTypeID", sort = FALSE)
testActivities <- testActivities[order(testActivities$Idx),]


###		Combine data together by columns
testData <- cbind( testSubj, testActivities, testFeatures )




################################################################################
####	Load the Train data set and organize it


###		Read in the various Train data files

##	Subject data
trainSubj <- read.table( "./data/train/subject_train.txt", col.names = c("SubjectID") )

##	Feature data
trainFeatures <- read.table( "./data/train/X_train.txt")
names(trainFeatures) <- featureLbls$FeatureName


##	Activity data
trainActivities <- read.table( "./data/train/y_train.txt", col.names = c("ActivityTypeID"))
trainActivities$Idx = c(1:nrow(trainActivities))
trainActivities <- merge( trainActivities, activityDesc, by.x = "ActivityTypeID", by.y = "ActivityTypeID", sort = FALSE)
trainActivities <- trainActivities[order(trainActivities$Idx),]


###		Combine data together by columns
trainData <- cbind( trainSubj, trainActivities, trainFeatures )




################################################################################
####	Combine the Training and Testing data together to generate the
####	Experiment Data.

expData <- rbind( trainData, testData )




################################################################################
####	Filter Experiment Data (expData) down to the columns we need.

###	Identify the columns that hold mean/std values
m1 <- names(expData)[grep("\\.mean\\.", names(expData), ignore.case = TRUE )]
m2 <- names(expData)[grep("\\.mean$", names(expData), ignore.case = TRUE )]
s1 <- names(expData)[grep("\\.std\\.", names(expData), ignore.case = TRUE )]
s2 <- names(expData)[grep("\\.std$", names(expData), ignore.case = TRUE )]
ms <- c( "SubjectID", "ActivityType", m1, m2, s1, s2 )
desiredColumns <- names(expData) %in% ms

###	Filter expData down to columns we want to work with
expData <- expData[, desiredColumns]



################################################################################
####	Generate the tidy dataset that holds the mean grouped by
####	Subject and Activity and save out to file

###	Create summarized (mean) data with appropriately named columns
subjActMeans <- ddply( expData, c("SubjectID", "ActivityType"), function(x) colSums(x[3:66]))
names(subjActMeans) <- c( "SubjectID", "ActivityType", paste( "AvgOf.", names(subjActMeans[3:66]), sep = "" ) )

###	Save data to file
write.table( subjActMeans, file = "./SubjectActivityAverages.txt", row.names = FALSE )














