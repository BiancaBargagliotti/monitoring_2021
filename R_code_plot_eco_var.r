# R code for plotting the relationship among ecological variables

#install.packages is used to install packages
install.packages("sp")

library(sp)

# data is used to recall dataset
data(meuse)

# look inside the set
View(meuse)
head(meuse)

#Exercise: mean of all the variables?

summary(meuse)

#Exercise: plot zinc (y) against cadmium (x)
# error
plot (cadmium, zinc)
# Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'x' in selecting a method for function 'plot': oggetto "cadmium" non trovato

# how to explain to R that cadmium is inside the dataset
# $ will link cadmium to the dataset
plot (meuse$cadmium, meuse$zinc)

# or we can use the attach function
attach(meuse)
plot(cadmium, zinc)

plot(cadmium, lead)

# how to impress your supervisor
# Scatterplot Matrices
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
#from column 3 to column 6
pairs(meuse[,3:6])

# or how to use the names of the columns
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
