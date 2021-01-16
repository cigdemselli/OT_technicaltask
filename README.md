# OT_technicaltask
This R script is to query the Open Targets REST API to get association_score.overall for a given target (gene Ensembl id) or disease (EFO id).

Running script without any parameters will give an error. Please provide a target_id such as ENSG00000146648 or disease_id such as EFO_0000616.

Installation of "httr", "jsonlite", and "optparse" R packages are required:

	install.packages("httr", repos="http://cran.us.r-project.org")
	install.packages("jsonlite", repos="http://cran.us.r-project.org")
	install.packages("optparse", repos="http://cran.us.r-project.org")

Example usage in a unix-like machine for a target_id:

	Rscript scriptOT.R -t ENSG00000146648

Example usage in a unix-like machine for a disease_id:

	Rscript scriptOT.R -d EFO_0000616

Make the script exectable to succesfully run it using:

	chmod +x scriptOT.R

To access help document:

	Rscript scriptOT.R --help

