---
title: "README - Average Values for HARUSD"
author: "James A Martin"
date: "December 23, 2015"
output: 
  html_document:
    toc: true
    theme: cerulean
---

#Overview

This README.md file summarizes the process taken to re-organize the **Human
Activity Recognition Using Smartphones Dataset** (**HARUSD** dataset, Version 1.0).
The new organization provides averages for the originally provided mean and
standard deviation values grouped by the subject and activity.

The CodeBook.md document provides details on the new dataset, as well as
summarizing details about the original data.

The output for this analysis (SubjectActivityAverages.txt) uses a wide format
for the data, yielding 180 observations and 66 variables.



#Creating the **Average Values for HARUSD** Dataset


##Source Data

Source data for creating the **Average Values for HARUSD** dataset were downloaded
from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and additional information can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The contents of the downloaded Zip file were extracted into the **data** subdirectory
of the R project working directory.  All processing uses the working directory
as the initial location, and looks to the **./data** directory for the source files.

Key information used in creating the **Average Values for HARUSD** dataset
come from the following excerpt from the HARUSD ReadMe.txt file.

	 The dataset includes the following files:
	
	- 'README.txt'
	
	- 'features_info.txt': Shows information about the variables used on the feature vector.
	
	- 'features.txt': List of all features.
	
	- 'activity_labels.txt': Links the class labels with their activity name.
	
	- 'train/X_train.txt': Training set.
	
	- 'train/y_train.txt': Training labels.
	
	- 'test/X_test.txt': Test set.
	
	- 'test/y_test.txt': Test labels.
	
	The following files are available for the train and test data. Their descriptions are equivalent. 
	
	- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.




##Processing

All processing to generate the **Average Values for HARUSD** dataset is contained
in the **run_analysis.R** file.  It is assumed that the HARUSD source data has
already been downloaded from the link listed above, and placed in the **data** sub-folder
of the working directory.  Once this is complete, simply source the run_analysis.R
file within R, and it will generate the **SubjectActivityAverages.txt** file
containing the new **Average Values for HARUSD** dataset, and place it in the
working directory.

###Load Feature labels and Activity Type Descriptions
This portion of the run_analysis.R script loads the Feature Labels and Activity
Description data that is related to both the testing and training datasets.  Some
data cleanup is performed on the Feature Labels to make them compatible with
the R environment.

Modifications include:

- Replace all parenthesis ( "(" or ")" ) characters with a hyphen ("-").
- Replace all commas (",") with a hyphen ("-")
- Replace all multiple hyphens ("--", "---", etc.) with a single period (".").

After the cleanup, the labels are R compatible, yet still maintain the basic original
format and meaning.

###Load the Test/Train data
This portion of run_analysis.R will load all of the needed files related to
test data in the source, then process them to create a single data.table that
holds test data in a tidy format.  These steps are then repeated for the training
data files, yielding another data.table in a tidy format.

Processing steps included for both Test and Train data:

- Load subject data
- Load feature data
- Apply labels to the feature data from the Feature Labels loaded earlier
- Load Activity data
- Add column to hold the Activity Description based on observation activity
- Combine loaded and processed data into a single tidy dataset.


###Combine the Training and Testing data
Once the Test and Train data have been cleaned up, the two datasets are then
joined together into a single data.table (expData) representing a clean form
of the original HARUSD dataset.

###Filter Experiment Data (expData) to desired columns
The clean dataset created in the prior step holds far more data than we need
in order to generate our desired dataset.  At this point, we remove all but the
desired columns to make averaging values simpler.

###Generate New Dataset Averaging Values by Subject and Activity
Our final, desired dataset, is generated by calculating averages on the mean and 
standard deviation columns from our source data, grouped by the Subject and Activity.

Once the averaged data is organized, it is written to the working directory in the
**SubjectActivityAverages.txt** file.



#Loading **Average Values for HARUSD** Dataset Into R

In order to load the dataset created by the above processing, use the following
code within R.  It is assumed that the file is located in your working directory.
```
data <- read.table( "./SubjectActivityAverages.txt", header = TRUE)
View(data)
```
To load the data from GitHub, you must first download the file.  The following 
code will perform the download from GitHub and then load the data within R.

```
download.file( url = "https://raw.githubusercontent.com/JamesAMartin/DSS-GettingAndCleaningData-CourseProject/master/SubjectActivityAverages.txt", destfile = "./SubjectActivityAverages.txt")
data <- read.table( "./SubjectActivityAverages.txt", header = TRUE)
View(data)
```




