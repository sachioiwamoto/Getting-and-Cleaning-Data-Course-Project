---
title: "README.md for run_analysis.R"
author: "Sachio Iwamoto"
date: "Saturday, December 20, 2014"
output: html_document
---

This README is written in an R Markdown document format. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

This README.md explains how "run_analysis.R" script work.

## Usage and Arguments

run_analysis()

This script,"run_analysis.R", does not take any argument. This script assumes that the downloaded data set, "getdata-projectfiles-UCI HAR Dataset.zip" is extracted under the current working directory.

This script requires "dplyr" package and attaches it at the beginning of the script.

## Output from this script

The following four data sets will be created by this script.

* **x** : This data set holds both test and training data. This is the merged data set that is used as the input to create the second independent tidy data set.
* **y** : This data set holds both test and training labels.
* **subject** : This data set holds both test and training subject.
* **tidy_data** : This data set is the second independent tidy data set with the average of each variable for each activity and each subject. Please refer to "**CodeBook.md**" about the detail of its variables, data and any transformations or work.

## Script flow

**Step 0. Prep work (read data from files)** : Read the following data from files that are extracted under the working directory.

        * activity_labels.txt
        * features.txt
        * test/subject_test.txt
        * test/X_test.txt
        * test/y_test.txt
        * train/subject_train.txt
        * train/X_train.txt
        * train/y_train.txt

As you may notice, this script does not read all the data set that are included in "getdata-projectfiles-UCI HAR Dataset.zip". Inertial signals data sets are not read because they do not include any mean and standard deviation data.

In this step, a new data set called "wd" will be automatically created. It holds the current working directory.

**Step 1. Merges the training and the test sets to create one data set** : The first step is to combine test data set and training data set into one set. In this step, "X_test" and "X_train" will be combined into one set called "x". Similarly, "y_test" and "y_train" will be combined into one set called "y". Also "subject_test" and "subject_train" will be combined into one set called "subject". "rbind" function will be used to do it.

**Step 2. Extracts only the measurements on the mean and standard deviation for each measurement** : The second column of "features" data set has the names of 561 features and it gives a clue which features are mean and standard. In this step, the script will look up all the feature names that include "mean" and "std" in the "feature" set and extract only these measurements from "x" data set. There are 79 features have been extracted using "grep" function.

**Step 3. Use descriptive activity names to name the activities in the data set** : There are following three tasks to be done in this step to add activity names as the first column for each row of data set "x".

1. At first, change the class of the training labels, which is in "y" data set, from integer to factor
2. then rename the factor levels using activity labels
3. after that, bind "activity_labels" and "x" data set

**Step 4. Appropriately labels the data set with descriptive variable names** : There are following four tasks to be done in this step to assign variable names as column names of data set "x". The first and second column names are "Subjects" and "Activity" respectively. Then the rest of the columns (from column 3 to 81) are assigned based on the features. For better readability, special charactors such as "-", "(" and ")" are removed from the original featuers. For example, "tBodyAcc-mean()-X" is renamed to "tBodyAccmeanX".

1. Before labeling with variable names, merges subject and data set so the first column in data set "x" shows the subject (from 1 to 30)
2. then labels the first and the second columns as "Subject" and "Activity"
3. after that, labels the rest of the 79 columns with appropriate features. The column names do not includes special characters such as "-", "(" and ")"
4. lastly, change the class of the first column (Subject) to "factor" and sort by "Activity" and then by "Subject" for better readability
           
**Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject** : There are following five tasks to be done in this step to perform it.

1. At first use "split()" function to break up the data set by Subject and Activity
2. then use "lapply()" to calculate the each variable's mean for each of the small data set
3. It results in swapping row and column. It also changes the class of the data set from data frame to matrix. In addition, the descriptive activity names and subject columns go to row names. Therefore the next step is to fix it using "t()" and "data.frame()" functions.
4. The "result" data set is at first sorted by subject and then by activity for better readability and the output is saved "tidy_data" data set
5. At last, add the first and the second columns to show "Subject" and "Activity" to "tidy_data" data set and labels them

**Step X. At the end, create the result data set as a txt file with write.table() using row.name=FALSE** : In the last step, "write.table" function will create the text file called "tidy_data.txt" in the working directory without row names of the result data set.
This step also removes the temporary data set, "wd" that is created at the beginning of this script.
