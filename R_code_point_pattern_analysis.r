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

########
# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# recall spatsta
library(spatstat)

# read the table
covid <- read.table("covid_agg_csv", header=TRUE)
covid

# ppp
attach(covid)
covid_planar <- ppp(lon,lat, c(-180,180), c(-90,90))

# mark ppp with cases
marks(covid_planar) <- cases
cases-map <- Smooth(covid_planar)

# colours:
cl <- colorRampPalette (c("cornflowerblue", "darkolivegreen3", "coral2", "brown") (100)
plot(cases_map, col=cl)
                        
# install library sf
install.packages("sf")
library(sf)
                        
# use sf
Spoints <- st_as_sf(covid, coords=c("lon", "lat"))
plot(Spoints, cex=Spoints$cases/10000, col="purple3", lwd=3, add=T)
                        
# now with rgdal
library(rgdal)
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)

####### Leonardo Zabotti data
# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# import data
leo <- read.table("dati_zabotti.csv", header=T, sep=",")
head(leo)
attach(leo)
                        
# recall spatstat
library(spatstat)
                        
# summarize data
summary(leo)
                        
# ppp
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))
plot(leo_ppp)
                        
# create a density map
density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)
                        
#save the workspace on R via Workspace > Salva Workspace
                        
######## Interpolation of students' data
                        
# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# load the previously saved workspace
load("point_pattern_analysis.RData")
# see the list of files inside RData
ls()

# see the database
head(leo)
                        
#recall spatstat
library(spatstat)
attach(leo)
marks(leo_ppp) <- chlh
chlh_map <- Smooth(leo_ppp)
plot(chlh_map)
points(leo_ppp)
                        
#change colours
cl <- colorRampPalette(c('yellow','orange','red','green'))(100)
plot(chlh_map, col=cl)
points(leo_ppp)
                        
# Exercise: do the same for chls in the sediment
marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map, col=cl)
points(leo_ppp)
                        
# multipanel
par(mfrow=c(1,3))
#first graph: density map
plot(density_map, col=cl)
points(leo_ppp)
#second graph: chlh
plot(chlh_map, col=cl)
points(leo_ppp)  
#third graph: chls
plot(chls_map, col=cl)
points(leo_ppp) 
                        
#exercise: build a multipnale with 3 rows and 1 column
par(mfrow=c(3,1))
#first graph: density map
plot(density_map, col=cl)
points(leo_ppp)
#second graph: chlh
plot(chlh_map, col=cl)
points(leo_ppp)  
#third graph: chls
plot(chls_map, col=cl)
points(leo_ppp) 
      
#save:
pdf("multiframe1.pdf")
par(mfrow=c(1,3))
#first graph: density map
plot(density_map, col=cl)
points(leo_ppp)
#second graph: chlh
plot(chlh_map, col=cl)
points(leo_ppp)  
#third graph: chls
plot(chls_map, col=cl)
points(leo_ppp) 
dev.off()
