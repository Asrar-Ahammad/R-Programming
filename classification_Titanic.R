data = datasets::Titanic
View(data)
data = data.frame(data)
data
nrow(data)
data$Class = factor(data$Class,
                    levels = unique(data$Class),
                    labels = seq(0,length(unique(data$Class))-1))
data$Class = as.numeric(data$Class)

data$Sex = factor(data$Sex,
                    levels = unique(data$Sex),
                    labels = seq(0,length(unique(data$Sex))-1))
data$Sex = as.numeric(data$Sex)

data$Survived = factor(data$Survived,
                    levels = unique(data$Survived),
                    labels = seq(0,length(unique(data$Survived))-1))
data$Survived = as.numeric(data$Survived)

data$Age = factor(data$Age,
                       levels = unique(data$Age),
                       labels = seq(0,length(unique(data$Age))-1))
data$Age = as.numeric(data$Age)
View(data)

# Train test split
library(caTools)
split = sample.split(data$Survived, SplitRatio = 0.7)
train = subset(data, split==TRUE)
test = subset(data, split=FALSE)
View(train)
View(test)
# Logistic regression
model <- glm(Survived~., data = train)
pred <- predict(model, test)

pred <- ifelse(pred>1.5,2,1)
accuracy = (1 - mean(pred != test$Survived))*100
print(accuracy)

# Decision tree model
library(rpart)
model <- rpart(Survived~.,data = train)

plot(model)
text(model)

pred <- predict(model,test)
pred <- ifelse(pred>1.5,2,1)

accuracy = (1-mean(pred!=test$Survived))*100
print(accuracy)

# Random forest
library(randomForest)
model<-randomForest(Survived~., data=train)
pred<-predict(model, test)
pred<-ifelse(pred>1.5, 2,1)

accuracy = (1-mean(pred!=test$Survived))*100
print(accuracy)
plot(model)

# SVM classification
library(e1071)
model<-svm(Survived~.,data = train,kernel='polynomial')
pred <- predict(model, test)
pred<-ifelse(pred>1.5,2,1)

accuracy<-(1-mean(pred!=test$Survived))*100
print(accuracy)

