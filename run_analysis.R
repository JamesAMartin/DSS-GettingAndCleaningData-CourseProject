

################################################################################
###		Load Feature labels and Activity Type Descriptions that are common
###		to both the test data and the training data

##	Feature labels
featureLbls <- read.table( "./data/features.txt", col.names =  c("FeatureColumn", "FeatureName"), stringsAsFactors = FALSE )
	
#	Cleanse the feature label descriptive names until they can be used as column names in R
for( i in 1:nrow(featureLbls) )
{
	##	Strip the invalid characters out of the feature name
	featureLbls[i,]$FeatureName <- as.character( gsub( "\\(", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( "\\)", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( ",", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( "-+", "-", featureLbls[i,]$FeatureName ) )
	featureLbls[i,]$FeatureName <- as.character( gsub( "-$", "", featureLbls[i,]$FeatureName ) )
}

	
##	Activity descriptions
activityDesc <- read.table( "./data/activity_labels.txt", col.names = c("ActivityTypeID", "ActivityType"))





################################################################################
###		Load the Test data set and organize it


###		Read in the various Test data files

##	Subject data
testSubj <- read.table( "./data/test/subject_test.txt", col.names = c("SubjectID") )

##	Feature data
testFeatures <- read.table( "./data/test/X_test.txt")
names(testFeatures) <- featureLbls$FeatureName

##	Activity data
testActivities <- read.table( "./data/test/y_test.txt", col.names = c("ActivityTypeID"))
testActivities <- merge( testActivities, activityDesc, by.x = "ActivityTypeID", by.y = "ActivityTypeID")


###		Combine data together by columns
testData <- cbind( testSubj, testActivities, testFeatures )




################################################################################
###		Load the Train data set and organize it


###		Read in the various Train data files

##	Subject data
trainSubj <- read.table( "./data/train/subject_train.txt", col.names = c("SubjectID") )

##	Feature data
trainFeatures <- read.table( "./data/train/X_train.txt")
names(trainFeatures) <- featureLbls$FeatureName


##	Activity data
trainActivities <- read.table( "./data/train/y_train.txt", col.names = c("ActivityTypeID"))
trainActivities <- merge( trainActivities, activityDesc, by.x = "ActivityTypeID", by.y = "ActivityTypeID")


###		Combine data together by columns
trainData <- cbind( trainSubj, trainActivities, trainFeatures )




################################################################################
###		Combine the Training and Testing data together to generate the
###		Experiment Data.

expData <- rbind( trainData, testData )




################################################################################
###		Filter Experiment Data (expData) down to the columns we need.

###	Identify the columns that hold mean/std values
m1 <- names(expData)[grep("\\-mean\\-", names(expData), ignore.case = TRUE )]
m2 <- names(expData)[grep("\\-mean$", names(expData), ignore.case = TRUE )]
s1 <- names(expData)[grep("\\-std\\-", names(expData), ignore.case = TRUE )]
s2 <- names(expData)[grep("\\-std$", names(expData), ignore.case = TRUE )]
ms <- c( "SubjectID", "ActivityType", m1, m2, s1, s2 )
desiredColumns <- names(expData) %in% ms

###	Filter expData down to columns we want to work with
expData <- expData[, desiredColumns]


















