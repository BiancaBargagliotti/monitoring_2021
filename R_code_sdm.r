# Species distribution model
# R_code_sdm.r 

install.packages("sdm")
library(sdm)
library(raster)
library(rgdal)

# upload files from the package sdm
file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file) #or with readOGR function

#look at the set 
species

plot(species)

#to see all data of occurrence
species$Occurrence
#plot with blue all the presences and with red all the absences, creating a subset
#first for the presences
plot(species[species$Occurrence == 1,], col="blue", pch=17)
#then we add the absences
points(species[species$Occurrence == 0,], col="red", pch=17)

#predictors: look at the path
path <- system.file("external", package="sdm")
#list the predictors with the asc extenction 
lst <- list.files(path=path, pattern="asc$", full.names = T)
lst

#make a stack of files that are in the list
preds <- stack(lst)

#make a plot of predictors
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

#see maps of every predictor with the species 
#for elevation
plot(preds$elevation, col=cl, main="elevation")
points(species[species$Occurrence == 1,], col='black', pch=17)

#for temperature
plot(preds$temperature, col=cl, main="temperature")
points(species[species$Occurrence == 1,], col='black', pch=17)

#for precipitation
plot(preds$precipitation, col=cl, main="precipitation")
points(species[species$Occurrence == 1,], col='black', pch=17)

#for vegetation
plot(preds$vegetation, col=cl, main="vegetation")
points(species[species$Occurrence == 1,], col='black', pch=17)

#build a model
#set data from sdm
datasdm <- sdmData(train=species, predictors=preds)
datasdm

#model 
m1 <- sdm(Occurrence ~ elevation + temperature + precipitation + vegetation, data=datasdm, methods="glm")
#predictions
p1 <- predict(m1, newdata=preds)
plot(p1, col=cl)
points(species[species$Occurrence == 1,], col='black', pch=17)

#make a final stack
s1 <- stack(preds, p1)
plot(s1, col=cl)
