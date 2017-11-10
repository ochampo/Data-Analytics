install.packages("dslabs")
install.packages("dplyr")
install.packages("tidyverse")
library(dslabs)
library(dplyr)
library(tidyverse)
library(ggplot2)
### Worked with jesse Del greco
poliSciData <- read.table(file.choose(), header = TRUE, sep = ",")
#During the lab session next Friday, 20 th of October your group will give a short (5-10
#minute) presentation on the first two steps described above.
View(poliSciData)

poliSciData <- select(poliSciData,state,govtideo,citzideo)
year96 <- filter(
  poliSciData  ,
  year ==  1996
  
)


year97 <- filter(
  poliSciData  ,
  year ==  1997
  
)


year98 <- filter(
  poliSciData  ,
  year ==  1998
  
)


#x <- runif(poliSciData,state=state)

 test3 <- filter(
  poliSciData ,
  state == 	"texas"
  
)


 

 
test3 <- select(poliSciData,state,govtideo,citzideo)


#test3 <- arrange(test3, desc(state))
#hello <- mutate(test3,ave = rowMeans(test5, na.rm = FALSE, dims = 1))

#ggplot(data = poliSciData ) +
  #geom_bar(mapping = aes( x = state , y =  state ), stat = "identity")

geom_point(mapping = aes(x = state, y = povrate, color = year97))



#ggplot(data = year97) + 
 # geom_line(mapping = aes(x = state, y = govtideo, color = year97))

year96 <- mutate( year96, diffrenceideo = abs(govtideo- citzideo))
year97 <- mutate( year97, diffrenceideo = abs(govtideo- citzideo))
year98 <- mutate( year98, diffrenceideo = abs(govtideo- citzideo))
###1
ggplot(data = year97) + 
geom_point(mapping = aes(x = state, y = diffrenceideo))+
  coord_flip()
ggplot(data = year97 ) +
  geom_bar(mapping = aes( x =state, y = diffrenceideo  ), stat = "identity")+
  coord_flip()
#### question 2

####
#### question 3
ggplot(data = year97) + 
  geom_point(mapping = aes(x = govtideo, y = povertyrate))+
  coord_flip()
### question 4 
ggplot(data = year97) + 
  geom_point(mapping = aes(x = govtideo, y = govtideo))+
  coord_flip()
### question 5 



