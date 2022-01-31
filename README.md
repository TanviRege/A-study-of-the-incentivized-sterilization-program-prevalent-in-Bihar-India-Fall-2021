# A-study-of-the-incentivized-sterilization-program-prevalent-in-Bihar-India
//Utilized STATA-16 to analyze data from India’s National Family Health Survey to identify the most popular contraception method and tested the effectiveness of incentivized sterilization with a probit regression model.
//Phase I - Identifying the contraception method that was the most popular one in Bihar (1992
- 2019) and examining whether it is the most effective one
//importing NFHS excel file
import excel NFHS_data.xlsx, firstrow clear
des
drop I

//obtaining bar graphs to identify the most used contraceptive method:
graph twoway scatter Female_sterilization Male_sterilization IUD Pill Condom Year,
connect(l l l l l) ytitle(Percentage of respondents opting for the method) xtitle(Year)
title("Most used method of contraception") subtitle(from 1992 to 2019) ylabel(0(10)35)
graph export popular_method.tif

//correlation of the methods of contraception with total fertility rate:
correlate Female_sterilization Male_sterilization IUD Pill Condom Total_fertility_rate,
wrap

//Phase II - Studying whether respondents in Bihar were more likely to opt for female
sterilization with higher compensation awards, age and complete knowledge
//importing dataset from NFHS-4 (2015 - 2016)
des
tab v101
//limiting dataset to only Bihar's observations

tostring v101, gen(strs)
keep if strs == "5"
//probit model to study the effect that amount of compensation, age and complete knowledge
of consequences have on the uptake of female sterilization
probit sm303a i.s337 i.v320 i.v3a01
ssc install outreg2
outreg2 using results1, word replace ctitle(Probit Model)

//to obtain predicted probability of opting for sterilization at each level of compensation
margins s337, atmeans

