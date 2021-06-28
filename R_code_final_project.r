# R_code_final_project.r    


# we need a library to read the data downloaded from Copernicus (https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home)
# we use ncdf4 library
install.packages("ncdf4")
library(ncdf4)
# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")
library(raster)

ndvi2016 <- raster("c_gls_NDVI_201606110000_GLOBE_PROBAV_V3.0.1.nc")
ndvi2016 #to check for the extension
ndvi2017 <- raster("c_gls_NDVI_201706110000_GLOBE_PROBAV_V3.0.1.nc")
ndvi2017 #to check for the extension
ndvi2018 <- raster("c_gls_NDVI_201806110000_GLOBE_PROBAV_V3.0.1.nc")
ndvi2018 #to check for the extension
ndvi2019 <- raster("c_gls_NDVI_201906110000_GLOBE_PROBAV_V3.0.1.nc")
ndvi2019 #to check for the extension
ndvi2020 <- raster("c_gls_NDVI_202006110000_GLOBE_PROBAV_V3.0.1.nc")
ndvi2020 #to check for the extension

# zoom in a part of the map
dev.off()
# extension of the zoom
ext <- c(0,20,35,55)
ndvi2016 <- crop(ndvi2016, ext)
ndvi2017 <- crop(ndvi2017, ext)
ndvi2018 <- crop(ndvi2018, ext)
ndvi2019 <- crop(ndvi2019, ext)
ndvi2020 <- crop(ndvi2020, ext)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(ndvi2016, col=cl, main="NDVI 2016")
plot(ndvi2017, col=cl, main="NDVI 2017")
plot(ndvi2018, col=cl, main="NDVI 2018")
plot(ndvi2019, col=cl, main="NDVI 2019")
plot(ndvi2020, col=cl, main="NDVI 2020")

dev.off() #to close the graphic plot
#difference between NDVI: 2020 - 2019
NDVIdiff1 <- ndvi2020 - ndvi2019
plot(NDVIdiff1, col=cl, main= "Difference in NDVI between 2019 and 2020")
#difference between NDVI: 2019 - 2018
NDVIdiff2 <- ndvi2019 - ndvi2018
plot(NDVIdiff2, col=cl, main= "Difference in NDVI between 2018 and 2019")
#difference between NDVI: 2018 - 2017
NDVIdiff3 <- ndvi2018 - ndvi2017
plot(NDVIdiff3, col=cl, main= "Difference in NDVI between 2017 and 2018")
#difference between NDVI: 2017 - 2016
NDVIdiff4 <- ndvi2017 - ndvi2016
plot(NDVIdiff4, col=cl, main= "Difference in NDVI between 2016 and 2017")
dev.off() 

#plotting all the images together and saving it
par(mfrow=c(1,4))
plot(NDVIdiff1, col=cl, main= "Difference in NDVI between 2019 and 2020")
plot(NDVIdiff2, col=cl, main= "Difference in NDVI between 2018 and 2019")
plot(NDVIdiff3, col=cl, main= "Difference in NDVI between 2017 and 2018")
plot(NDVIdiff4, col=cl, main= "Difference in NDVI between 2016 and 2017")


hist(NDVIdiff1, col="red")

###### e poi????



SWI2021 <- raster("c_gls_SWI1km_202102151200_CEURO_SCATSAR_V1.0.1.nc")
plot(SWI2021)

SWI2020 <- raster("c_gls_SWI1km_202002151200_CEURO_SCATSAR_V1.0.1.nc")
plot(SWI2020)

SWI2019 <- raster("c_gls_SWI1km_201902151200_CEURO_SCATSAR_V1.0.1.nc")
plot(SWI2019)
par(mfrow=c(3,3))
plot(SWI2021, main=1)
plot(SWI2020, main=2)
plot(SWI2019, main=3)

difSWI <- SWI2021 - SWI2020
#change colours
cldif <- colorRampPalette (c("blue", "white", "red"))(100) #
plot(difSWI, col=cldif)

difSWI2 <- SWI2020 - SWI2019
#change colours
cldif <- colorRampPalette (c("blue", "white", "red"))(100) #
plot(difSWI2, col=cldif)

difSWI3 <- SWI2021 - SWI2019
#change colours
cldif <- colorRampPalette (c("blue", "white", "red"))(100) #
plot(difSWI3, col=cldif)


SSM2021 <- raster("c_gls_SSM1km_202102150000_CEURO_S1CSAR_V1.1.1.nc")
