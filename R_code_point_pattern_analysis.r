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
library(rgdal)

# read new files (downloaded and put into the lab folder) with rgdal
coastlines <- readOGR("ne_10m_coastline.shp")

plot(density_map, col=cl)
points(covid_planar)
plot(coastlines, add = TRUE)

#change colours:
cl <- colorRampPalette(c("pink", "green", "blue", "red")) (100)
plot(density_map, col=cl)

# change the type of points
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add = TRUE)

# how to save graphs as png and pdf:
png("figure1.png") 
cl <- colorRampPalette(c("pink", "green", "blue", "red")) (100)
plot(density_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add = TRUE)
dev.off()

pdf("figure1.pdf") 
cl <- colorRampPalette(c("pink", "green", "blue", "red")) (100)
plot(density_map, col=cl)
points(covid_planar, pch=19, cex=0.5)
plot(coastlines, add = TRUE)
dev.off()

# interpolate cases data
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)
plot(cases_map, col=cl)
plot(coastlines, add = TRUE)
points(covid_planar, pch=19, cex=0.5)

