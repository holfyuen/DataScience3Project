# Reading data files
# Remember to put all files into the working directory
activity_labels<-read.table("activity_labels.txt")
features<-read.table("features.txt")
subject_test<-read.table("subject_test.txt")
X_test<-read.table("X_test.txt")
y_test<-read.table("y_test.txt")
subject_train<-read.table("subject_train.txt")
X_train<-read.table("X_train.txt")
y_train<-read.table("y_train.txt")

# Assigning names to test and train data sets
names(X_test)<-features[,2]
names(X_train)<-features[,2]

names(subject_test)<-"Subject"
names(subject_train)<-"Subject"

library(dplyr)
# Extracting only mean and standard deviation
test2<- X_test[!duplicated(names(X_test))] %>% #Remove duplicated columns which are not mean or std
  select(matches("mean()|std()",ignore.case=FALSE)) %>% #select mean or std, case sensitive
  select(-matches("meanFreq")) #columns with "meanFreq" are excluded
train2<- X_train[!duplicated(names(X_train))] %>%
  select(matches("mean()|std()",ignore.case=FALSE)) %>%
  select(-matches("meanFreq"))

# Assigning labels (WALKING, SITTING etc) to activities originally coded 1-6
y_test2<-as.data.frame(factor(y_test[,1],labels=activity_labels[,2]))
names(y_test2)="Activity_Label"
y_train2<-as.data.frame(factor(y_train[,1],labels=activity_labels[,2]))
names(y_train2)="Activity_Label"

# Attaching activity labels and subject id (1-30) to data sets
test2<-cbind(test2,y_test2,subject_test)
train2<-cbind(train2,y_train2,subject_train)

# Merging test and train data sets into one tidy data set
Tidy_data<-rbind(test2,train2)

# Calculate mean for each variable, group by Subject and Activity_Label
Final_data<-Tidy_data %>%
  group_by(Subject,Activity_Label) %>%
  summarise_each(funs(mean))

# Write the data onto a txt file
write.table(Final_data,file="final_data.txt",row.names = FALSE)