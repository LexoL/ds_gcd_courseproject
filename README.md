---
title: "README"  
author: "LexoL"  
date: "January 05, 2016"  
output: 
  html_document:
    toc: true
    theme: cerulean
assignment: jhu_ds_gcd_coursera_courseproject
---

# Getting and Cleaning Data Course Project
submitted according to JHU DS Getting and Cleaning Data Coursera Course assignment

## Document goal
Following the course project assignment, this README explains 

0. The contents of the repo (*Repo contents* section)
1. How the script works (*run_analysis.R script* section)
2. The analysis files (*The analysis files* section).

## Repo contents

This repo contains three files:

* **README.md** that is _this_ file;
* **run_analysis.R** script that contains the code that performs all the data manipulation
and analysis according to the assignment;
* **CodeBook.md** that is the code book with the data to indicate all the variables and summaries calculated, along with units, and transformations performed to clean up the data.

## run_analysis.R script

### General script info

run_analysis.R script is developed according to the JHU DS Data Getting and Cleaning Coursera Course Project requirements.

#### Brief script desription

This script reads data sets from the "UCI HAR Dataset" data directory, creates and outputs 
a tidy data set as required by the Course Project assignment. The output data set is written
into the step5.txt file which can then be found in your working directory. 

Further information is available in 

* **README.md** (*this* file) 
    + *Extended script description* subsection (the next one)
    + *Script usage* subsection below that explains "how the script works" with examples
* **CodeBook.md** that is in the repo.

#### Extended script description

According to the assignment cited and slightly commented, the 'run_analysis.R' script 

1. Merges the training and the test sets from the "UCI HAR Dataset" data directory to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
     + These are measurements (variables) that contain substrings ".mean." or ".std." in their names . 
     + The variables with names containing "MeanFreq", "GravityMean", etc. are ignored as well as those which names do not contain substrings ".mean." or ".std.". 
     + The variable names are acquired from the "<working directory>\\UCI HAR Dataset\\features.txt" file. 
3. Uses descriptive activity names to name the activities in the data set. 
     + These descriptive activity names are acquired from 
     the "<working directory>\\UCI HAR Dataset\\activity_labels.txt" file.
4. Appropriately labels the data set with descriptive variable names.
     + The created data set that meets the requirements of this step is named tbl.step4.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
     + The created data set that meets the requirements of this step is named tbl.step5.
     + The script returns the tbl.step5 dataset as the result.
     + The script writes the tbl.step5 dataset into the file step5.txt that can then be found in the 
     working directory.
     + The script writes the tbl.step5 dataset into the file with the command
     ```
     write.table(tbl.step5, file=".\\step5.txt", row.name=FALSE) 
     ```

Besides, before performing any transformations and analysis, the script checks 

* if the "UCI HAR Dataset" data directory exists in the working directory
* if the `dplyr` package is available in the system.

If either check fails, the script return an error. 

You may want to look through the script code with embedded comments for further details. 

### Required **dplyr** package 

The scrips uses `dplyr` package. This package should be downloaded into your system.

Please run `install.packages("dplyr")`, to download the package if needed. 

### Required **"UCI HAR Dataset"** data directory location

The "UCI HAR Dataset" data directory should be located in your working directory. 

To check this, run `dir()` and see if the `dir()` output contains "UCI HAR Dataset":

```
> dir()
 [1] "CodeBook.html"                                "CodeBook.md"                                 
 [3] "ds_gcd_courseproject-master-201601071916.zip" "getdata-projectfiles-UCI HAR Dataset.zip"    
 [5] "README.html"                                  "README.md"                                   
 [7] "run_analysis.R"                               "run_analysis_log.R"                          
 [9] "step5.txt"                                    "UCI HAR Dataset" <-- Look for this line!!!
```

To obtain the data directory "UCI HAR Dataset", you can 

* download a zip-archive from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip0
* unzip the zip-file,
* copy "UCI HAR Dataset" data directory into your working folder so that the  "UCI HAR Dataset" data directory appear in your working directory.

To verify, if the "UCI HAR Dataset" data directly has appeared in your working directory, run `dir()` and see if the `dir()` output contains "UCI HAR Dataset" as shown above.

### Script platform dependence

The script is platform dependent and designed for MS Windows 7/8/10. 

The script is platform dependent due to its code uses backslashes in file paths: 

* ".\\\\UCI HAR Dataset"
* ".\\\\UCI HAR Dataset\\\\features.txt"
* ".\\\\UCI HAR Dataset\\\\test\\\\subject_test.txt", etc.

To overcome this dependency, you should substitute existing file paths with their versions 
suitable for the platform where you may want to run the script. 

### Script usage

#### How to review the output of this script

Make sure that

0. You work with Windows 7/8/10 (otherwise you need to modify the script as described above)
1. You work with R Studio 
1. The "UCI HAR Dataset" data directory is in your working directory
2. The `dplyr` package is downloaded into your system
3. The `run_analysis.R` script is in your working directory

If these requirements are fulfilled, run the following pair of lines in R Studio: 
```{r}
tbl.review <- source("run_analysis.R")
View(tbl.review)
```
Now you can see the resulting dataset in a View window. 


#### How to review the step5.txt output file with the required tidy dataset

Make sure that

0. You work with Windows 7/8/10 (otherwise you need to modify the script as described above)
1. You work with R Studio 
1. The "UCI HAR Dataset" data directory is in your working directory
2. The `dplyr` package is downloaded into your system
3. The `run_analysis.R` script is in your working directory

To create the step5.txt output file with the tidy data set if the requirements are fulfilled,
run the following lines in R Studio:

```{r}
source("run_analysis.R")
df.review <- read.table("step5.txt", header = TRUE, stringsAsFactors =  FALSE)
View(tbl.review)
```
Now you can see the resulting data set in a View window. 

You may want to take into account the he step5.txt output file with the required tidy data set is stored
in your working directory. 

## The analysis files

Your working directory should contain the `run_analysis.R` script and the "UCI HAR Dataset" data directory, to make possible the transformations and analysis described in the Course Project. 

The relevant files and directories form the following tree:

* \<working directory\>
    + `run_analysis.R`
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

## Data source citation

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
