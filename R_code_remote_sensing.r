# R code for remote sensing data analysis to monitor ecosystem changes in sp

# install two new packages
install.packages(c("raster", "RStoolbox"))

# recall these libraries
library(raster)
library(RStoolbox)

# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

# upload data (after unzipping the files directly in the lab folder)
p224r63_2011 <- brick("p224r63_2011_masked.grd")

