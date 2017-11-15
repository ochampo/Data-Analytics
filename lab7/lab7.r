install.packages("gapminder")
install.packages("dslabs")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("psych")
library(gapminder)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(psych)
#rm(gapminder)

CSUS2011 <- read.clipboard.tab()
CSUS2011 <-food


describe(CSUS2011)
headTail(CSUS2011)

pairs.panels(CSUS2011)

CSUS2011 = CSUS2011 %>% na.omit()
outlier(CSUS2011)

cleaned <- scrub(CSUS2011, max=9)
error.bars(CSUS2011)

r <- lowerCor(CSUS2011)
corPlot(r)
corr.test(CSUS2011)

fa.parallel(CSUS2011)
vss(CSUS2011)

#gapminder[1,]

#populationdata <- gapminder

#year07 <- filter(
 # gapminder ,
 #year ==  2007 
  
#)
View(CSUS2011)
CSUS2011 = CSUS2011 %>% na.omit()
CSUS2011t <- na.omit(CSUS2011)



View(CSUS2011)
gdp07 <- select(year07,gdpPercap)
View(gdp07)
gdp07 <- rename(gdp07,gdpPercap07 = gdpPercap)

View(gdp07)
  
year06 <- filter(
  gapminder ,
  year ==  2006
  
)  
#rm(gdpbByyears)   

year05 <- filter(
  populationdata ,
  year ==  2005
  
)







#gapminder <- mutate( gapminder, avg = mean(gdpPercap,gdppercap))

write.csv(MyData, file = "MyData.csv")

