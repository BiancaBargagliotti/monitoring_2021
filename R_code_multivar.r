# R_code_multivar.r

# install vegan package and recall it
install.packages("vegan")
library(vegan)

# set the working directory
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")

#load the chosen file
load("biomes_multivar.RData")
#to see the list of files 
ls()

# plot per species matrix
head(biomes)

# see the correspondences among different species
multivar <- decorana(biomes) 
#recall it
multivar

#plot 
plot(multivar)
# biomes types 
attach(biomes_types)
# biomes names in the graph
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind="ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)

pdf("biomes.multivar.pdf")
multivar <- decorana(biomes) 
#recall it
multivar

#plot 
plot(multivar)
# biomes types 
attach(biomes_types)
# biomes names in the graph
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind="ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()
