# CodeBook

Please [visit](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) here to know more about the experiment


**The script run_analysis.R downloads data from the following [location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and performs subsetting and averaging operations to produce the data in the file "tidy_indepen_data.txt"**

The script run.analysis.R is written to compute five different computation which are 

### 1. Merging Test and Train Data
   The subjects, activities performed and their corresponding values are saved as variable name test_subject,test_activity and test_data. Similar notation is followed for train activity. All test data is combined in a data frame under name test_combined_df. Same procedure is followed tor train data. Both test and train data frames are combined in a single data frame with name **merged_data**

### 2. Extracting Mean and Standard Deviation data for each variable
File feature.txt is read. all mean and standard deviation variable are identified with their index under variable name mean_and_std_matching_index. The details are as follwows
|Index Number in source feature.txt vector| Mean or standard Deviation variable name |
|:----:|:-----|
|1|tBodyAcc-mean()-X
2|tBodyAcc-mean()-Y
3|tBodyAcc-mean()-Z
4|tBodyAcc-std()-X      
5|tBodyAcc-std()-Y
6|tBodyAcc-std()-Z
41|tGravityAcc-mean()-X
42|tGravityAcc-mean()-Y
43|tGravityAcc-mean()-Z
44|tGravityAcc-std()-X
45|tGravityAcc-std()-Y
46|tGravityAcc-std()-Z
81|tBodyAccJerk-mean()-X
82|tBodyAccJerk-mean()-Y
83|tBodyAccJerk-mean()-Z
84|tBodyAccJerk-std()-X  
85|tBodyAccJerk-std()-Y
86|tBodyAccJerk-std()-Z
121|tBodyGyro-mean()-X
122|tBodyGyro-mean()-Y    
123|tBodyGyro-mean()-Z
124|tBodyGyro-std()-X
125|tBodyGyro-std()-Y
126|tBodyGyro-std()-Z     
161|tBodyGyroJerk-mean()-X
162|tBodyGyroJerk-mean()-Y
163|tBodyGyroJerk-mean()-Z
164|tBodyGyroJerk-std()-X 
165|tBodyGyroJerk-std()-Y
166|tBodyGyroJerk-std()-Z
266|fBodyAcc-mean()-X
267|fBodyAcc-mean()-Y     
268|fBodyAcc-mean()-Z
269|fBodyAcc-std()-X
270|fBodyAcc-std()-Y
271|fBodyAcc-std()-Z      
345|fBodyAccJerk-mean()-X
346|fBodyAccJerk-mean()-Y
347|fBodyAccJerk-mean()-Z
348|fBodyAccJerk-std()-X  
349|fBodyAccJerk-std()-Y
350|fBodyAccJerk-std()-Z
424|fBodyGyro-mean()-X
425|fBodyGyro-mean()-Y    
426|fBodyGyro-mean()-Z
427|fBodyGyro-std()-X
428|fBodyGyro-std()-Y
429|fBodyGyro-std()-Z 

All required data with their variable name is saved in data frame **mean_and_standard_deviation_data**

### 3. Describing the activity Name in Data Set
Activity number are changed to their corresponding name as given in source file activity_label.txt
which are in this way
| Activity Number | Corresponding Activity Name
|:----:|:-----:|
1|WALKING
2|WALKING_UPSTAIRS
3|WALKING_DOWNSTAIRS
4|SITTING
5|STANDING
6|LAYING

After setting name of the activity, It has variable name **descriptive_name_data**

### 4. Labeling Data Set with variable names
All the variable names were picked from feature .txt. Since all variable names starting with "t" indicates time so, t is changed as time. On a similar fashion "f" is changed as frequency. suffix "-mean()-X" is replaced as "Xaxismean and likewise.
Full list is as per table as per given table
|Variable name(in feature.txt)|Labeled variable name| 
|:----|:----|
tBodyAcc-mean()-X |                       timeBodyAcc-Xaxis_mean
tBodyAcc-mean()-Y|                        timeBodyAcc-Yaxis_mean
 tBodyAcc-mean()-Z|                        timeBodyAcc-Zaxis_mean
 tBodyAcc-std()-X |         timeBodyAcc-Xaxis_standard_deviation
 tBodyAcc-std()-Y|          timeBodyAcc-Yaxis_standard_deviation
 tBodyAcc-std()-Z |         timeBodyAcc-Zaxis_standard_deviation
 tGravityAcc-mean()-X  |                   timeGravityAcc-Xaxis_mean
 tGravityAcc-mean()-Y   |                  timeGravityAcc-Yaxis_mean
 tGravityAcc-mean()-Z   |                  timeGravityAcc-Zaxis_mean
 tGravityAcc-std()-X   |    timeGravityAcc-Xaxis_standard_deviation
 tGravityAcc-std()-Y    |   timeGravityAcc-Yaxis_standard_deviation
 tGravityAcc-std()-Z  |     timeGravityAcc-Zaxis_standard_deviation
tBodyAccJerk-mean()-X   |                 timeBodyAccJerk-Xaxis_mean
tBodyAccJerk-mean()-Y    |                timeBodyAccJerk-Yaxis_mean
tBodyAccJerk-mean()-Z   |                 timeBodyAccJerk-Zaxis_mean
tBodyAccJerk-std()-X    |  timeBodyAccJerk-Xaxis_standard_deviation
tBodyAccJerk-std()-Y   |   timeBodyAccJerk-Yaxis_standard_deviation
tBodyAccJerk-std()-Z    |  timeBodyAccJerk-Zaxis_standard_deviation
tBodyGyro-mean()-X    |                   timeBodyGyro-Xaxis_mean
 tBodyGyro-mean()-Y    |                   timeBodyGyro-Yaxis_mean
 tBodyGyro-mean()-Z    |                   timeBodyGyro-Zaxis_mean
 tBodyGyro-std()-X     |    timeBodyGyro-Xaxis_standard_deviation
 tBodyGyro-std()-Y     |    timeBodyGyro-Yaxis_standard_deviation
 tBodyGyro-std()-Z    |     timeBodyGyro-Zaxis_standard_deviation
 tBodyGyroJerk-mean()-X     |              timeBodyGyroJerk-Xaxis_mean
 tBodyGyroJerk-mean()-Y    |               timeBodyGyroJerk-Yaxis_mean
 tBodyGyroJerk-mean()-Z    |               timeBodyGyroJerk-Zaxis_mean
 tBodyGyroJerk-std()-X    |timeBodyGyroJerk-Xaxis_standard_deviation
tBodyGyroJerk-std()-Y    | timeBodyGyroJerk-Yaxis_standard_deviation
tBodyGyroJerk-std()-Z    | timeBodyGyroJerk-Zaxis_standard_deviation
 fBodyAcc-mean()-X   |                frequencyBodyAcc-Xaxis_mean
 fBodyAcc-mean()-Y   |                frequencyBodyAcc-Yaxis_mean
 fBodyAcc-mean()-Z  |                 frequencyBodyAcc-Zaxis_mean
 fBodyAcc-std()-X   |  frequencyBodyAcc-Xaxis_standard_deviation
fBodyAcc-std()-Y   |  frequencyBodyAcc-Yaxis_standard_deviation
fBodyAcc-std()-Z   |  frequencyBodyAcc-Zaxis_standard_deviation
fBodyAccJerk-mean()-X   |            frequencyBodyAccJerk-Xaxis_mean
fBodyAccJerk-mean()-Y   |            frequencyBodyAccJerk-Yaxis_mean
fBodyAccJerk-mean()-Z   |            frequencyBodyAccJerk-Zaxis_mean
fBodyAccJerk-std()-X |frequencyBodyAccJerk-Xaxis_standard_deviation
fBodyAccJerk-std()-Y |frequencyBodyAccJerk-Yaxis_standard_deviation
fBodyAccJerk-std()-Z |frequencyBodyAccJerk-Zaxis_standard_deviation
fBodyGyro-mean()-X  |                frequencyBodyGyro-Xaxis_mean
fBodyGyro-mean()-Y  |                frequencyBodyGyro-Yaxis_mean
fBodyGyro-mean()-Z  |                frequencyBodyGyro-Zaxis_mean
fBodyGyro-std()-X  |  frequencyBodyGyro-Xaxis_standard_deviation
fBodyGyro-std()-Y  |  frequencyBodyGyro-Yaxis_standard_deviation
 fBodyGyro-std()-Z   | frequencyBodyGyro-Zaxis_standard_deviation


### 5. Independent tidy data set with the average of every variable for each activity and subject
In this computation, descriptive_name_ is molted to melted_data with id subject_number and activity. Later, for per each subject and each activity average value is calcuted for every mean and standard deviation variable. The prefic "avg_" is added in each mean and standard deviation name which has been extracted in **"tidy_indepen_data.txt"** file. Details are summarized as below

|variable name in descriptive_name_data | variable name in tidy_indepen_data|
|:----|:-----|
timeBodyAcc-Xaxis_mean|avg_timeBodyAcc-Xaxis_mean
timeBodyAcc-Yaxis_mean|avg_timeBodyAcc-Yaxis_mean
timeBodyAcc-Zaxis_mean|avg_timeBodyAcc-Zaxis_mean
timeBodyAcc-Xaxis_standard_deviation|avg_timeBodyAcc-Xaxis_standard_deviation
timeBodyAcc-Yaxis_standard_deviation|avg_timeBodyAcc-Yaxis_standard_deviation
timeBodyAcc-Zaxis_standard_deviation|avg_timeBodyAcc-Zaxis_standard_deviation
timeGravityAcc-Xaxis_mean|avg_timeGravityAcc-Xaxis_mean
timeGravityAcc-Yaxis_mean|avg_timeGravityAcc-Yaxis_mean
timeGravityAcc-Zaxis_mean|avg_timeGravityAcc-Zaxis_mean
timeGravityAcc-Xaxis_standard_deviation|avg_timeGravityAcc-Xaxis_standard_deviation
timeGravityAcc-Yaxis_standard_deviation|avg_timeGravityAcc-Yaxis_standard_deviation
timeGravityAcc-Zaxis_standard_deviation|avg_timeGravityAcc-Zaxis_standard_deviation
timeBodyAccJerk-Xaxis_mean|avg_timeBodyAccJerk-Xaxis_mean
timeBodyAccJerk-Yaxis_mean|avg_timeBodyAccJerk-Yaxis_mean
timeBodyAccJerk-Zaxis_mean|avg_timeBodyAccJerk-Zaxis_mean
timeBodyAccJerk-Xaxis_standard_deviation|avg_timeBodyAccJerk-Xaxis_standard_deviation
timeBodyAccJerk-Yaxis_standard_deviation|avg_timeBodyAccJerk-Yaxis_standard_deviation
timeBodyAccJerk-Zaxis_standard_deviation|avg_timeBodyAccJerk-Zaxis_standard_deviation
timeBodyGyro-Xaxis_mean|avg_timeBodyGyro-Xaxis_mean
timeBodyGyro-Yaxis_mean|avg_timeBodyGyro-Yaxis_mean
timeBodyGyro-Zaxis_mean|avg_timeBodyGyro-Zaxis_mean
timeBodyGyro-Xaxis_standard_deviation|avg_timeBodyGyro-Xaxis_standard_deviation
timeBodyGyro-Yaxis_standard_deviation|avg_timeBodyGyro-Yaxis_standard_deviation
timeBodyGyro-Zaxis_standard_deviation|avg_timeBodyGyro-Zaxis_standard_deviation
timeBodyGyroJerk-Xaxis_mean|avg_timeBodyGyroJerk-Xaxis_mean
timeBodyGyroJerk-Yaxis_mean|avg_timeBodyGyroJerk-Yaxis_mean
timeBodyGyroJerk-Zaxis_mean|avg_timeBodyGyroJerk-Zaxis_mean
timeBodyGyroJerk-Xaxis_standard_deviation|avg_timeBodyGyroJerk-Xaxis_standard_deviation
timeBodyGyroJerk-Yaxis_standard_deviation|avg_timeBodyGyroJerk-Yaxis_standard_deviation
timeBodyGyroJerk-Zaxis_standard_deviation|avg_timeBodyGyroJerk-Zaxis_standard_deviation
frequencyBodyAcc-Xaxis_mean|avg_frequencyBodyAcc-Xaxis_mean
frequencyBodyAcc-Yaxis_mean|avg_frequencyBodyAcc-Yaxis_mean
frequencyBodyAcc-Zaxis_mean|avg_frequencyBodyAcc-Zaxis_mean
frequencyBodyAcc-Xaxis_standard_deviation|avg_frequencyBodyAcc-Xaxis_standard_deviation
frequencyBodyAcc-Yaxis_standard_deviation|avg_frequencyBodyAcc-Yaxis_standard_deviation
frequencyBodyAcc-Zaxis_standard_deviation|avg_frequencyBodyAcc-Zaxis_standard_deviation
frequencyBodyAccJerk-Xaxis_mean|avg_frequencyBodyAccJerk-Xaxis_mean
frequencyBodyAccJerk-Yaxis_mean|avg_frequencyBodyAccJerk-Yaxis_mean
frequencyBodyAccJerk-Zaxis_mean|avg_frequencyBodyAccJerk-Zaxis_mean
frequencyBodyAccJerk-Xaxis_standard_deviation|avg_frequencyBodyAccJerk-Xaxis_standard_deviation
frequencyBodyAccJerk-Yaxis_standard_deviation|avg_frequencyBodyAccJerk-Yaxis_standard_deviation
frequencyBodyAccJerk-Zaxis_standard_deviation|avg_frequencyBodyAccJerk-Zaxis_standard_deviation
frequencyBodyGyro-Xaxis_mean|avg_frequencyBodyGyro-Xaxis_mean
frequencyBodyGyro-Yaxis_mean|avg_frequencyBodyGyro-Yaxis_mean
frequencyBodyGyro-Zaxis_mean|avg_frequencyBodyGyro-Zaxis_mean
frequencyBodyGyro-Xaxis_standard_deviation|avg_frequencyBodyGyro-Xaxis_standard_deviation
frequencyBodyGyro-Yaxis_standard_deviation|avg_frequencyBodyGyro-Yaxis_standard_deviation
frequencyBodyGyro-Zaxis_standard_deviation|avg_frequencyBodyGyro-Zaxis_standard_deviation

