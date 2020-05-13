#============ Merging Test and Train Data ==============

#reading the subject_txt, activity Labels and X_test from Test file
test_subject <- read.table("subject_test.txt",header=FALSE,col.names = "subject_number")
test_activity <-read.table("y_test.txt",header = FALSE,col.names ="activity_number")
test_data <- read.table("X_test.txt",header=FALSE)

#Making a new data frame with subject, activity and all correspind data from Test File
test_combined_df <- cbind(test_subject,test_activity,test_data)


#reading the subject_txt, activity Labels and X_test from Train file
train_subject <- read.table("subject_train.txt",header = FALSE,col.names = "subject_number")
train_activity <- read.table("y_train.txt",header = FALSE,col.names ="activity_number")
train_data <- read.table("X_train.txt",header = FALSE)

#Making a new data frame with subject, activity and all corresponding data from Train File
train_combined_df <- cbind(train_subject,train_activity,train_data)

#Merging the Test and Train Data to get comined data of all 30 subjects for all six activities
merged_data <- merge(test_combined_df,train_combined_df,all.x = T,all.y = T)

#printing the Merged data
merged_data

#============ Extracting Mean and Standard Deviation data for each variable ==============

#Collecting the names of all variables for which experiment was performed. It is done from extracting second column of feature.txt file 
features <- read.table("features.txt",header = FALSE)[,-1]

#Identifying the Index number of all mean_variable from feature.txt
mean_matching_index <- grep("mean",features)

#Identifying the Index number of all standard deviation_variable from feature.txt
std_matching_index <- grep("std()",features)

#Getting the column Number for Mean and Standard deviation. Column 1 is for subject and Column 2 is for activity
matching_index <- c(1,2,(c(mean_matching_index,std_matching_index)+2))

#Assigning the filtered data frame which contain Mean and Standard Deviation of Each variable to a new variable
mean_and_standard_deviation_data <- merged_data[,matching_index]

#Printing Mean and Standard Deviation Data from the master data
mean_and_standard_deviation_data

#==============  Describing the activity Name in Data Set ========================

#Identifying the Indices for all the six activity variable
activity_1_index<-which(merged_data$activity_number==1)
activity_2_index<-which(merged_data$activity_number==2)
activity_3_index<-which(merged_data$activity_number==3)
activity_4_index<-which(merged_data$activity_number==4)
activity_5_index<-which(merged_data$activity_number==5)
activity_6_index<-which(merged_data$activity_number==6)

#Replacing the activity variable number with their corresponding Name
merged_data$activity_number[activity_1_index] <- "WALKING"
merged_data$activity_number[activity_2_index] <- "WALKING_UPSTAIRS"
merged_data$activity_number[activity_3_index] <- "WALKING_DOWNSTAIRS"
merged_data$activity_number[activity_4_index] <- "SITTING"
merged_data$activity_number[activity_5_index] <- "STANDING"
merged_data$activity_number[activity_6_index] <- "LAYING"


#Printing the data in which Activities are Named
merged_data


#================== Labeling Data Set with variable names  =====================

#Extracting the variable named from feature.txt file
features <- read.table("features.txt",header = FALSE)[,-1]

#Changing the columns names of Master Data with Corresponding Variable
colnames(merged_data)[3:563] <- as.vector(features)

#Printing the Master data in which columns are appropriately named
merged_data

#========== independent tidy data set with the average of each variable for each activity and each subject=====

#Getting all unique subjects
subjects <- unique(merged_data$subject_number)

#Getting all unique activities
activities <- unique(merged_data$activity_number)

#Creating an empty data frame of 563 Columns : 1st for subject, 2nd for activity and remaining 561 for variables
new_df <- data.frame(matrix(,ncol=563))
col_names <- gsub("^","Mean",features)
colnames(new_df) <- c("subject","activity",col_names)

#Getting the Required data

for (i in subjects){
  for (j in activities){
    #matching the index for subject number and their activity in data set
    index_match <- which(merged_data$subject_number==as.numeric(i) & merged_data$activity_number==as.character(j))
    #Making a new data frame with subject and it's activity with mean of all variables
    make_df <- data.frame(i,j,t(matrix(colMeans(merged_data[index_match,3:563]))))
    #Redifining the colmanes same as colnames of empty data frame
    colnames(make_df) <- c("subject","activity",col_names)
    #Merging the data frame horizontally
    new_df <- rbind(new_df,make_df)
  }
}


#Printing the independent tidy data set with the average of each variable for each activity and each subject
new_df

write.table(new_df,file="independent mean data with each subject and activity",row.names=FALSE)

