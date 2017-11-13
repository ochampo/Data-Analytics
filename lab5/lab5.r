install.packages("dslabs")
install.packages("dplyr")
install.packages("tidyverse")
library(dslabs)
library(dplyr)
library(tidyverse)
library(ggplot2)




MyData <- read.csv(file= "/home/o/ocampod/Desktop/Expend.csv", header=TRUE, sep="\t")
View(MyData)
 
 
 #### the bar graph with geompoint, where countries are on the x - axisy, expenditure cover by life expectancy, gemon po
 
 
 quest1 <- filter(MyData, Year == 2014)
 quest1[,3] <- as.numeric(as.character(quest1[,3]))
 quest1[,4] <- as.numeric(as.character(quest1[,4]))
 ggplot(data = quest1) +
   geom_bar(mapping = aes( x =reorder( Country, Expenditure) , y = Expenditure), stat = "identity")
    
 ### ### the ratio question 2 
 
 
 
 quest2 <- mutate(quest1, Ratio = ( Expectation/Expenditure))
 ggplot(data = quest2)+
 geom_bar(mapping = aes( x = reorder(Country,Ratio) , y = Ratio), stat = "identity")
 
 #### question 3 save for later 
 
 
### question 4  
 
 
 
 
 
 ##### have these trends changed since last 10 years 
 
 quest5 <- filter(MyData, Year == 2014 | Year == 2010)
 
 geom_histogram(mapping = aes( x = Country , y = Expenditure)
                
                
  ##### Finish question 3 
  ### update 4 and 5 
  ### write up 
  ### DR. write up  
 
 
 
 
 