# R code for the exam

# we need a library to read the data downloaded from Copernicus
# we use ncdf4 library
install.packages("ncdf4")
library(ncdf4)

# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# upload data using raster library and function
library(raster)
tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")
# obtain the graph with plot function
plot(tjan)

#change colours
cltjan <- colorRampPalette(c("669966", "330099", "003333"))
plot(tjan, col=cltjan)
