# R_code_final_project.r    


##### I want to assess the effects on vegetation determined by fires happened in the Amazon forest during the summer of 2019
# In order to do this, I consider the NDVI, to asses the greenness of the area, and the FCover, to quantify the spatial extent of the vegetation, before, during and after the fires of 2019.
# I also add an analyses on fire disturbance and on land surface temperature.

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

# I add the coastlines to the map, to make the visualization easier 
# To do this I need the package rgdal, that allows to import raster and vector maps
install.packages("rgdal")
library(rgdal)
# I import the file with the coastline
coastlines <- readOGR("ne_10m_coastline.shp")
plot(coastlines, add=T)
# To obtain the final map with coastlines
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")

# I export the obtained map in png
png("NDVI january 2019 coastlines.png")
cl <- colorRampPalette(c("red","orange","yellow","green"))(100)
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
plot(coastlines, add=T)
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
#I add coastlines also here
plot(coastlines, add=T)

# I export the obtained map in png
png("NDVI december 2019 coastlines.png")
cl <- colorRampPalette(c("red","orange","yellow","green"))(100)
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
plot(coastlines, add=T)
dev.off()

# Now I want to see the difference in NDVI from january to december 2019
difNDVI2019 <- NDVIjan2019_SA-NDVIdec2019_SA
cldif <- colorRampPalette(c("blue","white","red"))(100)
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(coastlines, add=T)

# I save also this map
png("NDVI 2019 difference.png")
cldif <- colorRampPalette(c("blue","white","red"))(100)
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(coastlines, add=T)
dev.off()

# I can see the 3 maps in the same page with the par function
par(mfrow=c(1,3)) #1 row, 3 columns
# or
par(mfrow=c(3,1)) #1 column, 3 rows
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
plot(coastlines, add=T)
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
plot(coastlines, add=T)
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(coastlines, add=T)

# I can save it as a pdf --> not an high quality in this case
pdf("multiframeNDVI2019.pdf")
par(mfrow=c(1,3))
png("multiframeNDVI2019.png")
par(mfrow=c(1,3))
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
plot(coastlines, add=T)
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
plot(coastlines, add=T)
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(coastlines, add=T)
dev.off()
# Better in png
png("multiframeNDVI2019.png")
par(mfrow=c(1,3))
plot(NDVIjan2019_SA, col=cl, main="NDVI before fires season")
plot(coastlines, add=T)
plot(NDVIdec2019_SA, col=cl, main="NDVI after fires season")
plot(coastlines, add=T)
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(coastlines, add=T)
dev.off()

# Visualize the trend of variation of NDVI during 2019 
plot(NDVIjan2019_SA, NDVIdec2019_SA, main="NDVI variation during 2019", ylab="NDVI december", xlab="NDVI january")
# it is possible to prettify the graph, changing colors and symbols
plot(NDVIjan2019_SA, NDVIdec2019_SA, main="NDVI variation during 2019", ylab="NDVI december", xlab="NDVI january", col="darkgreen", pch=17, cex=0.5)

# Save it
png("Trend NDVI.png")
plot(NDVIjan2019_SA, NDVIdec2019_SA, main="NDVI variation during 2019", ylab="NDVI december", xlab="NDVI january", col="darkgreen", pch=17, cex=0.5)
dev.off()

##### Always considering the NDVI, I can extend my monitoring timeframe, taking into consideration also 2018 and 2020
# I upload data from january 2018, zooming on South America, changing the color palette and adding a title
NDVI2018 <- raster("c_gls_NDVI_201801010000_GLOBE_PROBAV_V2.2.1.nc")
plot(NDVI2018)
ext <- c(-100,-20,-60,20)
NDVI2018_SA <- crop(NDVI2018, ext)
plot(NDVI2018_SA, col=cl, main="NDVI one year before the fires")
plot(coastlines, add=T)

# Save it
png("NDVI 2018.png")
plot(NDVI2018_SA, col=cl, main="NDVI one year before the fires")
plot(coastlines, add=T)
dev.off()

# The same with data from december 2020
NDVI2020 <- raster("c_gls_NDVI_202006210000_GLOBE_PROBAV_V2.2.1.nc")
plot(NDVI2020)
ext <- c(-100,-20,-60,20)
NDVI2020_SA <- crop(NDVI2020, ext)
plot(NDVI2020_SA, col=cl, main="NDVI one year after the fires")
plot(coastlines, add=T)

# Save it
png("NDVI 2020.png")
plot(NDVI2020_SA, col=cl, main="NDVI one year after the fires")
plot(coastlines, add=T)
dev.off()

# Let's see the differences between 2018 and 2020
difNDVI2 <- NDVI2018_SA-NDVI2020_SA
cldif <- colorRampPalette(c("blue","white","red"))(100)
plot(difNDVI2, col=cldif, main="Difference in NDVI 2018 - 2020")
plot(coastlines, add=T)

# I want to see on the same page the difference in NDVI from 2018 to 2020 and during 2019, the year with most fires
par(mfrow=c(1,2))
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(coastlines, add=T)
plot(difNDVI2, col=cldif, main="Difference in NDVI 2018 - 2020")
plot(coastlines, add=T)
# Save it
png("multiframe NDVI diff.png")
par(mfrow=c(1,2))
plot(difNDVI2019, col=cldif, main="Difference in NDVI - 2019")
plot(coastlines, add=T)
plot(difNDVI2, col=cldif, main="Difference in NDVI 2018 - 2020")
plot(coastlines, add=T)
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
plot(coastlines, add=T)
Fcover2020_SA <- crop(FCover2020, ext)
plot(Fcover2020_SA, col=cl, main="FCover one year after the fires")
plot(coastlines, add=T)
# the resulting map has some white spaces in the northern and southern parts of the region; it may be caused by a lack of data or by the interference determined by some other variables?

# Save it
png("multiframe FCover.png")
par(mfrow=c(1,2))
plot(Fcover2018_SA, col=cl, main="FCover one year before the fires")
plot(coastlines, add=T)
plot(Fcover2020_SA, col=cl, main="FCover one year after the fires")
plot(coastlines, add=T)
dev.off()

##### I decide to consider also data from FIRE DISTURBANCE, that show the burnt areas where fires have determined significant effects on vegetation
# I upload data from january 2019 (before the fire season) and january 2020 (after the fires)
BurntArea2019 <- raster("c_gls_BA300_201901100000_GLOBE_PROBAV_V1.1.1.nc")
BurntArea2020 <- raster("c_gls_BA300_202001100000_GLOBE_PROBAV_V1.1.1.nc")

# Let's see the cropped maps of the two periods
# for 2019
ext <- c(-100,-20,-60,20)
BurntArea2019_SA <- crop(BurntArea2019, ext)
clf <- colorRampPalette(c("yellow","darkred"))(100)
plot(BurntArea2019_SA, col=clf, main="SA january 2019")
# for 2020
ext <- c(-100,-20,-60,20)
BurntArea2020_SA <- crop(BurntArea2020, ext)
plot(BurntArea2020_SA, col=clf, main="SA january 2020")
# even zooming in more it seems like there is no fire disturbance: this result is not coherent with the events and with the previous observations on vegetaion. A different approach would be needed.

par(mfrow=c(1,2))
plot(BurntArea2019_SA, col=clf, main="SA january 2019")
plot(BurntArea2020_SA, col=clf, main="SA january 2020")

# Save it anyway
png("multiframe fire disturbance.png")
par(mfrow=c(1,2))
plot(BurntArea2019_SA, col=clf, main="SA january 2019")
plot(BurntArea2020_SA, col=clf, main="SA january 2020")
dev.off()

##### What about the TEMPERATURE?
# I upload data about the Land Surface Temperature in august 2018, 2019 and 2020, to see if there are differences
T2018 <- raster("c_gls_LST10-TCI_201808110000_GLOBE_GEO_V1.2.1.nc")
T2019 <- raster("c_gls_LST10-TCI_201908110000_GLOBE_GEO_V1.2.1.nc")
T2020 <- raster("c_gls_LST10-TCI_202008110000_GLOBE_GEO_V1.3.0.nc")

# Crop on South America using the same ext as before
T2018_SA <- crop(T2018, ext)
T2019_SA <- crop(T2019, ext)
T2020_SA <- crop(T2020, ext)

# Plot them to see the result
par(mfrow=c(1,3))
plot(T2018_SA, main="Temperature august 2018")
plot(T2019_SA, main="Temperature august 2019")
plot(T2020_SA, main="Temperature august 2020")
# Here the canges in T are highly visible! We can even improove the aspect of the graphs using more relatable colors 
# a useful color scheme here: https://www.researchgate.net/figure/Appropriate-diverging-and-sequential-colour-schemes-for-the-following-climate-data-a_fig4_307824079
clT <- colorRampPalette(c("wheat2", "darkorange3", "orangered3", "red4"))(100)
par(mfrow=c(1,3))
plot(T2018_SA, col=clT, main="Temperature august 2018")
plot(T2019_SA, col=clT, main="Temperature august 2019")
plot(T2020_SA, col=clT, main="Temperature august 2020")
# August 2019 results as the month with higher % of red parts compared to 2018 and 2020
# This is coherent with the previous findings and represents a relation between fires, temperature rising and vegetation cover

# Save this last graph
png("multiframe temperature.png")
par(mfrow=c(1,3))
plot(T2018_SA, col=clT, main="Temperature august 2018")
plot(T2019_SA, col=clT, main="Temperature august 2019")
plot(T2020_SA, col=clT, main="Temperature august 2020")
dev.off()
