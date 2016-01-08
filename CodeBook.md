---
title: "CodeBook"
author: "LexoL"
date: "January 06, 2016"
output: 
  html_document:
    toc: true
    theme: cerulean
assignment: jhu_ds_gcd_coursera_courseproject
---

# Getting and Cleaning Data Course Project: Project Code Book
submitted according to JHU DS Getting and Cleaning Data Coursera Course assignment

## Document goal

Following the Getting and Cleaning Data course project assignment, this CodeBook 

1. describes the variables, the data, and any transformations or work that we performed to clean up the data
2. modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.

According to the course project assignment we extensively copy, cite, slightly update and modify the original data code book sources and then describe the data, variables, transformations, and work we performed. 

The original data source reference is provided at the end of this document. 

## Original code books

### Files Description: README.txt


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

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Notes on units and variables (features): 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


### Variables (features) description:  features_info.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'.

## Files and directories relevant to the analysis

"UCI HAR Dataset" data directory contains the files of the original data set. See README.md for the
instructions how to obtain and place this directory. For the purposes of this document, we assume that "UCI HAR Dataset" is put into the working directory. 

The relevant files and directories form the following tree:

* \<working directory\>
    + `run_analysis.R`  // is the script which performs all the transformations and analysis
    + `step5.txt`       // appears after the script has successfully run.
    + `UCI HAR Dataset`
         + `activity_labels.txt`
         + `features.txt`
         + `test`
               + `subject_test.txt`
               + `X_test.txt`
               + `y_test.txt`
         + `train`
               + `subject_train.txt`
               + `X_train.txt`
               + `y_train.txt`
      
`run_analysis.R` performs the required transformations and analysis on the data set  from the "UCI HAR Dataset" directory. 

`step5.txt` contains the resulting tidy data set and appears after the script `run_analysis.R` has successfully run.

`activity_labels.txt` contains the descriptive names of activities.

`features.txt` contains the descriptive names of variables in the tables with measurements results.
The tables are kept separately in `X_test.txt` and `X_train.txt`. 

`X_test.txt` and `X_train.txt` files contain the separated test and train tables with measurements results.

`y_test.txt` and `y_train.txt` files contain the separated test and train one dimensional tables with activity IDs. The numbers of observations in these tables match those in `X_test.txt` and `X_train.txt`.

`subject_test.txt` and `subject_train.txt` files contain the separated test and train one dimensional tables with subject IDs. The numbers of observations in these tables match those in `X_test.txt` and `X_train.txt`.

We subsequently use the file names, to name corresponding data frames and tables in the script code and in *this* document. 

## Data set transformations

### Naming variables in test and training results data frames

As described above, the `features.txt` contains the descriptive names of variables in the tables with measurements results. These names were loaded into a character vector colnames with a slight transformation: sequences "-" and "()-" were substituted with "."
as well as "()" at the end of names with "" (the empty character sequence), to meet R requirements for data frame column names. 

We used these slightly transformed names, to properly name variables when downloading `X_test.txt` and `X_train.txt` files into `df.x_text` and `df.x_train` data frames in R workspace correspondingly.

The names of these variables were no more changed since we got the original data set creators choices as an established standard, to keep the variables name understandable and portable to other researchers.

#### Note:

Along with this decision making, we should admit that this decision could be argued and there exist evident transformations applicable to the variable names (split the names, create new variables that represent some measurements classes, features, etc). In our opinion, the final 
choice depends on the goals to aim at. To meet the assignment requirement to group by and summarize the selected measurement variables with `mean`, we should keep those names as they are.

### Variables inclusion and exclusion criteria

We include into analysis the measurement variables, which names contain names of the 
following "summarizing" functions:

* mean(): Mean value
* std(): Standard deviation

We exclude all the rest of the measurement variables from the analysis.

Either, we do not include into analysis the variables, which names contain the following
substrings

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
* meanFreq

We ignore these variables because they do not represent the measurements themselves,
instead, they represent a variety of measurement derivatives. 


### Selected mean and std measurement variables

There were selected 33 measurement variables with mean values:

```
 [1] "tBodyAcc.mean.X"           "tBodyAcc.mean.Y"          
 [3] "tBodyAcc.mean.Z"           "tGravityAcc.mean.X"       
 [5] "tGravityAcc.mean.Y"        "tGravityAcc.mean.Z"       
 [7] "tBodyAccJerk.mean.X"       "tBodyAccJerk.mean.Y"      
 [9] "tBodyAccJerk.mean.Z"       "tBodyGyro.mean.X"         
[11] "tBodyGyro.mean.Y"          "tBodyGyro.mean.Z"         
[13] "tBodyGyroJerk.mean.X"      "tBodyGyroJerk.mean.Y"     
[15] "tBodyGyroJerk.mean.Z"      "tBodyAccMag.mean"         
[17] "tGravityAccMag.mean"       "tBodyAccJerkMag.mean"     
[19] "tBodyGyroMag.mean"         "tBodyGyroJerkMag.mean"    
[21] "fBodyAcc.mean.X"           "fBodyAcc.mean.Y"          
[23] "fBodyAcc.mean.Z"           "fBodyAccJerk.mean.X"      
[25] "fBodyAccJerk.mean.Y"       "fBodyAccJerk.mean.Z"      
[27] "fBodyGyro.mean.X"          "fBodyGyro.mean.Y"         
[29] "fBodyGyro.mean.Z"          "fBodyAccMag.mean"         
[31] "fBodyBodyAccJerkMag.mean"  "fBodyBodyGyroMag.mean"    
[33] "fBodyBodyGyroJerkMag.mean"
```

There were selected 33 measurement variables with std values:

```
 [1] "tBodyAcc.std.X"           "tBodyAcc.std.Y"          
 [3] "tBodyAcc.std.Z"           "tGravityAcc.std.X"       
 [5] "tGravityAcc.std.Y"        "tGravityAcc.std.Z"       
 [7] "tBodyAccJerk.std.X"       "tBodyAccJerk.std.Y"      
 [9] "tBodyAccJerk.std.Z"       "tBodyGyro.std.X"         
[11] "tBodyGyro.std.Y"          "tBodyGyro.std.Z"         
[13] "tBodyGyroJerk.std.X"      "tBodyGyroJerk.std.Y"     
[15] "tBodyGyroJerk.std.Z"      "tBodyAccMag.std"         
[17] "tGravityAccMag.std"       "tBodyAccJerkMag.std"     
[19] "tBodyGyroMag.std"         "tBodyGyroJerkMag.std"    
[21] "fBodyAcc.std.X"           "fBodyAcc.std.Y"          
[23] "fBodyAcc.std.Z"           "fBodyAccJerk.std.X"      
[25] "fBodyAccJerk.std.Y"       "fBodyAccJerk.std.Z"      
[27] "fBodyGyro.std.X"          "fBodyGyro.std.Y"         
[29] "fBodyGyro.std.Z"          "fBodyAccMag.std"         
[31] "fBodyBodyAccJerkMag.std"  "fBodyBodyGyroMag.std"    
[33] "fBodyBodyGyroJerkMag.std"
```

### Activities and subject variables naming in data frames

The naming is done when data frames are loading from corresponding files. 

The `df.activity_labels` data frame variables are named as "id","activity".

The `df.subject_train` and `df.subject_test` variable is named "subject".

The `df.y_train` and `df.y_test`  variable is named "id". 

### Data frames converted with `tbl_df`

All the data frames are converted to 'advanced' `dplyr` data frames with the `tbl_df` function
and prefix their names with `"tbl_"`.

### Binding training and test data frames 

To merge training and test data sets, we perform the following operations with data frames:

* bind rows of `tbl.x_train`, `tbl.x_test`, to get `tbl_x`
* bind rows of `tbl.y_train`, `tbl.y_test`, to get `tbl_y`
* bind rows of `tbl.subject_train`, `tbl.subject_test`, to get `tbl_subject`

### Extracting required variables and binding with activity and subject data frames

To get the `tbl.step4` tidy data set as required at step 4 of the assignment, 
we perform the following transformations with data frames:

* extract subframe with mean and std measurement variables from `tbl.x` to `tbl.extracted`
* link activity id with activity name in the same data set `tbl.id_activity`
* merge `tbl.id_activity` and `tbl.subject`
* select only activity and subject variables
* bind columns of this selection with `tbl.extracted`.

## Data set analysis

### Grouping and summarizing the result

To get the `tbl.step5` independent tidy data set with the average of each variable for each activity and each subject, we finalize our analysis with the following operations

* group `tbl.step4` by activity and subject
* summarize all the measurement variables with `mean`
    + to do this, we call `summarize_each(funs(mean))`.

    
### Writing and returning the results

The resulting ``tbl.step5` independent tidy data set is

* written into 'step5.txt' file in the working directory
* returned as the output of the script `run_analysis`. 

### Variable names in the resulting data set

The resulting data set contains the following variable names

* activity
* subject
* 66 mean and std measurement variables selected according to the criteria and listed above.


## Data source citation

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
