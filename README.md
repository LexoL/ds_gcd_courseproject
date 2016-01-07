--
title: "README"
author: "LexoL"
date: "January 05, 2016"
output: html_document
assignment: **jhu_ds_gcd_coursera_courseproject**
---

# Getting and Cleaning Data Course Project
submitted according to JHU DS Getting and Cleaning Data Courseara Course assignment

## Document goal
Following the course project assignment, this README explains 

0. The contents of the repo
1. How the script works 
2. The analysis files.

## Repo contents

This repo contains three files:

* **README.md** that is _this_ file;
* **run_analysis.R** script that contains the code that performs all the data manipulation
and analysis according to the assignment;
* **CodeBook.md** that is the code book with the data to indicate all the variables and summaries calculated, along with units, and transformations performed to clean up the data.

## run_analysis.R script

### General script info

run_analysis.R script is developed according to the JHU DS Data Getting and Cleaning Coursera Course Project requirements.

#!!!Add the description of what the script does. 
This script reads data sets from the data directory "UCI HAR Dataset" , creates and outputs 
a tidy data set as required by the Course Project assignement. Further information
is available from README.md and codebook.md files. 

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
* copy "UCI HAR Dataset" data directory into your working folder so that the  "UCI HAR Dataset" data directiry appear in your working directory.

To verify, if the "UCI HAR Dataset" data directiry has appeared in your working directory, run `dir()` and see if the `dir()` output contains "UCI HAR Dataset" as shown above.

### Script platform dependence

The script is platform dependent and designed for MS Windows 7/8/10. 

The script is platform dependent due to its code uses backslashes in file paths: 

* ".\\\\UCI HAR Dataset"
* ".\\\\UCI HAR Dataset\\\\features.txt"
* ".\\\\UCI HAR Dataset\\\\test\\\\subject_test.txt", etc.

To overcome this dependency, you should substitute existing file paths with their versions 
suitible for the platform where you may want to run the script. 

### Script usage

#### How to review the output of this script

Make sure that

0. You work with Windows 7/8/10 (othervise you need to modify the script as described above)
1. You work with RStudio 
1. The "UCI HAR Dataset" data directiry is in your working directory
2. The `dplyr` package is downloaded into your system
3. The `run_analysis.R` script is in your working directory

If these requirements are fulfilled, run the following pair of lines in RStudio: 
```{r}
tbl.review <- source("run_analysis.R")
View(tbl.review)
```
Now you can see the resulting dataset in a View window. 


#### How to review the step5.txt output file with the required tidy dataset

Make sure that

0. You work with Windows 7/8/10 (othervise you need to modify the script as described above)
1. You work with RStudio 
1. The "UCI HAR Dataset" data directiry is in your working directory
2. The `dplyr` package is downloaded into your system
3. The `run_analysis.R` script is in your working directory

To create the step5.txt output file with the tidy dataset if the requirements are fulfilled,
run the following lines in RStudio:

```{r}
source("run_analysis.R")
df.review <- read.table("step5.txt", header = TRUE, stringsAsFactors =  FALSE)
View(tbl.review)
```
Now you can see the resulting dataset in a View window. 

You may want to take into account the he step5.txt output file with the required tidy dataset is stored
in your working directory. 
