# R_code_final_project.r    


# we need a library to read the data downloaded from Copernicus (https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home)
# we use ncdf4 library
install.packages("ncdf4")
library(ncdf4)
# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")
library(raster)

SWI21 <- raster("c_gls_SWI1km_202106021200_CEURO_SCATSAR_V1.0.1.nc")
clSWI21 <- colorRampPalette(c("tomato", "gold", "navy"))(100) #
plot(SWI21, col=clSWI21)

SWI20 <- raster("c_gls_SWI1km_202006021200_CEURO_SCATSAR_V1.0.1.nc")
plot(SWI20, col=clSWI21)

difSWI <- SWI21 - SWI20
plot(difSWI)
