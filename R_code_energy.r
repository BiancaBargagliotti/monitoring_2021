# R_code_energy.r

# install package rasterdiv (has 3 packages on ndvi)
install.packages("rasterdiv")
library(rasterdiv)
library(raster)

#load data
data(copNDVI)
#plot data 
plot(copNDVI)

# reclassifyy daya, excluding some
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

# install also rasterVis
install.packages("rasterVis")
library(rasterVis)

levelplot(copNDVI)

# change colours in the plot
# yellow in the minimum part 
clymin <- colorRampPalette(c('yellow','red','blue'))(100) #
plot(copNDVI, col=clymin)

# yellow in the medium part 
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)

# yellow in the maximum part 
clymax <- colorRampPalette(c('red','blue','yellow'))(100) #
plot(copNDVI, col=clymax)

# or

clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

# 2 maps in the same page 
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) #
plot(copNDVI, col=clymax)

# zoom in a part of the map
dev.off()
# extension of the zoom
ext <- c(0,20,35,55)
# do the crop
copNDVI_Italy <- crop(copNDVI, ext)
# plot
plot(copNDVI_Italy, col=clymax)

# deforestation example
library(raster)
library(RStoolbox)

# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

#import data (1 layer, function raster; more layers function brick)
defor1 <- brick("defor1_.png")
defor1

#plot
plotRGB(defor1, 1, 2, 3, stretch="Lin")
