features <- read.table("UCI_HAR_Dataset/features.txt", col.names=c("nums","colnames"), stringsAsFactors = F)
activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt", col.names=c("activity.id","activity.name"), stringsAsFactors = F)

testx <- read.table("UCI_HAR_Dataset/test/X_test.txt")
testy <- read.table("UCI_HAR_Dataset/test/y_test.txt")
testsu <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
test <- cbind(testx, testy, testsu)

trainx <- read.table("UCI_HAR_Dataset/train/X_train.txt")
trainy <- read.table("UCI_HAR_Dataset/train/y_train.txt")
trainsu <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
train <- cbind(trainx, trainy, trainsu)

allobs <- rbind(test, train)
colnames(allobs) <- c(features$colnames, "activity.id", "subject.id")

means <- allobs[,c(1:3, 41:43, 81:83, 121:123, 161:163, 201, 214, 227, 240, 253, 266:268, 345:347, 424:426, 503, 516, 529, 542)]
stds <- allobs[,c(4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543,562:563)]

useful <- cbind(means,stds)
useful_labeled <- merge(useful, activity_labels)

result <- by(useful_labeled[1:66], list(useful_labeled$activity.name, useful_labeled$subject.id), colMeans)

