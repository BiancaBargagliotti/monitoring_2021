# Point pattern analysis

install.packages("spatstat")
library(spatstat)

# set the working directory and import data (already done)
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")
covid <- read.table("covid_agg.csv", header=TRUE)
covid

# density of covid data
# planar point pattern in spatstat with x, y and ranges:
attach(covid)
covid_planar <- ppp(lon, lat, c(-180, 180), c(-90, 90))

#density function
density_map <- density(covid_planar)
plot(density_map)
points(covid_planar)

#change colours of the map
cl <- colorRampPalette(c("yellow", "orange", "red", "magenta")) (100)
plot(density_map, col=cl)
points(covid_planar)

# Putting the countries ontop of the map
install.packages("rgdal")
