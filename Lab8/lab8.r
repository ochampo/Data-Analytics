library(gapminder)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(psych)

library(ctv)
twoCountry <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/lab8Data.csv", header=TRUE, sep= ",")
View(twoCountry)
twoCountry[1,]

###### Question 1 ######The decline in marriage rates,

WifeBeater <- filter(
  twoCountry ,
  Indicator.Name ==  "Women who believe a husband is justified in beating his wife (any of five reasons) (%)"
  )

View(WifeBeater)

WifeBeater <- filter(
  WifeBeater, Country.Name == "Peru" | Country.Name == "Senegal")### Countries with the most data

write.csv(WifeBeater, file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/wifeBeater.csv")

WifeBeater <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/wifeBeaterLiner.csv", header=TRUE, sep= ",")


qplot(Peru, unmarried, data = WifeBeater, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest1Peru.png")
qplot(Senegal, unmarried, data = WifeBeater, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest1Senegal.png")
View(WifeBeater)
### we can see that that less women are less likely to let their husband beat the m 

LiteracyGender <- filter(#### this going to say if women are getting more educated, therefore make more money for themselves 
  twoCountry,
  Indicator.Name ==  "Literacy rate, adult female (% of females ages 15 and above)"
)

View(LiteracyGender)


LiteracyGender <- filter(#### this going to say if women are getting more educated, therefore make more money for themselves 
  LiteracyGender,
  Country.Name ==  "Spain" | Country.Name ==  "Turkey" 
)

write.csv(LiteracyGender, file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/LiteracyRate.csv")


LiteracyGender <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/LiteracyRateLiner.csv", header=TRUE, sep= ",")

qplot(Spain, unmarried, data = LiteracyGender, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest1Spain.png")
qplot(Turkey, unmarried, data = LiteracyGender, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest1Turkey.png")
View(LiteracyGender)



####################################### End Of Question 1 #################

############## Question 2 ############# The narrowing gender wage gap,
schooling <- filter(
  twoCountry ,
  Indicator.Name ==  "Expected years of schooling, female" 
  
  )

schooling <- filter(
  schooling ,
  Country.Name ==  "Finland" | Country.Name ==  "Greece"
  )

write.csv(schooling, file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/schooling.csv")


schooling <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/schoolingCor.csv", header=TRUE, sep= ",")


Finland <- select(schooling,Finland,Q1)
cor(Finland,method = "pearson")
Greece <- select(schooling,Greece,Q1)
cor(Finland)
pairs.panels(Finland)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest2Finland.png")
describe(schooling)
corPlot(Finland)
View(schooling)

####################### end of  Question 2  #############



### Question 3 ###### preference (or cultural) shift towards market work


laborforceGender <- filter(
  twoCountry ,
  Indicator.Name ==  "Labor force, female")


laborforceGender <- filter(
  laborforceGender ,  
  Country.Name  ==  "Mexico" | Country.Name  ==  "United States"
)

write.csv(laborforceGender, file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/laborforceGender.csv")



laborforceGender <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/laborforceGendergraph.csv", header=TRUE, sep= ",")  

test <- select(laborforceGender,MEX,Year)
View(test)
t.test(test)

laborforceGender[1,]

qplot(MEX, Year, data = laborforceGender, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest3Mexico.png")


laborforceGender %>% ggplot(aes(x = MEX, y = Year)) +
  geom_point(alpha = I(1/4)) + geom_smooth()
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest3Mexico2.png")


qplot(USA, Year, data = laborforceGender, alpha = I(1/4)) + geom_smooth(method = lm, se = F)
ggsave("/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/images/quest3USA.png")



View(laborforceGender)


















##### End of question 3 ##########
#### Question 4 ### The change in womens bargaining power within the household.

homeowners <- filter(
  twoCountry ,
  Indicator.Name ==  "Women who own a house alone (% of women age 15-49)"
)
View(homeowners)
#### was not able to obtain enough data for this one but most of the data showed that most country had little female house ownership 
### A house 

decisionMaker <- filter(
  twoCountry ,
 Indicator.Name ==  "Decision maker about a woman's own health care: mainly wife (% of women age 15-49)"
)
View(decisionMaker)

write.csv(decisionMaker, file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/decisionMaker.csv")


decisionMaker <- filter(
  decisionMaker ,
  Country.Name ==  "Peru" | Country.Name ==  "Bangladesh"
)

write.csv(decisionMaker, file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/decisionMaker.csv")

decisionMakerGraph <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/decisionMakerGraph.csv", header=TRUE, sep= ",")

summary(decisionMakerGraph)



decisionMakerGraph %>% ggplot(aes(x = Peru, y = Year)) +
  geom_point(alpha = I(1/4)) + geom_smooth()

decisionMakerGraph %>% ggplot(aes(x = Bangladesh, y = Year)) +
  geom_point(alpha = I(1/4)) + geom_smooth()




View(decisionMakerGraph)


major<- filter(
   twoCountry,
  Indicator.Name ==  "Decision maker about major household purchases: mainly husband (% of women age 15-49)" 
  )

major<- filter(
  major,
  Country.Name ==  "Peru" 
)

write.csv(major, file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/major.csv")

major <- read.csv(file = "/home/o/ocampod/fall2017/cs390-ochampoo/Data-Analytics/Lab8/Data/MarjorGraph.csv", header=TRUE, sep= ",")
ggplot(data = major) +
  geom_point(mapping = aes(x = Year, y = PER))
t.test(major)
View(major)


major %>% ggplot(aes(x = PER, y = Year)) +
  geom_point(alpha = I(1/4)) + geom_smooth()



###########End of question 4####


### Intresting Data 

womenHiv <- filter(
  twoCountry,
  Indicator.Name ==  "Women's share of population ages 15+ living with HIV (%)"
)


employ <- filter(
  twoCountry ,
  Indicator.Name ==  "Employment to population ratio, 15+, female (%) (modeled ILO estimate)
" | Indicator.Name ==  "Employment to population ratio, 15+, male (%) (modeled ILO estimate)
"
)


married <- filter(
  twoCountry ,
  Indicator.Name ==  "Women who were first married by age 18 (% of women ages 20-24)"
)


SavedForEducation <- filter(
  twoCountry ,
  Indicator.Name ==  "Saved for education or school fees, female (% age 15+) [w2]" | Indicator.Name ==  "Literacy rate, adult male (% of males ages 15 and above)
")

View(SavedForEducation)

laborforceGender <- filter(
  twoCountry ,
  Indicator.Name ==  "Labor force, female")

View(laborforceGender)

femaleWage <- filter(
  twoCountry ,
  Indicator.Name ==  "Wage and salaried workers, female (% of female employment)" | Indicator.Name ==  "Wage and salaried workers, male (% of male employment)"
)

Childemploy <- filter(
  twoCountry ,
  Indicator.Name ==  "Children in employment, female (% of female children ages 7-14)" | Indicator.Name ==  "Children in employment, male (% of male children ages 7-14)
"
)


business <- filter(
  twoCountry ,
  Indicator.Name ==  "Cost of business start-up procedures, female (% of GNI per capita)
" | Indicator.Name ==  "Cost of business start-up procedures, male (% of GNI per capita)"
)



View(twoCountry)

