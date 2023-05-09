library(e1071)

data = datasets::iris

split = sample.split(data$Species, SplitRatio = 0.7)
train = subset(data, split==TRUE)
test = subset(data, split==FALSE)

model <- naiveBayes(Species~.,data = train)

pred <- predict(model, newdata = test[1:4])

accuracy <- sum(pred == test$Species)/nrow(test)
print(paste('Accuracy',accuracy))
