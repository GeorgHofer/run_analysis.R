# Download & unzip
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "dataFiles.zip")
unzip("dataFiles.zip")

# Load labels
activityLabels <- fread("UCI HAR Dataset/activity_labels.txt", col.names = c("id","Activity"))
features <- fread("UCI HAR Dataset/features.txt", col.names = c("id","name"))

# Select mean & std features
wanted <- grep("(mean|std)\\(\\)", features$name)
wantedNames <- gsub("[()]", "", features$name[wanted])

# Load train
train <- fread("UCI HAR Dataset/train/X_train.txt")[, ..wanted]
setnames(train, wantedNames)
train[, Activity := fread("UCI HAR Dataset/train/Y_train.txt")$V1]
train[, Subject := fread("UCI HAR Dataset/train/subject_train.txt")$V1]

# Load test
test <- fread("UCI HAR Dataset/test/X_test.txt")[, ..wanted]
setnames(test, wantedNames)
test[, Activity := fread("UCI HAR Dataset/test/Y_test.txt")$V1]
test[, Subject := fread("UCI HAR Dataset/test/subject_test.txt")$V1]

# Merge
data <- rbind(train, test)

# Replace activity numbers with labels
data <- merge(data, activityLabels, by.x="Activity", by.y="id", all.x=TRUE)
data[, Activity := Activity.y]
data[, Activity.y := NULL]

# Create tidy dataset: mean by Subject & Activity
tidy <- data[, lapply(.SD, mean), by = .(Subject, Activity)]

# Save
fwrite(tidy, "tidyData.txt", quote = FALSE)

write.table(tidy, file = "tidyData.txt", row.names = FALSE)
