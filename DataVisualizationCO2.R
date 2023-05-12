data("co2")
View(CO2)

# Box plot
boxplot(CO2$conc, CO2$Plant)

# Scatter plot
ggplot(CO2, aes(conc, uptake,color=Plant))+geom_point()+labs(title = 'Conc vs Uptake')

# Barchart
ggplot(CO2,aes(Type,fill=Type))+geom_bar()+labs(title = 'Type')

library(pheatmap)
library(reshape2)
ggplot(CO2,aes(conc,uptake))+geom_tile()+labs(title = 'Heatmap between Cons and uptake')

