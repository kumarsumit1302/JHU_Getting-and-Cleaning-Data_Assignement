# JHU_Getting-and-Cleaning-Data_Assignment

The Computations done in this project is based on the data set of accelerometers of Samsung Galaxy S smartphone which can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Details of Experimental data
1. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years
2. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
3. Using embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz was captured.
4. **The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data**

### The Data set which is used for computation in this project includes following files
| File_Name                 | Description                                                   |
| -----                     | ------------                                                  |
| 'README.txt'.             | Equivalent as Name                                                
|'features_info.txt'        | Shows information about the variables used on the feature vector
|'features.txt'             | List of all features
|'activity_labels.txt'      | Links the class labels with their activity name
|'train/X_train.txt'        | Training set
|'train/subject_train.txt'  | Subject Number who performed Train activity
|'train/y_train.txt'        | Training labels
|'test/X_test.txt'          | Test set
|'test/y_test.txt'          | Test labels
|'test/subject_test.txt'    | Subject Number who performed Test activity


For more details on the actual experiments please visit [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Followings computations are been done in this project:
1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive variable names.
5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.


In the repository run.script.R file computes all five computations mentioned above

Codebook given in repository provides all necessary information about computation
