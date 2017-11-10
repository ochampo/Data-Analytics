# Date: 5 Nov 2017
# Basic Linear Regression: model creation

library(ggplot2)
library(dplyr)
library(tidyverse)

options(stringsAsFactors = FALSE)
w <-file.choose()
c <- file.choose()
#wages <- read.csv("wages.csv")
#crime <- read.csv("crime.csv")
wages <- read.csv(w)
crime <- read.csv(c)

# Estimating a function

mod <- lm(tc2009 ~ low, data = crime) # first model, set to variable mo

tc2009 ~ low
class(tc2009 ~ low)

mod # show the model details. Note the call and the coefficients
#more details about the model.
names(mod)
summary(mod)
predict(mod)
resid(mod)
coef(mod)
coefficients(mod)

qplot(low, predict(mod), data = crime, geom = "line")

qplot(low, tc2009, data = crime) + geom_smooth(method = lm)

qplot(low, tc2009, data = crime) +geom_smooth(se = FALSE, method = lm) # without shading in smooth
qplot(low, tc2009, data = crime) +geom_smooth(se = TRUE, method = lm) # with shading in smooth

#Consider This!
mod1 <- lm(tc2009 ~ low, data = crime)
mod2 <- lm(tc2009 ~ 1 + low, data = crime)

mod3 <- lm(tc2009 ~ 0 + low, data = crime)
mod4 <- lm(tc2009 ~ low - 1, data = crime)

# now get some details about each of the models.

summary(mod)
predict(mod) # predictions at original vals
resid(mod) # residuals
#END HERE FOR Monday


#####################################################

#####################################################

#####################################################


# Date: 7 Nov 2017
# Basic Linear Regression: Intepretation of models

# make a model to determine whether race (independent varliable) is being controlled by the (dependent variable)
# lm(dependent ~ independent)
mod1 <- lm(tc2009 ~ low, data = crime)
coef(mod1)

#> coef(mod1)
#(Intercept)         low 
#4256.86158    21.64725 


#rmod <- lm(earn ~ race, data = wages)

#plot the data
crime %>% ggplot(aes(x = low, y = tc2009)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)
crime %>% ggplot(aes(x = low, y = tc2009)) + geom_point(alpha = I(1/4)) + geom_smooth()
#Build the model
#mod1 <- lm(tc2009 ~ low, data = crime)



mod1$coefficients[1] # gives intercepts (when x=0, y = 4256.862)
mod1$coefficients[2] # gives slope = 21.65

tellMeY <- function(x_int){
  #function to get the y value for an entered x value
  # The best estimate of tc2009 for a state with low of inputted value x_int
  cat("  intercept :",mod1$coefficients[1] )
  cat("\n  slope     :",mod1$coefficients[2] )
  y = mod1$coefficients[1] + x_int * mod1$coefficients[2]
  cat("\n  y = ",y)
}

tellMeY(-10)
tellMeY(-60)

#show the model's line
crime %>% ggplot(aes(x = low, y = predict(mod1))) + geom_point(alpha = I(1/4)) + geom_smooth()
crime %>% ggplot(aes(x = low, y = predict(mod1))) + geom_point(alpha = I(1/4))



#You can explicitly ask for an intercept by including the number one, 1, as a formula term. You can remove the intercept by including a zero or negative 1.

# equivalent - includes intercept
lm(tc2009 ~ 1 + low, data = crime) 
lm(tc2009 ~ low, data = crime)

# equivalent - removes intercept 
lm(tc2009 ~ low - 1, data = crime) 
lm(tc2009 ~ 0 + low, data = crime)

# research question: Do taller people make more money than less tall people?
# Make the mode: What is earning power regressed over height?

hmod <- lm(earn ~ height, data = wages)

# plot the lines
wages %>% ggplot(aes(x = height, y = earn)) + geom_point(alpha = I(1/4)) + geom_smooth()
wages %>% ggplot(aes(x = height, y = earn)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)


# upnext: Model Inference


#####################################################

#####################################################

#####################################################

