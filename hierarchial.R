data=datasets::USArrests
View(data)
data_scaled = scale(data)
# data$Species = factor(data$Species,
#                       levels = unique(data$Species),
#                       labels = seq(0,length(unique(data$Species))-1))
View(data)
View(data_scaled)

distance_matrix = dist(data_scaled)

model<- hclust(distance_matrix, method = 'average')
plot(model)

