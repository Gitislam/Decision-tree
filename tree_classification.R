install.packages("C50")
library(C50)
library(rpart)
data(churn)
str(churnTrain)
#churnTrain = churnTrain[,! names(churnTrain) %in% c("state", "area_code", "account_length") ]
dim(churnTrain)
set.seed(1234)
ind=sample(2,nrow(churnTrain),replace =TRUE,prob=c(.7,.3)) 
trainset=churnTrain[ind==1,]
testset=churnTrain[ind==2,]
dim(trainset)
dim(testset)
churn.rp=rpart(churn~.,data=trainset)
churn.rp
printcp(churn.rp)
plotcp(churn.rp)
summary(churn.rp)
prediction=predict(churn.rp,testset,type = "class")
table(testset$churn,prediction)
