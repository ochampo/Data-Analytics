#install.packages("dslabs")
#install.packages("dplyr")
#install.packages("tidyverse")

library(dslabs)
library(dplyr)
library(tidyverse)
library(ggplot2)
### Worked with jesse Del greco
poliSciData <- read.table(file.choose(), header = TRUE, sep = ",")
#During the lab session next Friday, 20 th of October your group will give a short (5-10
#minute) presentation on the first two steps described above.
View(poliSciData)

poliSciData <- select(poliSciData,state,govtideo,citzideo,povrate)



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

 #test3 <- filter(
  #poliSciData ,
  #state == 	"texas"
  
#)


 

 
#test3 <- select(poliSciData,state,govtideo,citzideo)


#test3 <- arrange(test3, desc(state))
#hello <- mutate(test3,ave = rowMeans(test5, na.rm = FALSE, dims = 1))

#ggplot(data = poliSciData ) +
  #geom_bar(mapping = aes( x = state , y =  state ), stat = "identity")

#geom_point(mapping = aes(x = state, y = povrate, color = year97))



#ggplot(data = year97) + 
 # geom_line(mapping = aes(x = state, y = govtideo, color = year97))

year96 <- mutate( year96, diffrenceideo = abs(govtideo- citzideo))
year97 <- mutate( year97, diffrenceideo = abs(govtideo- citzideo))
year98 <- mutate( year98, diffrenceideo = abs(govtideo- citzideo))
###1
View(year97)

ggplot(data = year97) + 
geom_point(mapping = aes(x = reorder(state,diffrenceideo), y =  diffrenceideo))+
  coord_flip()
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab6/graph1.png")





#### question 2

ggplot(data = year97 ) +
  geom_bar(mapping = aes( x = reorder(state,diffrenceideo), y = diffrenceideo  ), stat = "identity")+
  coord_flip()
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab6/graph2.png")

#### question 3
year97[1,]
View(year97)
ggplot(data = year97) + 
  geom_bar(mapping = aes(x = reorder(state,govtideo),  y = povrate, fill = govtideo), stat = "identity")+
coord_flip()
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab6/graph3.png")




### question 4 
ggplot(data = year97) + 
  geom_bar(mapping = aes(x = reorder(state,citzideo),  y = povrate, fill = citzideo), stat = "identity")+
  coord_flip()
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab6/graph4.png")

### question 5 



