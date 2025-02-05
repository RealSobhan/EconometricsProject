clear
import delimited "G:/University/semester 7/Econometrics/Project/FinalResult.csv", clear

* First Stage
reg ineq predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel replace

xtset id year
xtreg ineq predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append 

predict ineq_hat, xb

* Reduce Form

** Total Crime
reg total_crime predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg total_crime predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append 

** Violent Crime
reg violent_crime predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg violent_crime predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append 

** Property Crime
reg property_crime predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg property_crime predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append 

** Robbery
reg robbery predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg robbery predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append 

** Aggravated Assault
reg aggravated_assault predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg aggravated_assault predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append 

** Burglary
reg burglary predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg burglary predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append 

***log

gen log_total_crime = log(total_crime + 1)
gen log_violent_crime = log(violent_crime + 1)
gen log_property_crime = log(property_crime + 1)

** Total Crime
reg log_total_crime predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg log_total_crime predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append

** Violent Crime
reg log_violent_crime predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg log_violent_crime predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append

** Property Crime
reg log_property_crime predicted_ratio_it, vce(cluster id)
outreg2 using Results.xls, excel append

xtreg log_property_crime predicted_ratio_it share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe vce(cluster id)
outreg2 using Results.xls, excel append

* 2SLS

** Total Crime
ivregress 2sls total_crime (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append



xtivreg total_crime (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append

** Violent Crime
ivregress 2sls violent_crime (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append 

xtivreg violent_crime (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append 

** Property Crime
ivregress 2sls property_crime (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append 

xtivreg property_crime (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append 

** Robbery
ivregress 2sls robbery (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append 

xtivreg robbery (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append 


** Aggravated Assault
ivregress 2sls aggravated_assault (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append 

xtivreg aggravated_assault (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append 

** Burglary
ivregress 2sls burglary (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append 


xtivreg burglary (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe
outreg2 using Results.xls, excel append 

***log

** Total Crime
ivregress 2sls log_total_crime (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append



xtivreg log_total_crime (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append

** Violent Crime
ivregress 2sls log_violent_crime (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append 

xtivreg log_violent_crime (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append 

** Property Crime
ivregress 2sls log_property_crime (ineq = predicted_ratio_it), cluster(id)
outreg2 using Results.xls, excel append 

xtivreg log_property_crime (ineq = predicted_ratio_it) share_of_male_aged_15_24 foreign_born male_householder_no_spouse_partn i.year, fe 
outreg2 using Results.xls, excel append 












