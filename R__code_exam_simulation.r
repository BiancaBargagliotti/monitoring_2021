# R code for the exam

# we need a library to read the data downloaded from Copernicus
# we use ncdf4 library
install.packages("ncdf4")
library(ncdf4)

# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# upload data using raster library and function
library(raster)
#first for data from january 
tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
# obtain the graph with plot function
plot(tjan)

#change colours
cltjan <- colorRampPalette(c("669966", "330099", "003333"))(100) #
plot(tjan, col=cltjan)

#same for data from october
toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct)

#comparison between the two images
#difference between t in january and t in october
dift <- tjan - toct
#change colours
cldif <- colorRampPalette (c("blue", "white", "red"))(100) #
plot(dift, col=cldif)
