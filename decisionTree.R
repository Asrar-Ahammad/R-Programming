library(rpart)
data = datasets::iris

split = sample.split(data$Species, SplitRatio = 0.7)
train = subset(data, split==TRUE)
test = subset(data, split==FALSE)

tree_model <- rpart(Species~., data = train)

plot(tree_model)
text(tree_model)

new_Data <- data.frame(Sepal.Length=5.1, Sepal.Width=3.5,Petal.Length=2.46, Petal.Width=1.56)
predict(tree_model, newdata = new_Data, type='class')
