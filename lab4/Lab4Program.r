# Name:Daniel Ocampo
# Names of all members in my group: Jesse Del Greco
# Date: 22 Sept 2017

# install.packages("dslabs")
# install.packages("dplyr")
# install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
library(dslabs)
library(dplyr)

####### Problem1

data(us_contagious_diseases)

dat <- filter(
  us_contagious_diseases,
  disease == "Measles",
  state != "Alaska",
  state != "Hawaii",
  weeks_reporting >= 40)

dat <- mutate(dat, rate = (count / population) * 100000)

####### Problem2

cali <- filter(dat, state == "California")

ggplot(data = cali) +
  geom_point(mapping = aes(x = year, y = rate)) +
  geom_vline(xintercept = 1957)

####### Problem3

dat50 <- filter(dat, year == 1950)
dat60 <- filter(dat, year == 1960)
dat70 <- filter(dat, year == 1970)

ggplot(data = dat50) +
  geom_histogram(mapping = aes(x = state, y = rate), stat = "identity")+
  coord_flip()

ggplot(data = dat60) +
  geom_histogram(mapping = aes(x = state, y = rate), stat = "identity")+
  coord_flip()

ggplot(data = dat70) +
  geom_histogram(mapping = aes(x = state, y = rate), stat = "identity")+
  coord_flip()

######
years <-  c(1950,1960, 1970)
dat580 <- filter( dat,year %in% years) 
ggplot(data = years) +
  geom_histogram(mapping = aes(x = state, y = rate), stat = "identity")+
  coord_flip()

############ problem 4 


ggplot(data = dat50) +
  geom_histogram(mapping = aes(x = state, y = rate), stat = "identity")+
  coord_flip()

