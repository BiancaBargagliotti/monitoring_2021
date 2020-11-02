#comment

#this is an array
primates <- c(3, 5, 9, 15, 40)
primates 

#new set:
crabs <- c(100, 70, 30, 10, 5)
crabs

#first plot in R
plot(primates, crabs)

plot(primates, crabs, col="red")

plot(primates, crabs, col="red", pch=19)

plot(primates, crabs, col="red", pch=19, cex=2)

plot(primates, crabs, col="red", pch=19, cex=6)

plot(primates, crabs, col="red", pch=19, cex=6, main="my first ecological graph in R!")

#create a data frame
ecoset <- data.frame(primates, crabs)

#ecological numbers
#mean of individuals per site
(3+5+9+15+40)

#summary
summary(ecoset)
