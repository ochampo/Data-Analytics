library(gapminder)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(psych)

library(ctv)


finalProject <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/FinalProject/project390 - Sheet1.csv", header=TRUE, sep= ",")
View(finalProject)
### Does weather have anything to do with GDP growth 
finalProject[1,]
ggplot(data =  finalProject ) +
  geom_bar(mapping = aes( x = reorder(State,Avgweather), y = gdp , fill = Avgweather ), stat = "identity")+
  coord_flip()
### no dircet coorelation between them 

finalProject[1,]
ggplot(data =  finalProject ) +
  geom_bar(mapping = aes( x = State, y = gdp , fill = Femals), stat = "identity")+
  coord_flip()
#### Does population have anything with a greater GDP size, byt 
finalProject[1,]
ggplot(data =  finalProject ) +
  geom_bar(mapping = aes( x = reorder(State,gdp), y = gdp , fill = Male), stat = "identity")+
  geom_point(mapping = aes( x = reorder(State,gdp), y = gdp , color = Femals), stat = "identity")+
  coord_flip()
###########


