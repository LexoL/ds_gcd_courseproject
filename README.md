# ds_gcd_courseproject

# The document goal according to the Assignment: -- TO BE DELETED WHEN FINALIZING

## 1. The README that explains the analysis files is clear and understandable.
## 2. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they ## are connected.
## 3. You should include a README.md in the repo describing how the script works and the code book describing the variables.

# Course Project for JHU Data Science Course on Getting and Cleaning Data

## run_analysis.R script is developed according to the JHU DS Data Getting and Cleaning 
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
