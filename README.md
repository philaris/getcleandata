getcleandata
============

This is the solution to the project for Getting and Cleaning Data.

Run the run_analysis.R script in R Studio. The script downloads and opens
the zip file of the initial data in the current directory and unzips it.

The 561 variable names are stored in data frame "features".

We also compute the "activities" data frame that maps numbers 1-6 to
the corresponding activity description.

Then, from "features" it computes the variable names that contain mean or
std (ignoring case). This ends to be a subset of 86 of the 561 possible
variables that is stored in data frame "subfeat".

Then, we read separately the test and train data. For each of the test and
train data, there are 3 files, one with the variable values, one with the
subject, and one with the activity. The function "read_set" gets as
arguments these three files and creates a data frame. First, the variable values
are read and then only the columns that correspond to the 86 variables in the
"subfeat" data frame are kept. We then attach one column for the subject and
one column for the activity (each activity is translated from its numeric to
its description, using the 'activities" data frame).

With two calls to "read_set" we fill data frames "testd" and "traind", then
we bind them together in data frame "td".

We then aggregate "td" by subject and activity, using function "mean" and save
the resulting data frame "ag" to file "ag.txt" in the current directory.

File "ag.txt" contains 180 rows and 88 columns, of which the first column is the
subject, the second is the activity, and the other 86 correspond to the means of the
variables that contain mean or std in the original files:

"subject" "activity" "tBodyAcc.mean...X" "tBodyAcc.mean...Y" "tBodyAcc.mean...Z" "tBodyAcc.std...X" "tBodyAcc.std...Y" "tBodyAcc.std...Z" "tGravityAcc.mean...X" "tGravityAcc.mean...Y" "tGravityAcc.mean...Z" "tGravityAcc.std...X" "tGravityAcc.std...Y" "tGravityAcc.std...Z" "tBodyAccJerk.mean...X" "tBodyAccJerk.mean...Y" "tBodyAccJerk.mean...Z" "tBodyAccJerk.std...X" "tBodyAccJerk.std...Y" "tBodyAccJerk.std...Z" "tBodyGyro.mean...X" "tBodyGyro.mean...Y" "tBodyGyro.mean...Z" "tBodyGyro.std...X" "tBodyGyro.std...Y" "tBodyGyro.std...Z" "tBodyGyroJerk.mean...X" "tBodyGyroJerk.mean...Y" "tBodyGyroJerk.mean...Z" "tBodyGyroJerk.std...X" "tBodyGyroJerk.std...Y" "tBodyGyroJerk.std...Z" "tBodyAccMag.mean.." "tBodyAccMag.std.." "tGravityAccMag.mean.." "tGravityAccMag.std.." "tBodyAccJerkMag.mean.." "tBodyAccJerkMag.std.." "tBodyGyroMag.mean.." "tBodyGyroMag.std.." "tBodyGyroJerkMag.mean.." "tBodyGyroJerkMag.std.." "fBodyAcc.mean...X" "fBodyAcc.mean...Y" "fBodyAcc.mean...Z" "fBodyAcc.std...X" "fBodyAcc.std...Y" "fBodyAcc.std...Z" "fBodyAcc.meanFreq...X" "fBodyAcc.meanFreq...Y" "fBodyAcc.meanFreq...Z" "fBodyAccJerk.mean...X" "fBodyAccJerk.mean...Y" "fBodyAccJerk.mean...Z" "fBodyAccJerk.std...X" "fBodyAccJerk.std...Y" "fBodyAccJerk.std...Z" "fBodyAccJerk.meanFreq...X" "fBodyAccJerk.meanFreq...Y" "fBodyAccJerk.meanFreq...Z" "fBodyGyro.mean...X" "fBodyGyro.mean...Y" "fBodyGyro.mean...Z" "fBodyGyro.std...X" "fBodyGyro.std...Y" "fBodyGyro.std...Z" "fBodyGyro.meanFreq...X" "fBodyGyro.meanFreq...Y" "fBodyGyro.meanFreq...Z" "fBodyAccMag.mean.." "fBodyAccMag.std.." "fBodyAccMag.meanFreq.." "fBodyBodyAccJerkMag.mean.." "fBodyBodyAccJerkMag.std.." "fBodyBodyAccJerkMag.meanFreq.." "fBodyBodyGyroMag.mean.." "fBodyBodyGyroMag.std.." "fBodyBodyGyroMag.meanFreq.." "fBodyBodyGyroJerkMag.mean.." "fBodyBodyGyroJerkMag.std.." "fBodyBodyGyroJerkMag.meanFreq.." "angle.tBodyAccMean.gravity." "angle.tBodyAccJerkMean..gravityMean." "angle.tBodyGyroMean.gravityMean." "angle.tBodyGyroJerkMean.gravityMean." "angle.X.gravityMean." "angle.Y.gravityMean." "angle.Z.gravityMean."

