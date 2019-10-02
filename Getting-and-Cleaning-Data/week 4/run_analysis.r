# load all data
library(dplyr)
library(tidyr)
features <- read.table("features.txt", sep = " ")
activity <- read.table("activity_labels.txt", sep = "", col.names = c("TARGET", "act_name"))

subject_train <- read.table("train/subject_train.txt", sep=" ", col.names = c("SID"))
X_train <- read.table("train/X_train.txt", header = FALSE, col.names = features$V2)
y_train <- read.table("train/y_train.txt", header = FALSE, col.names = c("TARGET"))

subject_test <- read.table("test/subject_test.txt", sep=" ", col.names = c("SID"))
X_test <- tbl_df(read.table("test/X_test.txt", header = FALSE, col.names = features$V2))
y_test <- tbl_df(read.table("test/y_test.txt", header = FALSE, col.names = c("TARGET")))

train <- bind_cols(X_train, y_train, subject_train)
test  <- bind_cols(X_test, y_test, subject_test)

data <- bind_rows(train, test)
rm(X_train, y_train, X_test, y_test, subject_test, subject_train, test, train)

tidy <- select(data, SID, TARGET, contains("mean"), contains("std"))
rm(data)
tidy$TARGET <- activity[tidy$TARGET, 2]

names(tidy)[1] = "subject"
names(tidy)[2] = "activity"
names(tidy)<-gsub("Acc", "Accelerometer", names(tidy))
names(tidy)<-gsub("Gyro", "Gyroscope", names(tidy))
names(tidy)<-gsub("BodyBody", "Body", names(tidy))
names(tidy)<-gsub("Mag", "Magnitude", names(tidy))
names(tidy)<-gsub("^t", "Time", names(tidy))
names(tidy)<-gsub("^f", "Frequency", names(tidy))
names(tidy)<-gsub("tBody", "TimeBody", names(tidy))
names(tidy)<-gsub("-mean()", "Mean", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-std()", "STD", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-freq()", "Frequency", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("angle", "Angle", names(tidy))
names(tidy)<-gsub("gravity", "Gravity", names(tidy))

final <- tidy %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(final, "final.txt", row.name=FALSE)

