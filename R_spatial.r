# R spatial

library(sp)
data(meuse)
head(meuse)

# explaining to R our coordinates fot he dataset meuse, always with the ~ as "equal"
coordinates(meuse) = ~x+y
plot(meuse)

# spplot is used to plot elements like zinc, cadmium, copper, ... spread in space
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

#install ggplot 2
install.packages("ggplot2")
library(ggplot2)

# same exercise as the first time with primates and crabs, to see the characteristics of ggplot2
# ecological dataframe
# relationship between biofuels and oxydative enzimes
# invent a variable with biofuels, to build a new set of data
biofuels <- c(120, 200, 350, 570, 750) # array of values : c
biofuels
# the same for oxydative enzimes
oxydative <- c(1200, 1300, 21000, 34000, 50000)
oxydative
# build the dataframe
d <- data.frame(biofuels, oxydative)
d

# plot the data with the ggplot function, same as data.frame 
# aes explains what are the variables that we want to consider
# geom_point is an additional part to the plot, to see data as points
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point() #relationship of our two variables in ggplot environment

#prettify the plot:
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size=5, col="red")

#change points with lines geom_line
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_line() 
#points + lines
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_point(size=5, col="red") + geom_line()
#polygons
ggplot(d, aes(x = biofuels, y = oxydative)) + geom_polygon()

########### IMPORT DATA FROM AN EXTERNAL SOURCE

# setwd("/Users/yourname/lab/")
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# import covid data from the folder: 
# covid is the name I give to this new dataset 
# read.table is the function to import external data
# header=TRUE is used to let R know that in this dataset data starts from the second line, while the first line contains the names of columns
covid <- read.table("covid_agg.csv", header=TRUE)

# to see if data have been successfully imported I recall the data with the name:
covid # press enter

# to have only the first 6 rows
head(covid)

# to have a summary of data
summary(covid)

# ggplot2
library(ggplot2)
ggplot(covid, aes(x = lon, y = lat)) + geom_point()

# change the size of dots according to the amount of cases per country
ggplot(covid, aes(x = lon, y = lat, size=cases)) + geom_point()
