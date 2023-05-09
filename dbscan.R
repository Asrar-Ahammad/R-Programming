data = datasets::iris
data = na.omit(data)
sum(is.na(data))

data$Species = factor(data$Species,
                      levels = unique(data$Species),
                      labels = seq(0,length(unique(data$Species))-1))
View(data)

# data_scaled<-scale(data[,1:4])

split = sample.split(data$Species, SplitRatio = 0.7)
train = subset(data, split ==TRUE)
test = subset(data, split==FALSE)

library(dbscan)
model <- dbscan(data[1:4],minPts = 5,eps = 0.5)
model$cluster

cm = table(model$cluster, data$Species)
cm
plot(model$cluster,data[1:4], main='DBSCAN')
View(data[,1:4])
