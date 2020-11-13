# R spatial

library(sp)
data(meuse)
head(meuse)

# explaining to R our coordinates
coordinates(meuse) = ~x+y

# spsplot is used to plot elements like zinc, cadmium, copper, ...
spplot(meuse, "zinc")
#give a title to the plot 
spplot(meuse, "zinc", main="concentration of zinc")

# exercise: plot the concentration of copper
spplot(meuse, "copper", main="concentration of copper")

# exercise: see copper and zinc using the same function
# same solution we used in the first lecture for primates
spplot(meuse, c("copper", "zinc"))

# use bubble function to create a bubble of spatial data, rather than colours
bubble(meuse, "zinc")

# exercise: do the same for lead
bubble(meuse, "lead")

#change the colour:
bubble(meuse, "lead", col="red")
