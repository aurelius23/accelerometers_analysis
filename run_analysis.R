run_analysis <- function(y_test,x_test,subject_test,y_train,x_train,subject_train,features,activity_labels) {
  
  
  
  #1. Merge Train and Test Datasets
  
  # Test
  
  #read files
  subject_test <- read.table(subject_test)
  y_test <- read.table(y_test)
  x_test <- read.table(x_test)
  
  #merge files
  total_test <- cbind(subject_test, y_test, x_test)
  
  # Train
  
  #read files
  subject_train <- read.table(subject_train)
  y_train <- read.table(y_train)
  x_train <- read.table(x_train)
  
  #merge files
  total_train <- cbind(subject_train,y_train,x_train)
  
  # Merge test and train
  
  total <- rbind(total_train,total_test)
  
  
  #2. Labels
  
  #get features names
  features <- read.table(features)
  features <- features$V2
  features <- as.character(features)
  
  #add subject and activity names
  features <- append(features,c("subject","activity"),0)
  
  #apply to dataset
  colnames(total) <- features
  
  
  #3. Extract mean and sd
  exception <- total[,1:2]
  total_extracted <- total[,grepl("[Mm]ean|std",names(total))]
  total_extracted <- cbind(exception,total_extracted)
  
  #4. Use descriptive activity names
  activity_labels <- read.table(activity_labels)
  activity_labels <- activity_labels$V2
  activity_labels <- as.character(activity_labels)
  total_extracted$activity <- as.character(total_extracted$activity)
  
  for (i in 1:length(total_extracted$activity)) {
    if (total_extracted$activity[i] == "1") {
      total_extracted$activity[i] <- activity_labels[1]
    } else if ( total_extracted$activity[i] == "2") {
      total_extracted$activity[i] <- activity_labels[2]
    } else if ( total_extracted$activity[i] == "3") {
      total_extracted$activity[i] <- activity_labels[3]
    } else if ( total_extracted$activity[i] == "4") {
      total_extracted$activity[i] <- activity_labels[4]
    } else if ( total_extracted$activity[i] == "5") {
      total_extracted$activity[i] <- activity_labels[5]
    } else {
      total_extracted$activity[i] <- activity_labels[6]
    }
  }
  
  
  #5. creates a second data set with the average of each variable for each activity and each subject
  
  library(reshape2)
  
  data2 <- dcast(total_extracted, subject ~ activity,mean)
  
  return(total_extracted)
  return(data2)
  
  
}