install.packages("tidyverse")
install.packages("janitor")
library(tidyverse)
library(lubridate)
library(janitor)
library(data.table)
library(readr)
library(psych)
library(dplyr)



table(info_final$sex)
table(info_final$race)
table(info_final$violation)


###Compare with the population
###Info available in https://data.census.gov
### S0601 2016/2017/2018: ACS 1-Year Estimates Subject Tables
#Data.census did not bring the number of population grouped by race so we need to calculate it

Population_2018= 660062
Population_2017= 665967
Population_2016= 660393

race <- c("black","American Indian and Alaska Native","asian/pacific islander",
          "other","hispanic","white")
race_2018 <- c(0.279,0.002,0.036,0.025,0.104,0.554)
race2018= Population_2018*race_2018
data2018 <- data.frame(race,race2018)
print(data2018)

race_2017 <- c(0.273,0.0,0.036,0.015,0.104,0.553)
race2017= Population_2017*race_2017
data2017 <- data.frame(race,race2017)
print(data2017)

race_2016 <- c(0.279,0.0,0.039,0.016,0.104,0.554)
race2016= Population_2016*race_2016
data2016 <- data.frame(race,race2016)
print(data2016)


poblation <- data.frame(race,race2016,race2017,race2018)
print(poblation)


####################################################################################
###Compare data 2016
Population_2016= 660393

info_final2016 <- filter(info_final,year == 2016)
table(info_final2016$year)


info_final2016 %>% 
  count(race) %>%  
  left_join(
    data2016,
    by = "race"
  ) %>%
  mutate(stop_rate = n / race2016)


####################################################


Population_2017= 665967

info_final2017 <- filter(info_final,year == 2017)
table(info_final2017$year)


info_final2017 %>% 
  count(race) %>%  
  left_join(
    data2017,
    by = "race"
  ) %>%
  mutate(stop_rate = n / race2017)

  
####################################################


Population_2018= 660062

info_final2018 <- filter(info_final,year == 2018)
table(info_final2018$year)


info_final2018 %>% 
  count(race) %>%  
  left_join(
    data2018,
    by = "race"
  ) %>%
  mutate(stop_rate = n / race2018)

((Population_2018/Population_2016)-1)*100
((count(info_final2018)/count(info_final2016))-1)*100

####################################################################
####Analysis of age


 age_consolidation <- c("18 to 24","25 to 44","45 to 54","55 to 64","65 to 74","75+")
 age2016 <- c(0.103,0.335,0.121,0.115,0.068,0.045)
 age2017 <-c(0.101,0.339,0.118,0.115,0.071,0.045)
 age2018 <- c(0.102,0.337,0.12,0.114,0.069,0.046)
 
 ageclass2016= Population_2016*age2016
 class2016 <-data.frame(age_consolidation,ageclass2016)
 print(class2016)
 

 info_final2016 %>% 
   count(age_consolidation) %>%  
   left_join(
     class2016,
     by = "age_consolidation"
   ) %>%
   mutate(age_rate = n / ageclass2016)
  ################################################################
 
 
 ageclass2017= Population_2017*age2017
 class2017 <-data.frame(age_consolidation,ageclass2017)
 print(class2017)
 
 
 info_final2017 %>% 
   count(age_consolidation) %>%  
   left_join(
     class2017,
     by = "age_consolidation"
   ) %>%
   mutate(age_rate = n / ageclass2017)
 

 ################################################################
 
 
 ageclass2018= Population_2018*age2018
 class2018 <-data.frame(age_consolidation,ageclass2018)
 print(class2018)
 
 
 info_final2018 %>% 
   count(age_consolidation) %>%  
   left_join(
     class2017,
     by = "age_consolidation"
   ) %>%
   mutate(age_rate = n / ageclass2018)

 ################################################################


Visualizations


ggplot(data = info_final) +
  geom_bar(mapping = aes(x = race,colour=sex,fill=sex)) +
  facet_wrap(~year)+
  theme(axis.text.x = element_text(angle = 90))

ggplot(data = info_final) +
  geom_bar(mapping = aes(x = sex,colour=race,fill=race)) +
  facet_wrap(~year)+
  theme(axis.text.x = element_text(angle = 90))


ggplot(data = info_final) +
  geom_bar(mapping = aes(x = violation,colour=race,fill=race)) +
  facet_wrap(~year)+
  theme(axis.text.x = element_text(angle = 90))

ggplot(data = info_final) +
  geom_bar(mapping = aes(x = violation,colour=sex,fill=sex)) +
  facet_wrap(~year)+
  theme(axis.text.x = element_text(angle = 90))

ggplot(data = info_final) +
  geom_bar(mapping = aes(x = violation,colour=age_consolidation,fill=age_consolidation)) +
  facet_wrap(~year)+
  theme(axis.text.x = element_text(angle = 90))

