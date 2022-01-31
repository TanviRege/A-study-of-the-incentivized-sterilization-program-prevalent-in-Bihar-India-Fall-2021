//importing NFHS excel file
import excel NFHS_data.xlsx, firstrow clear
des
drop I

//obtaining bar graphs to identify the most used contraceptive method:
graph twoway scatter Female_sterilization Male_sterilization IUD Pill Condom Year, connect(l l l l l) ytitle(Percentage of respondents opting for the method) xtitle(Year) title("Most used method of contraception") subtitle(from 1992 to 2019) ylabel(0(10)35)
graph export popular_method.tif 

//correlation of the methods of contraception with total fertility rate:
correlate Female_sterilization Male_sterilization IUD Pill Condom Total_fertility_rate, wrap




