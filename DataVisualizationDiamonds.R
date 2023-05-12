data("diamonds")
View(diamonds)

# diamonds$cut = factor(diamonds$cut,
                      # levels = unique(diamonds$cut),
                      # labels = seq(0,length(unique(diamonds$cut))-1))
# View(diamonds)

# Barchart
ggplot(diamonds,aes(cut,fill=cut))+geom_bar()+labs(title='Types of cuts')

# Scatterplot
ggplot(diamonds,aes(carat,price,color=cut))+geom_point()+labs(title = 'Caret vs Price')

# Box plot 
boxplot(price~cut, data=diamonds)
