---
title: "CodeBook.md for run_analysis.R"
author: "Sachio Iwamoto"
date: "Saturday, December 20, 2014"
output: html_document
---

This CodeBook is written in an R Markdown document format. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

The following four data sets will be created by the script,"run_analysis.R".

* **x**
* **y**
* **subject**
* **tidy_data**

This CodeBook.md describes the variables of the four data sets listed above and also any transformations or work that the "run_analysis.R" script performs to clean up the data.

## tidy_data (data.frame)
This data set is the result set that the script coreates. It's the second independent tidy data set with the average of each variable for each activity and each subject.

#### Variables
This data set has 81 variables or columns in its data.frame.

The first variable (column) of this data set (data.frame) is "**subject**", which is a group of peole who performed the activity for each window sample. Its range is from 1 to 30.
The class of this variable in the data.frame is "integer".

The second variable is "**Activity**", which each person (subject) performed wearing a smartphone (Samsung Galaxy S II) on the waist. There are following six activities.
The class of this variable in the data.frame is "factor".

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

The other variables are all "**features**". Out of the total 561 features, only 79 features listed below are Mean and Standard Deviation values.
The class of these variables in the data.frame is "numeric".

* tBodyAccmeanX
* tBodyAccmeanY
* tBodyAccmeanZ
* tBodyAccstdX
* tBodyAccstdY
* tBodyAccstdZ
* tGravityAccmeanX
* tGravityAccmeanY
* tGravityAccmeanZ
* tGravityAccstdX
* tGravityAccstdY
* tGravityAccstdZ
* tBodyAccJerkmeanX
* tBodyAccJerkmeanY
* tBodyAccJerkmeanZ
* tBodyAccJerkstdX
* tBodyAccJerkstdY
* tBodyAccJerkstdZ
* tBodyGyromeanX
* tBodyGyromeanY
* tBodyGyromeanZ
* tBodyGyrostdX
* tBodyGyrostdY
* tBodyGyrostdZ
* tBodyGyroJerkmeanX
* tBodyGyroJerkmeanY
* tBodyGyroJerkmeanZ
* tBodyGyroJerkstdX
* tBodyGyroJerkstdY
* tBodyGyroJerkstdZ
* tBodyAccMagmean
* tBodyAccMagstd
* tGravityAccMagmean
* tGravityAccMagstd
* tBodyAccJerkMagmean
* tBodyAccJerkMagstd
* tBodyGyroMagmean
* tBodyGyroMagstd
* tBodyGyroJerkMagmean
* tBodyGyroJerkMagstd
* fBodyAccmeanX
* fBodyAccmeanY
* fBodyAccmeanZ
* fBodyAccstdX
* fBodyAccstdY
* fBodyAccstdZ
* fBodyAccmeanFreqX
* fBodyAccmeanFreqY
* fBodyAccmeanFreqZ
* fBodyAccJerkmeanX
* fBodyAccJerkmeanY
* fBodyAccJerkmeanZ
* fBodyAccJerkstdX
* fBodyAccJerkstdY
* fBodyAccJerkstdZ
* fBodyAccJerkmeanFreqX
* fBodyAccJerkmeanFreqY
* fBodyAccJerkmeanFreqZ
* fBodyGyromeanX
* fBodyGyromeanY
* fBodyGyromeanZ
* fBodyGyrostdX
* fBodyGyrostdY
* fBodyGyrostdZ
* fBodyGyromeanFreqX
* fBodyGyromeanFreqY
* fBodyGyromeanFreqZ
* fBodyAccMagmean
* fBodyAccMagstd
* fBodyAccMagmeanFreq
* fBodyBodyAccJerkMagmean
* fBodyBodyAccJerkMagstd
* fBodyBodyAccJerkMagmeanFreq
* fBodyBodyGyroMagmean
* fBodyBodyGyroMagstd
* fBodyBodyGyroMagmeanFreq
* fBodyBodyGyroJerkMagmean
* fBodyBodyGyroJerkMagstd
* fBodyBodyGyroJerkMagmeanFreq

#### Data
The data is the average (Mean value) of each 79 features listed above for each activity and each subject. There are 6 activities and 30 subjects as described above. Therefore the number of total row (observations) of this data set is 180 (= 6 X 30).

#### Transformation
Data set "x" is the primary input data to "tidy_data" data set. This data is transformed by merging "test" and "train" data.
The Mean value of each feature of each observation is calculated based on multiple observations data for the same subject and activity.
Please refer to "**README.md**" for the information as to how the "tidy_data"" data set is transformed from the source test and train data step-by-step in detail.

## x (data.frame)
This data set holds both test and training data. This is the merged data set that is used as the input to create the second independent tidy data set.

#### Variables
This data set has 81 variables or columns in its data.frame. They are the same column names as tidy_data data set above.

#### Data
The data included in this data set are the raw data of each 79 features listed above for each activity and each subject. There are multiple observations for the same activity and subject. The total observation counts are 10,299. The input data to this data set was transformed by merging "test" and "train" data.

#### Transformation
The input data of this data set is listed below.

* activity_labels.txt
* features.txt
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

Please refer to "**README.md**" for the information as to how the "x" data set is transformed from the source test and train data step-by-step in detail.

## y (data.frame)
This data set holds both test and training labels. It holds the activities for all 10,299 observations listed in the data set "x". Since data set "y" was merged into the data set "x", it is not required for later analysis.

#### Variables
This data.frame has only one column, which does not have descriptive column name assigned.

#### Data
As explained above, the data in column V1 are activities for each observation of data set "x".

#### Transformation
Please refer to "**README.md**" for the information as to how the "y" data set is transformed from the source test and train data step-by-step in detail.

## subject (data.frame)
This data set holds both test and training subject.

#### Variables
This data.frame has only one column, which does not have descriptive column name assigned.

#### Data
As explained above, the data in column V1 are subject for each observation of data set "x".

#### Transformation
Please refer to "**README.md**" for the information as to how the "subject" data set is transformed from the source test and train data step-by-step in detail.

