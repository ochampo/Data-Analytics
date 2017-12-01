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

library(ctv)
task.views("Psychometrics")


#rm(gapminder)

#CSUS2011 <- read.clipboard.tab()
#CSUS2011 <-food
CSAvg <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab7/ConsumerSpending/lab7DataFixCol.csv", header=TRUE, sep= ",")


#### Pysch tutorial ###
boxplot(annualExpend ~ Age)
describe(CSAvg)
headTail(CSAvg)

pairs.panels(CSAvg)

outlier(CSAvg)

cleaned <- scrub(CSAvg, max=9)
error.bars(CSAvg)
View(CSAvg)
RandomData <- select(CSAvg, IncomeAfterTax,annualExpend,IncomeBeforeTax,HealthcareSpending)
View(RandomData)
lowerCor(RandomData)
View(income)
corPlot(RandomData)
corr.test(RandomData)

fa.parallel(RandomData)
vss(RandomData)
fa(RandomData)
iclust(RandomData)
omega(RandomData)
principal(RandomData)
CSAvg[1,]

CSyear00 <- filter(
  CSAvg ,
  Year  ==  2000
  )

View(CSyear00)

###########################Liner Regressions Question 1################################ 
## Do young people spend more on in 10 years? 

ages25 <- filter(
  
  CSAvg,
    Age == "Under 25 years"  )

View(ages25)
qplot(Year, AlcoholicSpending, data = ages25, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab7/quest1.png")
### It turns out that the data tells me that they consume less during expected ecpnomic downfalls. 
#populationdata <- gapminder

#year07 <- filter(
 # gapminder ,
 #year ==  2007 
  
#)
######## Question 2 ####################
# the Tech bubble occured in 2001
# health insurance among older people change? 
### Based on what I see health insurance has always gone up and does not seem to slow down of older people, seems to be where all of money is spent.  

Healthinsurance <- filter(
  
  CSAvg,Age == "65 years and older" )
View(Healthinsurance)


qplot(Year, HealthcareSpending, data = Healthinsurance, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab7/quest2.png")
##################Test######
#### ?   
HealthCor <- select(CSAvg,Year,HealthcareSpending)
View(HealthCor)
corr.test(HealthCor, method = "pearson")
mean(HealthCor, na.rm = T)
plot(HealthCor)
#ttest <- tibble::tribble( ~Observation, ~Colour, ~percentFull, 1,"Green", 70,
 #                               2,"Purple",30,
#                                3,"Green",50,
 #                               4,"Purple",20,
  #                              5,"Purple",15,
   #                             6,"Green",90,
    #                            7,"Purple",40,
     #                           8,"Green",60,
      #                          9,"Purple",15)#

#data_drinks <- data_drinks %>% select(Colour, percentFull)
#Run the t-test: a comparison of means.
#t.test(data = ttest,  ~ Colour) these are just test from previous class codes 

##### Question 3 #### How much of diffrence is 2000 from 2002? (The tech bubble )


twoData <- filter(HealthCor, Year == 2000 | Year == 2002)
View(twoData)
t.test(data = twoData,  HealthcareSpending ~ Year)
#t.test(data = HealthCor,  HealthcareSpending ~ Year)


#CSAvg$annualExpend <- factor(c(rep("wages", dim(wages)[1]), rep("pWages", dim(pWages)[1])))
#ggplot(CSAvg, aes(x=HealthcareSpending, y=annualExpend, col = dataset, shape = dataset)) + geom_point(alpha = I(1/4)) + geom_smooth( method = lm)





###### Question 4 ###### What is the diffrence in annual expenditure between 2008 and 2009? We must note that there was a real estate crisis going on during that time. 
#### average diffrence between was not a lot but there is less spent in 2009.
housingCrisis <- select(CSAvg, annualExpend,Year)
housingCrisis <- filter(housingCrisis, Year == 2008 | Year == 2009) 
View(housingCrisis)

t.test(data = housingCrisis,  annualExpend ~ Year)
 
##### question 5 ########## How much has annual spending changed throughout the years?
View(CSAvg)
ggplot(data = CSAvg) +
  geom_point(mapping = aes(x = Year, y = annualExpend, color = Age))
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/lab7/quest5.png")



## I see that certain age groups tend to buy more things, even though there are is huge market for the baby boomers usally people in their late 30s and early 40 tend to spend the most
### if I would want to start a bussiness I would want to get that markets. 




##### This was my first Idea, but is not going to be used but still good code for future refrence
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

