#============ Merging Test and Train Data ==============
test_subject <- read.table("subject_test.txt",header=FALSE,col.names = "subject_number")
test_activity <-read.table("y_test.txt",header = FALSE,col.names ="activity_number")
test_data <- read.table("X_test.txt",header=FALSE)
test_combined_df <- cbind(test_subject,test_activity,test_data)


train_subject <- read.table("subject_train.txt",header = FALSE,col.names = "subject_number")
train_activity <- read.table("y_train.txt",header = FALSE,col.names ="activity_number")
train_data <- read.table("X_train.txt",header = FALSE)
train_combined_df <- cbind(train_subject,train_activity,train_data)


merged_data <- merge(test_combined_df,train_combined_df,all.x = T,all.y = T)

merged_data

#============ Extracting Mean and Standard Deviation data for each variable ==============

features <- read.table("features.txt",header = FALSE)[,-1]


mean_matching_index <- grep("mean",features)
std_matching_index <- grep("std()",features)
matching_index <- c(1,2,(c(mean_matching_index,std_matching_index)+2))


mean_and_standard_deviation_data <- merged_data[,matching_index]
mean_and_standard_deviation_data

#==============  Describing the activity Name in Data Set ========================


activity_1_index<-which(merged_data$activity_number==1)
activity_2_index<-which(merged_data$activity_number==2)
activity_3_index<-which(merged_data$activity_number==3)
activity_4_index<-which(merged_data$activity_number==4)
activity_5_index<-which(merged_data$activity_number==5)
activity_6_index<-which(merged_data$activity_number==6)

merged_data$activity_number[activity_1_index] <- "WALKING"
merged_data$activity_number[activity_2_index] <- "WALKING_UPSTAIRS"
merged_data$activity_number[activity_3_index] <- "WALKING_DOWNSTAIRS"
merged_data$activity_number[activity_4_index] <- "SITTING"
merged_data$activity_number[activity_5_index] <- "STANDING"
merged_data$activity_number[activity_6_index] <- "LAYING"

merged_data


#================== Labeling Data Set with variable names  =====================

features <- read.table("features.txt",header = FALSE)[,-1]
colnames(merged_data)[3:563] <- as.vector(features)
colnames(merged_data)

merged_data

#========== independent tidy data set with the average of each variable for each activity and each subject=====

subjects <- unique(merged_data$subject_number)
activities <- unique(merged_data$activity_number)
new_df <- data.frame(matrix(,ncol=563))
colnames(new_df) <- c("subject","activity",c(1:561))


for (i in subjects){
  for (j in activities){
    print(j)
    index_match <- which(merged_data$subject_number==as.numeric(i) & merged_data$activity_number==as.character(j))
    make_df <- data.frame(i,j,t(matrix(colMeans(merged_data[index_match,3:563]))))
    colnames(make_df) <- c("subject","activity",c(1:561))
    new_df <- merge(new_df,make_df,all.x = T,all.y = T)
  }
}

new_df
