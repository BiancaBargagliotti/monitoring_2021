# R code for plotting the relationship among ecological variables

#install.packages is used to install packages
install.packages("sp")

library(sp)

# data is used to recall dataset
data(meuse)
meuse

# look inside the set
View(meuse) #it doesn't work for Mac
head(meuse) #see the frst few lines of the dataset

#Exercise: mean of all the variables?
summary(meuse)

#Exercise: plot zinc (y) against cadmium (x)
# we will receive an error
plot (cadmium, zinc)
# Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'x' in selecting a method for function 'plot': oggetto "cadmium" non trovato

# how to explain to R that cadmium is inside the dataset?
# $ will link cadmium to the dataset
plot (meuse$cadmium, meuse$zinc)

# or we can use the attach function
attach(meuse)
plot(cadmium, zinc)

plot(cadmium, lead)

# how to impress your supervisor
# Scatterplot Matrices (grafico a dispersione)
pairs(meuse)

# Exercise: pair only the element part of the dataset
# only cadmium, copper, lead, zinc...

###################

# recall library sp and data meuse
library(sp)
data(meuse)
pairs(meuse)
head(meuse)


# Exercise: pair only the element part of the dataset
# only cadmium, copper, lead, zinc...
# from column 3 to column 6 (that are the columns where there are cadmium, copper, lead and zinc)
pairs(meuse[,3:6])

# the same can be done using the names of the columns, preceded by ~ that means "equal"
pairs(~ cadmium + copper + lead + zinc, data=meuse)

# exercise: just use cadmium, lead, zinc
pairs(~ cadmium + lead + zinc, data=meuse)

#exercise: change the colour
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="red")
#code for different colours, 
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="#669966")

#exercise: change the symbols to filled triangle
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="#669966", pch=17)

#exercise: increase the size of filled triangle
pairs(~ cadmium + copper + lead + zinc, data=meuse, col="#669966", pch=17, cex=3)
