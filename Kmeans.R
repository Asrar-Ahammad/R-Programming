data = datasets::iris
View(data)

data$Species = factor(data$Species,
                      levels = unique(data$Species),
                      labels = seq(0, length(unique(data$Species))-1))
View(data)
data = na.omit(data)
sum(is.na(data))

split = sample.split(data$Species, SplitRatio = 0.7)
train = subset(data, split==TRUE)
test = subset(data, split==FALSE)

model <- kmeans(train[,1:4], centers = 3)
model
summary(model)

conf = table(model$cluster, train$Species)
conf

plot(data$Sepal.Length, data$Petal.Length,pch=19)
plot(data$Sepal.Length, data$Sepal.Width, col=model$cluster, pch=19,main= 'K Means clusters' )
plot(data$Petal.Length, data$Petal.Width, col = model$cluster, pch=19, main = 'Kmeans clusters')
plot(data[,1:2], col=model$cluster, pch=16,main='kmeans clustering of iris data')
points(model$centers[,1:2], col=1:3, pch=19,cex =2)
