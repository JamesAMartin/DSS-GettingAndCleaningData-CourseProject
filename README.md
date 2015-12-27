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
standard deviation values gropued by the subject and activity.

The CodeBook.md document provides details on the new dataset, as well as
summarizing details about the original.


#Creating the **Average Values for HARUSD** Dataset


##Source Data


##Processing


##Loading From File

In order to load the dataset created by the above processing, use the following
code within R.  It is assumed that the file is located in your working directory.
```
data <- read.table( "./SubjectActivityAverages.txt", header = TRUE)
View(data)
```
To load the data directly from GitHub, use the following code within R.
```

```




