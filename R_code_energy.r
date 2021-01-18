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
#try to replace colours
plotRGB(defor1, 2, 1, 3, stretch="Lin")

#import data for image 2
defor2 <- brick("defor2_.png")

#plot
plotRGB(defor2, 1, 2, 3, stretch="Lin")

#2 images in the same page
par(mfrow=c(1,2))
plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor2, 1, 2, 3, stretch="Lin")
#or 
par(mfrow=c(2,1))
plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor2, 1, 2, 3, stretch="Lin")

#dvi for the first period
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
dev.off()
plot(dvi1)
#change colours
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)

#dvi for the second period after the cuts
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

#2 dvis in the same page
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut") #with the title
plot(dvi2, col=cl, main="DVI after cut")

#difference in biomass before and after cuts
difdvi <- dvi1 - dvi2
dev.off()
cldif <- colorRampPalette(c('blue','white','red'))(100) # specifying a color scheme
plot(difdvi, col=cldif, main="amount of energy lost!")

#create an histogram
hist(difdvi, col="red")

#final part with first image, second image, dvi1, dvi2, difference in the dvis:
par(mfrow=c(3,2))
plotRGB(defor1, 1, 2, 3, stretch="Lin")
plotRGB(defor2, 1, 2, 3, stretch="Lin")
plot(dvi1, col=cl, main="DVI before cut") 
plot(dvi2, col=cl, main="DVI after cut")
plot(difdvi, col=cldif, main="amount of energy lost!")
hist(difdvi, col="red")
