library(dplyr)

# Step 0. Prep work (read data from files)
#
wd <- getwd()
activity_labels <- read.table(paste(wd, "/UCI HAR Dataset/activity_labels.txt", sep = ""), quote="\"")
features <- read.table(paste(wd, "/UCI HAR Dataset/features.txt", sep = ""), quote="\"")
subject_test <- read.table(paste(wd, "/UCI HAR Dataset/test/subject_test.txt", sep = ""), quote="\"")
X_test <- read.table(paste(wd, "/UCI HAR Dataset/test/X_test.txt", sep = ""), quote="\"")
y_test <- read.table(paste(wd, "/UCI HAR Dataset/test/y_test.txt", sep = ""), quote="\"")
subject_train <- read.table(paste(wd, "/UCI HAR Dataset/train/subject_train.txt", sep = ""), quote="\"")
X_train <- read.table(paste(wd, "/UCI HAR Dataset/train/X_train.txt", sep = ""), quote="\"")
y_train <- read.table(paste(wd, "/UCI HAR Dataset/train/y_train.txt", sep = ""), quote="\"")

# Step 1. Merges the training and the test sets to create one data set.
#
x <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#
x <- x[,grep("mean|std", as.vector(features[,2]))]

# Step 3. Use descriptive activity names to name the activities in the data set.
#
y[,1] <- as.factor(y[,1])
levels(y[,1]) <- as.vector(activity_labels[,2])
x <- cbind(y, x)

# Step 4. Appropriately labels the data set with descriptive variable names.
#
x <- cbind(subject, x)
names(x)[1:2] <- c("Subject", "Activity")
names(x)[3:81] <- as.vector(features[grep("mean|std", as.vector(features[,2])), 2])
names(x) <- gsub("[-()]", "", names(x))
x[,1] <- as.factor(x[,1])
x <- x[order(x$Activity, x$Subject),]

# Step 5. From the data set in step 4, creates a second, independent tidy data 
#
tidy_data <-
x %>%
split(x[,c("Subject", "Activity")]) %>%
lapply(function(x) colMeans(x[, 3:81])) %>%
data.frame() %>%
t() %>%
data.frame()

tidy_data <- cbind(data.frame(rep(c(1:30), times = 6)), rep(activity_labels[,2], each = 30), tidy_data)
names(tidy_data)[1:2] <- c("Subject", "Activity")

# Step X. Finally create the result data set as a txt file with write.table() using row.name=FALSE.
#         Also clean up the temporary data set,"wd".
#
remove("wd")
write.table(tidy_data, file =paste(wd, "/tidy_data.txt", sep = ""), row.names = FALSE)
