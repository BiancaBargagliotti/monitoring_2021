# R_code_final_project.r    


# we need a library to read the data downloaded from Copernicus
# we use ncdf4 library
install.packages("ncdf4")
library(ncdf4)
# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")
library(raster)

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
