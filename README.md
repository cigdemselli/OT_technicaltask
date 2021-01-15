# OT_technicaltask
This R script is to query the Open Targets REST API to get association_score.overall for a given target or disease id.
running programme with no given parameters will give error.

Installation of "httr", "jsonlite", and "optparse" packages are required. You can use following code.
install.packages("httr").
install.packages("jsonlite").
install.packages("optparse").

Example usage in a unix like machine.
Rscript scriptOT.R -t target_id.
Rscript scriptOT.R -d disease_id.
Rscript scriptOT.R -t ENSG00000146648.
Rscript scriptOT.R -d EFO_0000616.
