# OT_technicaltask
This R script is to query the Open Targets REST API to get association_score.overall for a given target (gene Ensembl id) or disease (EFO id).

Running script without any parameters will give an error. Please provide a target_id such as ENSG00000146648 or disease_id such as EFO_0000616.

Installation of "httr", "jsonlite", and "optparse" packages are required. You can use following code:

install.packages("httr")

install.packages("jsonlite")

install.packages("optparse")

Example usage in a unix-like machine:

Rscript scriptOT.R -t target_id

Rscript scriptOT.R -d disease_id

Rscript scriptOT.R -t ENSG00000146648

Rscript scriptOT.R -d EFO_0000616

Make the script exectable to succesfully run it using: 

chmod +x scriptOT.R
