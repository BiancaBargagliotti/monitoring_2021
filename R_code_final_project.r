# R_code_final_project.r     https://volcano.si.edu/gvp_votw.cfm 
# setwd("/Users/yourname/lab/")
setwd("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/")
library(readxl)
eruptions <- read.table("GVP_Eruption_Results.csv", header=TRUE, sep=",",stringsAsFactors = FALSE)
summary(eruptions)
head(eruptions)

library(ggplot2)
ggplot(eruptions, aes(x=Latitude, y=Longitude)) + geom_point()


install.packages("readxl")

library("readxl")
read.table("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/GVP_Eruption_Results.csv")
read_excel("/Users/bianca/Desktop/GCE&SDGs/Monitoring Ecosystems/lab/GVP_Eruption_Results.xls")

library("readxl")
read_excel("C:\\Users\\Ron\\Desktop\\product_list.xlsx")
eruptions <- read_excel("GVP_Eruption_Results")
 
