url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile="samsung.zip"
if (!file.exists(zipfile)) {
  download.file(url, destfile=zipfile, method = "curl")
} else {
  #print("Zip file already downloaded")  
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(zipfile)
} else {
  #print("ZIP file already unziped")
}

features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, sep =" ",
                     col.names=c("number", "variablename"))

activities <- read.table("UCI HAR Dataset//activity_labels.txt", header = FALSE,
                         col.names = c("number", "activityname"))

isMeanOrStd <- function(str) {
  grepl("mean|std", str, ignore.case = TRUE)
}

subfeat <- subset(features, isMeanOrStd(variablename))

#print(c("subset of featuers is ", nrow(subfeat)))

readset <- function(measurementfile, subjectfile, activityfile, features, subfeat) {
  a <- read.table(measurementfile, header = FALSE,
                  col.names=features[, "variablename"])
  meanstd <- subset(a, select = subfeat$number)
  tsubject <- read.table(subjectfile, header = FALSE,
                         col.names=c("subject"))
  meanstd$subject <- tsubject$subject
  tactivity <- read.table(activityfile, header = FALSE,
                          col.names=c("activity"))
  stractivity <- activities[,"activityname"][as.integer(tactivity$activity)]
  meanstd$activity <- stractivity
  return(meanstd)
}

testd  <- readset("UCI HAR Dataset/test/X_test.txt",
                  "UCI HAR Dataset/test/subject_test.txt",
                  "UCI HAR Dataset/test/y_test.txt",
                  features, subfeat)
traind <- readset("UCI HAR Dataset/train/X_train.txt",
                  "UCI HAR Dataset/train/subject_train.txt",
                  "UCI HAR Dataset/train/y_train.txt",
                  features, subfeat)

td <- rbind(testd, traind)

ag <- aggregate(. ~ subject+activity, data=td, FUN="mean")

write.table(ag, "ag.txt", row.names=FALSE)