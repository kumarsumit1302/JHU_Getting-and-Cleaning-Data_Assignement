#============ Merging Test and Train Data ==============

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url,destfile = "./uci_har_dataset.zip",method = "curl")

if(!file.exists("uci_har_dataset.zip")){
  dir.create("uci_har_dataset.zip")
}

unzipped_file <- unzip("uci_har_dataset.zip")
unzipped_file

test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names = "subject_number")
test_activity <-read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE,col.names ="activity_number")
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_combined_df <- cbind(test_subject,test_activity,test_data)


train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt" ,header = FALSE,col.names = "subject_number")
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt" ,header = FALSE,col.names ="activity_number")
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt" ,header = FALSE)
train_combined_df <- cbind(train_subject,train_activity,train_data)

merged_data <- arrange(rbind(test_combined_df,train_combined_df),subject_number,activity_number)


#============ Extracting Mean and Standard Deviation data for each variable ==============


features <- read.table("./UCI HAR Dataset/features.txt" ,header = FALSE)[,2]
mean_and_std_matching_index <- c(1,2,c(grep("-mean\\(\\)-|-std\\(\\)-",features)+2))
mean_and_standard_deviation_data <- merged_data[,mean_and_std_matching_index]



#==============  Describing the activity Name in Data Set ========================


activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names = c("number","name"))
descriptive_name_data <- mutate(mean_and_standard_deviation_data,activity_number =factor(mean_and_standard_deviation_data$activity_number,labels = activities$name))


#================== Labeling Data Set with variable names  =====================


features <- read.table("./UCI HAR Dataset/features.txt" ,header = FALSE)[,2]
matching_index <- grep("-mean\\(\\)-|-std\\(\\)-",features)
mean_std_index <- features[matching_index]
mean_std_name <- mean_std_index %>% gsub(pattern = "mean\\(\\)-X",replacement = "Xaxis_mean") %>% gsub(pattern = "mean\\(\\)-Y",replacement = "Yaxis_mean") %>% gsub(pattern = "mean\\(\\)-Z",replacement = "Zaxis_mean") %>% gsub(pattern = "std\\(\\)-X",replacement = "Xaxis_standard_deviation") %>% gsub(pattern = "std\\(\\)-Y",replacement = "Yaxis_standard_deviation") %>% gsub(pattern = "std\\(\\)-Z",replacement = "Zaxis_standard_deviation") %>% gsub(pattern = "^t",replacement = "time") %>% gsub(pattern = "^f",replacement = "frequency")
colnames(descriptive_name_data) <- c("subject_number","activity",mean_std_name)


#========== independent tidy data set with the average of each variable for each activity and each subject=====


melted_data <- melt(descriptive_name_data,id.vars =c("subject_number","activity"))
tidy_indepen_data <- dcast(melted_data,subject_number+activity~variable,mean)
colnames(tidy_indepen_data) <- c("subject","activity",gsub("^","avg_",mean_std_name))

write.table(tidy_indepen_data,file="tidy_indepen_data.txt",row.names = FALSE)

