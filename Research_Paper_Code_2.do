//importing dataset from NFHS-4 (2015 - 2016)
des
tab v101
//limiting dataset to only Bihar's observations
tostring v101, gen(strs)
keep if strs == "5"

//probit model to study the effect that amount of compensation, age and complete knowledge of consequences have on the uptake of female sterilization
probit sm303a i.s337 i.v320 i.v3a01 
ssc install outreg2
outreg2 using results1, word replace ctitle(Probit Model)

//to obtain predicted probability of opting for sterilization at each level of compensation
margins s337, atmeans


