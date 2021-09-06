# R_code_final_project.r    


# I want to assess the consequences on vegetation of fires happened in the Amazon forest during the summer of 2019
# In order to do this, I consider the NDVI, to asses the greenness of the area, and the FCover, to quantify the spatial extent of the vegetation before, during and after the fires of 2019.

# The data used are downloaded from Copernicus 

# First, I set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# Now I install and recall all the packages I'll need for my project:
# To read the data from Copernicus is needed the package ncdf4
install.packages("ncdf4") 
library(ncdf4)
# To analyze spatial data is needed the package raster
install.packages("raster") 
library(raster)
# To create graphics is needed ggplot2
install.packages("ggplot2") 
library(ggplot2)
# For Remote Sensing Data Analysis is needed RStoolbox
install.packages("RStoolbox") 
library(RStoolbox)

# My first analysis will consider the NDVI before and after the fires season of 2019, comparing january with december 2019:
# Let's start with the data from january 2019
# I upload the data downloaded from Copernicus and put into the lab folder (I use "" because data are external to R)
NDVIjan2019 <- raster("c_gls_NDVI_201901010000_GLOBE_PROBAV_V2.2.1.nc")
# I plot them
plot(NDVIjan2019)

# I decide to plot a zoomed in part of the entire map, to concentrate on the area of the Amazon forest in South America
# To do this I select the minimum and maximum values of longitude and latitude for the area
ext <- c(-100,-20,-60,20)
NDVIjan2019_SA <- crop(NDVIjan2019, ext)
plot(NDVIjan2019_SA)
# I change the colors in the graph to better see the level of greenness and I add a title to it
cl <- colorRampPalette(c("red","orange","yellow","green"))(100)
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")

# I export the obtained map in png
png("NDVI january 2019.png")
cl <- colorRampPalette(c("red","orange","yellow","green"))(100)
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
dev.off()

# Now I repeat the same steps for the period after the fires season
# I consider the data from december 2019
NDVIdec2019 <- raster("c_gls_NDVI_201912210000_GLOBE_PROBAV_V2.2.1.nc")
# I plot them
plot(NDVIdec2019)

# I zoom in the area of South America
ext <- c(-100,-20,-60,20)
NDVIdec2019_SA <- crop(NDVIdec2019, ext)
plot(NDVIdec2019_SA)
# I use the same color palette as before to better compare my results
cl <- colorRampPalette(c("red","orange","yellow","green"))(100)
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")

# I export the obtained map in png
png("NDVI december 2019.png")
cl <- colorRampPalette(c("red","orange","yellow","green"))(100)
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
dev.off()

# Now I want to see the difference in NDVI from january to december 2019
difNDVI2019 <- NDVIjan2019_SA-NDVIdec2019_SA
cldif <- colorRampPalette(c("blue","white","red"))(100)
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")

# I save also this map
png("NDVI 2019 difference.png")
cldif <- colorRampPalette(c("blue","white","red"))(100)
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
dev.off()

# Always considering the NDVI, I can monitor the situation during the years 
