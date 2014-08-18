##This program is designed to take data from the publication Davide Anguita, Alessandro Ghio, Luca Oneto, 
## Xavier Parra and Jorge L. Reyes-Ortiz  
## "Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine".
## International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 and merge 
##together a number of .txt files to produce a tidy subsetted dataset as well as a shaped dataset

library(reshape2)
##import the data into R

testsub<-read.csv("test//subject_test.txt", header=FALSE, sep="")
testx<-read.csv("test//X_test.txt", header=FALSE, sep="")
testy<-read.csv("test//y_test.txt", header=FALSE, sep="")

trainsub<-read.csv("train//subject_train.txt", header=FALSE, sep="")
trainy<-read.csv("train//y_train.txt", header=FALSE, sep="")
trainx<-read.csv("train//X_train.txt", header=FALSE, sep="")

##add column names to the data
colnames(testsub)<-"PATIENT"
colnames(testy)<-"EXERCISE"
features <- read.table("features.txt")
feature_names <-  features[,2]
colnames(testx) <- feature_names

colnames(trainsub)<-"PATIENT"
colnames(trainy)<-"EXERCISE"
colnames(trainx)<-feature_names


##merge data sets
testbound<-cbind(testsub, testy, testx)
trainbound<-cbind(trainsub, trainy, trainx)
data<-rbind(testbound, trainbound)


##to find columns associated with mean and std
dataset1<-data[,c(1,2 ,grep(".*-std.*",colnames(data)), grep(".*-Std.*", colnames(data)),grep(".*-Mean.*", colnames(data)), grep(".*-mean.*", colnames(data)))]

##to rename the activities with an appropriate name

dataset1$EXERCISE[dataset1$EXERCISE == 1] <- "WALKING"
dataset1$EXERCISE[dataset1$EXERCISE == 2] <- "WALKING_UPSTAIRS"
dataset1$EXERCISE[dataset1$EXERCISE == 3] <- "WALKING_DOWNSTAIRS"
dataset1$EXERCISE[dataset1$EXERCISE == 4] <- "SITTING"
dataset1$EXERCISE[dataset1$EXERCISE == 5] <- "STANDING"
dataset1$EXERCISE[dataset1$EXERCISE == 6] <- "LAYING"


##To clean up column names

names(dataset1)<-sub("f", "freq", names(dataset1))
names(dataset1)<-sub("t", "time", names(dataset1))

##to write the completed dataset
write.table(dataset1, "Clean.data.1.txt", row.names=FALSE, quote=FALSE, sep='\t')

##Create a 2nd tidy dataset with the avg of each variable, for each activity, for each person

measures<-dataset1[1,3:81]
measures<-colnames(measures)
datamelt<-melt(dataset1, id=c("PATIENT", "EXERCISE"), measure.vars=c(measures))
dataset2<-dcast(datamelt, PATIENT + EXERCISE ~variable,mean)
## to write the completed dataset
write.table(dataset2, "Clean.data.2.txt", row.names=FALSE, quote=FALSE, sep='\t')

