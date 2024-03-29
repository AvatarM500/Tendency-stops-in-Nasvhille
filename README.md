Case study: Is there any tendency in the traffic stops in Nashville between 2016-2018?
=

This repository contains the details of the analysis of the stops in Nashville Tennessee in 2016, 2017, and 2018. The  purpose of the research is to identify 
any tendency for vehicular stops in the mentioned city. Variables of interest: Race, age, and sex. Here you can find the R code used for data validation, 
data cleaning, analysis, visualizations, and conclusion. 


Phase 1: Data validation, and  cleaning.
= 
-Ensure data accuracy and reliability of principal data and secondary sources of information.

-Filter out incomplete data on sex, age, and race. 

-Filter our stops of individuals under 18 years old.

-Convert dates into numeric variables.

Phase 2: Preparation
=

--For simplicity, divide the database according to the years and create a variable to consolidate the age into the census range, as:

  "18 to 24"        "25 to 44"        "45 to 54"        "55 to 64"        "65 to 74"        "75+"

--Update the variable's name 


Phase 3: Analysis
=

1. To understand the data's behavior, create a frequency table of the variables of interest: race, sex, age range, and type of violation
2. Compare variables of interest with the population of Nashville
3. Calculate the stop rate 

Phase 4: Visualizations
=

Context of data (Vehicular violation)
-
Child restraint

Investigative stop

Moving traffic violation

Parking violation

Registration

Safety violation

Seatbelt violation 

vehicle equipment violation

Graphics
-

- 1: Freq. of stops according to race and sex

  
  Secondary graphic: Freq. of stops according to sex and race to check the evolution between years

- 2: Kind of violations according to race
- 3: Kind of violations according to sex
- 4: Kind of violations according to age
 

Phase 5: Conclusions
=
--Stops in Nashville had a positive tendency between years of analysis due to the decrease of 31%, the principal factor was the fall of the rate of moving traffic violations by 33% equivalent to a difference of -49,287 stops. All violations had a positive tendency less registration than had  a light increase of 2.7%


--The black population has a higher probability of being stopped than other races, followed by the white race, Hispanics, and Asians in this city, it  has been not changed in the years of analysis.


--People between 25 and 44 have the highest stop rate as well as male gender

Sources: 
-


1. E. Pierson, C. Simoiu, J. Overgoor, S. Corbett-Davies, D. Jenson, A. Shoemaker, V. Ramachandran, P. Barghouty, C. Phillips, R. Shroff, and S. Goel. “A large-scale analysis of racial disparities in police stops across the United States”. Nature Human Behaviour, Vol. 4, 2020.
2. Stanford Open Policing Project data
3. https://data.census.gov


