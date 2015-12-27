---
title: "Average Values for HARUSD - CodeBook"
author: "James A Martin"
date: "December 23, 2015"
output: 
  html_document:
    toc: true
    theme: cerulean
---


#Average Values for HARUSD Field Information
This dataset consists of 180 observations and 66 variables.  The first two variables
identify the Subject observed, and the Activity they performed.  All remaining
variables are an average of either a mean or standard deviation provided from the 
original data.

##Core Fields
the following fields are used for grouping the averages calculated on the remaining
variables.

###SubjectId
ID of the subject observed during original data collection.  This is a numeric value
used to abstract the identity of the subject.  Each subject has a unique number assigned
to them that is used for all observations.

###ActivityType
Identifies the activity subject was observed perofrming. This is a categorical variable
with the following levels:

- LAYING
- SITTING
- STANDING
- WALKING
- WALKING_DOWNSTAIRS
- WALKING_UPSTAIRS


##Average Value Fields
All of the remaining variables in the dataset provide the average calculated for
all observations of mean and standard deviation in the original dataset, grouped
by the Subject and ActivityType.  Remaining variables are:

- AvgOf.tBodyAcc.mean.X
- AvgOf.tBodyAcc.mean.Y
- AvgOf.tBodyAcc.mean.Z
- AvgOf.tBodyAcc.std.X
- AvgOf.tBodyAcc.std.Y
- AvgOf.tBodyAcc.std.Z
- AvgOf.tGravityAcc.mean.X
- AvgOf.tGravityAcc.mean.Y
- AvgOf.tGravityAcc.mean.Z
- AvgOf.tGravityAcc.std.X
- AvgOf.tGravityAcc.std.Y
- AvgOf.tGravityAcc.std.Z
- AvgOf.tBodyAccJerk.mean.X
- AvgOf.tBodyAccJerk.mean.Y
- AvgOf.tBodyAccJerk.mean.Z
- AvgOf.tBodyAccJerk.std.X
- AvgOf.tBodyAccJerk.std.Y
- AvgOf.tBodyAccJerk.std.Z
- AvgOf.tBodyGyro.mean.X
- AvgOf.tBodyGyro.mean.Y
- AvgOf.tBodyGyro.mean.Z
- AvgOf.tBodyGyro.std.X
- AvgOf.tBodyGyro.std.Y
- AvgOf.tBodyGyro.std.Z
- AvgOf.tBodyGyroJerk.mean.X
- AvgOf.tBodyGyroJerk.mean.Y
- AvgOf.tBodyGyroJerk.mean.Z
- AvgOf.tBodyGyroJerk.std.X
- AvgOf.tBodyGyroJerk.std.Y
- AvgOf.tBodyGyroJerk.std.Z
- AvgOf.tBodyAccMag.mean
- AvgOf.tBodyAccMag.std
- AvgOf.tGravityAccMag.mean
- AvgOf.tGravityAccMag.std
- AvgOf.tBodyAccJerkMag.mean
- AvgOf.tBodyAccJerkMag.std
- AvgOf.tBodyGyroMag.mean
- AvgOf.tBodyGyroMag.std
- AvgOf.tBodyGyroJerkMag.mean
- AvgOf.tBodyGyroJerkMag.std
- AvgOf.fBodyAcc.mean.X
- AvgOf.fBodyAcc.mean.Y
- AvgOf.fBodyAcc.mean.Z
- AvgOf.fBodyAcc.std.X
- AvgOf.fBodyAcc.std.Y
- AvgOf.fBodyAcc.std.Z
- AvgOf.fBodyAccJerk.mean.X
- AvgOf.fBodyAccJerk.mean.Y
- AvgOf.fBodyAccJerk.mean.Z
- AvgOf.fBodyAccJerk.std.X
- AvgOf.fBodyAccJerk.std.Y
- AvgOf.fBodyAccJerk.std.Z
- AvgOf.fBodyGyro.mean.X
- AvgOf.fBodyGyro.mean.Y
- AvgOf.fBodyGyro.mean.Z
- AvgOf.fBodyGyro.std.X
- AvgOf.fBodyGyro.std.Y
- AvgOf.fBodyGyro.std.Z
- AvgOf.fBodyAccMag.mean
- AvgOf.fBodyAccMag.std
- AvgOf.fBodyBodyAccJerkMag.mean
- AvgOf.fBodyBodyAccJerkMag.std
- AvgOf.fBodyBodyGyroMag.mean
- AvgOf.fBodyBodyGyroMag.std



#Source Data Information
The following is extracted from the features_info.txt file provided with the
source data.  It provides additional information on how the original data was
collected and processed before it was used to generate the Average Values for HARUSD dataset.

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
>
>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>tBodyAcc-XYZ  
>tGravityAcc-XYZ  
>tBodyAccJerk-XYZ  
>tBodyGyro-XYZ  
>tBodyGyroJerk-XYZ  
>tBodyAccMag  
>tGravityAccMag  
>tBodyAccJerkMag  
>tBodyGyroMag  
>tBodyGyroJerkMag  
>fBodyAcc-XYZ  
>fBodyAccJerk-XYZ  
>fBodyGyro-XYZ  
>fBodyAccMag  
>fBodyAccJerkMag  
>fBodyGyroMag  
>fBodyGyroJerkMag  
>
>The set of variables that were estimated from these signals are: 
>
>mean(): Mean value  
>std(): Standard deviation  
>mad(): Median absolute deviation   
>max(): Largest value in array  
>min(): Smallest value in array  
>sma(): Signal magnitude area  
>energy(): Energy measure. Sum of the squares divided by the number of values.   
>iqr(): Interquartile range  
>entropy(): Signal entropy  
>arCoeff(): Autorregresion coefficients with Burg order equal to 4  
>correlation(): correlation coefficient between two signals  
>maxInds(): index of the frequency component with largest magnitude  
>meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
>skewness(): skewness of the frequency domain signal   
>kurtosis(): kurtosis of the frequency domain signal  
>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
>angle(): Angle between to vectors.  
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>
>gravityMean
>tBodyAccMean
>tBodyAccJerkMean
>tBodyGyroMean
>tBodyGyroJerkMean
>
>The complete list of variables of each feature vector is available in 'features.txt'
