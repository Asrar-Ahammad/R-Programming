data = datasets::iris
# boxplot(data[1:4])
# plot(data[1:4])
# barplot(table(iris$Species))

library('ggplot2')
library('lattice')

# Boxplot
boxplot(Sepal.Length~Species, data=data,
        main='Box plot of sepal length by species',
        xlab = 'Sepal Length', ylab = 'Species')

# Scatter plot
ggplot(data,aes(Sepal.Length, Sepal.Width, color = Species))+geom_point()+labs(title = 'Sepal Length vs Sepal Width', x='Sepal Length',y='Sepal Width')

# Barchart
ggplot(data, aes(Species, fill= Species))+geom_bar()+labs(title = 'Species')

# Scatter plot using lattice package
xyplot(Sepal.Length~Sepal.Width, data=data,groups = Species,
       main='Scatter Plot of Sepal Length vs Sepal width',xlab = 'Sepal Length',
       ylab='Sepal Width',pch=19)
