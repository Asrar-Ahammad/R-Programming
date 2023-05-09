library(randomForest)

data = datasets::iris

split = sample.split(data$Species, SplitRatio = 0.7)
train = subset(data, split==TRUE)
test = subset(data, split==FALSE)

model<-randomForest(Species~., data = train)
pred<-predict(model, test[1:4])

accuracy<-sum(pred==test$Species)/nrow(test)
print(paste('Accuracy :',accuracy))

plot(model)

library(caret)
cm = confusionMatrix(pred, test$Species)
cm

cm$table
