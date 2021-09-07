# R_code_final_project.r    


##### I want to assess the consequences on vegetation determined by fires happened in the Amazon forest during the summer of 2019
# In order to do this, I consider the NDVI, to asses the greenness of the area, and the FCover, to quantify the spatial extent of the vegetation, before, during and after the fires of 2019.

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

# I can see the 3 maps in the same page with the par function
par(mfrow=c(1,3)) #1 row, 3 columns
# or
par(mfrow=c(3,1)) #1 column, 3 rows
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")

# I can save it as a pdf --> not an high quality
pdf("multiframeNDVI2019.pdf")
par(mfrow=c(1,3))
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
dev.off()
# Better in png
png("multiframeNDVI2019.png")
par(mfrow=c(1,3))
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
dev.off()

##### Always considering the NDVI, I can extend my monitoring timeframe, taking into consideration also 2018 and 2020
# I upload data from january 2018, zooming on South America, changing the color palette and adding a title
NDVI2018 <- raster("c_gls_NDVI_201801010000_GLOBE_PROBAV_V2.2.1.nc")
plot(NDVI2018)
ext <- c(-100,-20,-60,20)
NDVI2018_SA <- crop(NDVI2018, ext)
plot(NDVI2018_SA, col=cl, main="NDVI one year before the fires")
# Save it
png("NDVI 2018.png")
plot(NDVI2018_SA, col=cl, main="NDVI one year before the fires")
dev.off()

# The same with data from december 2020
NDVI2020 <- raster("c_gls_NDVI_202006210000_GLOBE_PROBAV_V2.2.1.nc")
plot(NDVI2020)
ext <- c(-100,-20,-60,20)
NDVI2020_SA <- crop(NDVI2020, ext)
plot(NDVI2020_SA, col=cl, main="NDVI one year after the fires")
# Save it
png("NDVI 2020.png")
plot(NDVI2020_SA, col=cl, main="NDVI one year after the fires")
dev.off()

# Let's see the differences between 2018 and 2020
difNDVI2 <- NDVI2018_SA-NDVI2020_SA
cldif <- colorRampPalette(c("blue","white","red"))(100)
plot(difNDVI2, col=cldif, main="Difference in NDVI 2018 - 2020")

# I want to see on the same page the difference in NDVI from 2018 to 2020 and during 2019, the year with most fires
par(mfrow=c(1,2))
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(difNDVI2, col=cldif, main="Difference in NDVI 2018 - 2020")
# Save it
png("multiframe NDVI diff.png")
par(mfrow=c(1,2))
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(difNDVI2, col=cldif, main="Difference in NDVI 2018 - 2020")
dev.off()

##### Now I can consider the FCover, to quantify the spatial extent of the vegetation before and after the fires of 2019
# I upload data from january 2018 and may 2020
FCover2018 <- raster("c_gls_FCOVER_201801240000_GLOBE_PROBAV_V1.5.1.nc")
FCover2020 <- raster("c_gls_FCOVER_202006130000_GLOBE_PROBAV_V1.5.1.nc")
# I plot them
plot(FCover2018)
plot(FCover2020)
# I zoom on South America, change the color palette and add a title
ext <- c(-100,-20,-60,20)
Fcover2018_SA <- crop(FCover2018, ext)
plot(Fcover2018_SA, col=cl, main="FCover one year before the fires")
Fcover2020_SA <- crop(FCover2020, ext)
plot(Fcover2020_SA, col=cl, main="FCover one year after the fires")
# the resulting map has some white spaces in the northern and southern parts of the region; it may be caused by a lack of data or by the interference determined by some other variables?

# Save it
png("multiframe FCover.png")
par(mfrow=c(1,2))
plot(Fcover2018_SA, col=cl, main="FCover one year before the fires")
plot(Fcover2020_SA, col=cl, main="FCover one year after the fires")
dev.off()

##### 

