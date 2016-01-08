## run_analysis.R
## This script is developed according to the JHU DS Data Getting and Cleaning 
## Coursera Course Project requirements.
## The script is platform dependent and designed for MS Windows 7/8/10. (uses backslashes in file paths.)
## -------------------------------------------------------------------------
## This script reads data sets from the data directory "UCI HAR Dataset" , creates and outputs
## a tidy data set as required by the Course Project assignement. Further information
## is available from README.md and codebook.md files. 

## USAGE 1: TO REVIEW THE OUTPUT OF THIS SCRIPT, uncomment and run the following pair of lines: 
## tbl.review <- source("run_analysis.R")
## View(tbl.review)

## USAGE 2: TO REVIEW THE OUTPUT FILE step5.txt <b>stored in your working directory</b>, uncomment and run
## the following pair of lines: 
## df.review <- read.table("step5.txt", header = TRUE, stringsAsFactors =  FALSE)
## View(df.review)

## ATTENTION! The data directory "UCI HAR Dataset" should be in your working directory. 
## To check this, run dir() and see if the dir() output contains "UCI HAR Dataset".
## To obtain the data directory "UCI HAR Dataset", you can download a zip-archive from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip0
## and unzip the zip-file into your working folder so that the data directiry "UCI HAR Dataset" 
## appear in your working directory.

## ATTENTION! The scrips uses dplyr package. This package shoul be downloaded into your system.
## Please run install.packages("dplyr"), to download the package. 


#######################################################################################################
#######################################################################################################

## ------- Step 0: Make preliminary arrangements and intruduce definitions

## ------- Substep 0.1: Define string constants with resource file names

# Samsung data folder name
resFolder.data <- ".\\UCI HAR Dataset"

# Variable names
resFile.features <- ".\\UCI HAR Dataset\\features.txt"

# Activity labels
resFile.activity_labels <- ".\\UCI HAR Dataset\\activity_labels.txt"

# Main files with measurements results
resFile.x_train <- ".\\UCI HAR Dataset\\train\\X_train.txt"
resFile.x_test <- ".\\UCI HAR Dataset\\test\\X_test.txt"

# Subjects
resFile.subject_train <- ".\\UCI HAR Dataset\\train\\subject_train.txt"
resFile.subject_test <- ".\\UCI HAR Dataset\\test\\subject_test.txt"

# Activities (label IDs)
resFile.y_train <- ".\\UCI HAR Dataset\\train\\Y_train.txt"
resFile.y_test <- ".\\UCI HAR Dataset\\test\\Y_test.txt"


## ------- Substep 0.2: Load library dplyr and check if there if the data directory in the working dirctory

if(!require(dplyr, warn.conflicts = FALSE, quietly = TRUE)){ # We attemp to load library dplyr that is necessary for data sets processing 
        # If the library is not available, infrom the user and stop the script.
        print('Library dplyr is not avalable. Please install the package dplyer.')
        print('To install, you may call install.packages("dplyr")')
        print ("and then re-run the script run_analysis.R .")
        print("The script stopped.")
        # return
        stop("Library dplyr is not avalable.")
}


if(!file.exists(resFolder.data)){# We check if the data directory "UCI HAR Dataset" with requred datasets
                                 # exists in the working folder.
        # If the the data directory "UCI HAR Dataset" does not exist in the working folder, 
        # inform the user and stop the script
        print("The working directory does not contain the data directory 'UCI HAR Dataset'. ")
        print("Please copy the data directory 'UCI HAR Dataset' into your working directory.")
        print("To do this, you can download a zip-archive from ")
        print("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip0")
        print("and unzip the zip-file into your working folder.")
        print("To check, if the data directory 'UCI HAR Dataset' is into your working directory,")
        print("please type dir() and see if the dir() output contains 'UCI HAR Dataset'. ")
        print("The script stopped.")
        ## return
        stop("The working directory does not contain the data directory 'UCI HAR Dataset'. ")
}


## ------- Substep 0.3: Read datasets to data frames.

# 561 obs. of 1 var
df.features <- read.table(resFile.features, sep = " ", stringsAsFactors =  FALSE)
colnames_preliminary1 <- df.features[,2]
colnames_preliminary2 <- gsub("()-",".",colnames_preliminary1, fixed = TRUE)
colnames_preliminary3 <- gsub("()","",colnames_preliminary2, fixed = TRUE)
colnames <- gsub("-",".",colnames_preliminary3, fixed = TRUE)

# We need selected variable names in CodeBook.rm
colnames.mean.selector <- "\\.mean\\.|\\.mean$"
colnames.std.selector <- "\\.std\\.|\\.std$"

colnames.mean <- grep(colnames.mean.selector, colnames, value = TRUE)
colnames.std <- grep(colnames.std.selector, colnames, value = TRUE)
colnames.selected <- c(colnames.mean, colnames.std)

rm("df.features") # We need df.features no longer since we have colnames variable

# 6 obs. of 2 vars
df.activity_labels <- read.table(resFile.activity_labels, stringsAsFactors =  FALSE, 
                                 col.names = c("id","activity"))

## When reading df.x_train and df.x_test, the arrangements of Step 4 starts: 
## due to col.names = colnames, the measurement variables receive descriptive names: 

# 7352 obs. of 561 vars
df.x_train <- read.table(resFile.x_train, stringsAsFactors =  FALSE, col.names = colnames)

# 2947 obs. of 561 vars
df.x_test <- read.table(resFile.x_test, stringsAsFactors =  FALSE, col.names = colnames)



# 7352 obs. of 1 var
df.subject_train <- read.table(resFile.subject_train, stringsAsFactors =  FALSE, col.names = "subject")

# 2947 obs. of 1 var
df.subject_test <- read.table(resFile.subject_test, stringsAsFactors =  FALSE, col.names = "subject")



# 7352 obs. of 1 var
df.y_train <- read.table(resFile.y_train, stringsAsFactors =  FALSE, col.names = "id")

# 2947 obs. of 1 var
df.y_test <- read.table(resFile.y_test, stringsAsFactors =  FALSE, col.names = "id")



## ------- Substep 0.4: Convert data frames to tbl_df (package dplyr), remove data frames
## We should remove the data frames after their conversion, to keep the used memory size reasonable


tbl.activity_labels <- tbl_df(df.activity_labels)

tbl.x_train <- tbl_df(df.x_train)
tbl.x_test <- tbl_df(df.x_test)

tbl.subject_train <- tbl_df(df.subject_train)
tbl.subject_test <- tbl_df(df.subject_test)

tbl.y_train <- tbl_df(df.y_train)
tbl.y_test <- tbl_df(df.y_test)


rm("df.activity_labels", "df.x_train", "df.x_test", "df.subject_train", "df.subject_test",
   "df.y_train", "df.y_test")


## ------- Step 1: Merge the training and the test sets to create one data set.
## We should remove the train and test data frames after their merging, 
## to keep the used memory size reasonable

## To reduce the size of modified tables, we finalize merging data tables 
## from tbl.x, tbl.y, tbl.subject later on, after extracting mean and std columns from tbl.x. 

tbl.x <- bind_rows(tbl.x_train, tbl.x_test)
tbl.y <- bind_rows(tbl.y_train, tbl.y_test)
tbl.subject <- bind_rows(tbl.subject_train, tbl.subject_test)


rm("tbl.x_train", "tbl.x_test", "tbl.y_train", "tbl.y_test", 
   "tbl.subject_train", "tbl.subject_test")


## ------- Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

## According to the task and variables description in features_info.txt, we select  only variables with
## names containing mean() (".mean.") and std() (".std.") as well as we ignore variables with names 
## containing "MeanFreq", "GravityMean", etc. in their names. 

## We should remove the train and test data frames after their merging, 
## to keep the used memory size reasonable

tbl.extracted <- select(tbl.x,matches(colnames.mean.selector), matches(colnames.std.selector))


## We should remove the tbl.x after extracting a new data set from this one, 
## to keep the used memory size reasonable
rm("tbl.x")


## ------- Step 3: Use descriptive activity names to name the activities in the data set

## ------- Substep 3.1: Link activity id with activity name in the same data set

tbl.id_activity <- mutate(tbl.y, activity = tbl.activity_labels$activity[tbl.y$id])  


## ------- Substep 3.2: Merge tbl.id_activity and tbl.subject, select only activity and subject variables

tbl.step4 <- tbl.id_activity %>%
        bind_cols(tbl.subject) %>%
        select(activity, subject) %>%
## ------- Substep 3.3: Finalize Step 1, i.e. merge activity, subject, and measurements in the same data set        
## ------- Step 4: Appropriately label the data set with descriptive variable names (finalized here).        
        bind_cols(tbl.extracted)


## We should remove data sets since they will no longer be used
rm("tbl.id_activity", "tbl.activity_labels", "tbl.subject", "tbl.extracted", "tbl.y")


## ------- Now tbl.step4 contains the data set that meets the requremints of Steps 1--4


## ------- Step 5: From the data set in step 4, create a second, 
## ------- independent tidy data set with the average of each variable 
## ------- for each activity and each subject.

tbl.step5 <- tbl.step4 %>% 
        group_by(activity, subject) %>% 
        summarize_each(funs(mean))


## ------- Write the resulting data set into a file

write.table(tbl.step5, file=".\\step5.txt", row.name=FALSE) 


## ------- Output the tidy data set tbl.step5

return(tbl.step5)

## TO REVIEW THE OUTPUT OF THIS SCRIPT, uncomment and run the following pair of lines: 
## tbl.review <- source("run_analysis.R")
## View(tbl.review)
## ATTENTION! The data directory "UCI HAR Dataset" should be in your working directory. To check this,
## rus dir() and see if the dir() output contains "UCI HAR Dataset". 


## TO REVIEW THE OUTPUT FILE step5.txt <b>stored in your working directory</b>, uncomment and run
## the following pair of lines: 
## df.review <- read.table("step5.txt", header = TRUE, stringsAsFactors =  FALSE)
## View(df.review)
## ATTENTION! The data directory "UCI HAR Dataset" should be in you working directory. To check this,
## rus dir() and see if the dir() output contains "UCI HAR Dataset".
