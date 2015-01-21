# read features
features <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/features.txt", quote="\"")
# view loaded features
View(features)
# read activities
activity_labels <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/activity_labels.txt", quote="\"")
# view loaded activities
View(activity_labels)
# read X train and test files and view loaded files
X_train <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/train/X_train.txt", quote="\"",col.names=features[,2])
View(X_train)
X_test <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/test/X_test.txt", quote="\"",,col.names=features[,2])
View(X_test)

# read Y train and test files and view loaded files
Y_train <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/train/y_train.txt", quote="\"",col.names = c('activity'))
Y_test <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/test/y_test.txt", quote="\"",col.names = c('activity'))
View(Y_train)
View(Y_test)

# read subject train and test files and view loaded files
Subject_train <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/train/subject_train.txt", quote="\"",col.names = c('subject'))
Subject_test <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/Dataset/test/subject_test.txt", quote="\"",col.names = c('subject'))
View(Subject_train)
View(Subject_test)

# merge 2 files
X_full <- rbind(X_test, X_train)

# get mean and std entries
mean_std <- features[grep("(mean|std)\\(", features[,2]),]
# extract mean and std from merged file
extracts <- X_full[,mean_std[,1]]

# merge 2 files and view the merged file
Y_full <- rbind(Y_train, Y_test)
View(Y_full)

# get number of activities and indices
num_activities <- nrow(activity_labels)
c_index <- 1
n_index <- 2

# loop through the activities and assign variables based on indices
for (i in 1:num_activities) {
          c<-as.numeric(activity_labels[i,c_index])
          n<-as.character(activity_labels[i,n_index])
          Y_full[Y_full$activity==c,]<-n
         }
# view assigned file
View(Y_full)

# combine files by column and view combined file
Labels_X <- cbind(Y_full,X_full)
View(Labels_X)
Labels_extracts <- cbind(Y_full, extracts)
View(Labels_extracts)

# merge 2 files and view merged file
Subject_full <- rbind(Subject_train,Subject_test)
View(Subject_full)

# extract subject and activity names
Subject_name <- Subject_full[,1]
Activity_name <- Y_full[,1]

# generate the output and write up the output file using write.table
Output <- aggregate(X_full, by = list(activity = Activity_name, subject = Subject_name), mean)
Output_name <- "cleansed_version.txt"
write.table(Output, file=Output_name, row.names=FALSE)

# read the cleaned version and view the loaded file
Cleansed_version <- read.table("~/Desktop/RHD/Study/Data_Science_Specialization/Getting_and_Cleaning_Data/Assignment/data_cleansing/cleansed_version.txt", header=TRUE, quote="\"")
View(Cleansed_version)
