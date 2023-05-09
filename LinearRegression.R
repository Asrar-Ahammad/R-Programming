data = datasets::mtcars

data = na.omit(data)

sum(is.na(data))

split = sample.split(data$mpg, SplitRatio = 0.7)
train = subset(data, split == TRUE)
test = subset(data, split==FALSE)

model <- lm(mpg~wt,data = train)

predict <- predict(model, newdata = test)

plot(test$wt, test$mpg, main = "Weight vs Miles per Gallon", xlab = "Weight", ylab = "MPG")
abline(model, col='red')
