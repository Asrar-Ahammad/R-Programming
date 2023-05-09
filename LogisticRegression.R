data = datasets::mtcars
data = na.omit(data)
sum(is.na(data))
View(data)

split = sample.split(data$am, SplitRatio = 0.75)
train = subset(data,split==TRUE)
test = subset(data,split==FALSE)

model <- glm(am~wt, data = data, family = 'binomial')

pred <- predict(model, test, type = 'response')

pred <- ifelse(pred>0.5, 1, 0)

accuracy = (1 - mean(pred != test$am))*100
print(paste("Accuracy :",accuracy))
