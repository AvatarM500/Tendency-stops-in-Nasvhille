#Analysis of traffic stops in Nashville 

#Source1 : E. Pierson, C. Simoiu, J. Overgoor, S. Corbett-Davies, D. Jenson, A. Shoemaker, 
#V. Ramachandran, P. Barghouty, C. Phillips, R. Shroff, and S. Goel.
#“A large-scale analysis of racial disparities in police stops across the United States”.
#Nature Human Behaviour, Vol. 4, 2020.
#Source 2:Stanford Open Policing Project data
#Source 3: https://data.census.gov

install.packages("tidyverse")
install.packages("janitor")
library(tidyverse)
library(lubridate)
library(janitor)
library(data.table)
library(readr)
library(psych)
library(dplyr)


NV <- read_csv("R_projects/tn_nashville_2020_04_01.csv")


#####Cleaning data

view(head(NV))
colnames(NV)
nrow(NV)
view(describe(NV))

#Change variable names

colnames(NV)[10] <- "age"
colnames(NV)[11] <- "race"
colnames(NV)[12] <- "sex"
colnames(NV)

# Setting global variable size to inf
options(future.globals.maxSize = Inf)


#Count rows with "na" values
colSums(is.na(NV))
sum(nrow(NV))

#Remove missing
clean1 <- NV[complete.cases(NV$race), ]
sum(nrow(clean1))

clean2 <- clean1[complete.cases(clean1$age), ]
sum(nrow(clean2))

clean_nv <- clean2[complete.cases(clean2$sex), ]
sum(nrow(clean_nv))

#Remove duplicates
clean_nv <- distinct(clean_nv)
sum(nrow(clean_nv))

#Check Cleaned data
colSums(is.na(clean_nv))


#Now, We have data which has information about age, sex, and race

# Check age of drivers/suspects
view(table(clean_nv$age))
adults_nv <- filter(clean_nv,age > 17)
nrow(adults_nv)
view(table(adults_nv$age))

#Check year of the analysis is from the last 3 years

adults_nv$year <- format(adults_nv$date, "%Y")


table(adults_nv$year)
colnames(adults_nv)
nrow(adults_nv)

#Check if all years are completed

adults_nv$month <- as.numeric(format(adults_nv$date, "%m"))
view(head(adults_nv))

table(adults_nv$year)
colnames(adults_nv)
nrow(adults_nv)

info_nv <- filter(adults_nv,year >2015)
nrow(info_nv)
table(info_nv$year)

info_final <- filter(info_nv,year < 2019)
table(info_final$year)
nrow(info_final)

#Create variable to analyze age

info_final$age_consolidation <- ifelse(info_final$age>17&info_final$age<25,"18 to 24",
               ifelse(info_final$age>24&info_final$age<45,"25 to 44",
                         ifelse(info_final$age>44&info_final$age<55,"45 to 54",
                                ifelse(info_final$age>54&info_final$age<65,"55 to 64",
                                       ifelse(info_final$age>64&info_final$age<75,"65 to 74","75+")))))
view(head(info_final))
nrow(info_final)

