#!/usr/bin/env Rscript

#######################
#load packages into R session
library(httr)
library(jsonlite)
library(optparse)

#######################
#arguments and help
args = commandArgs(trailingOnly=TRUE)
option_list = list(
  make_option(c("-t", "--target"), type="character", default=NULL, 
              help="target_id such as ENSG00000146648", metavar="character"),
  make_option(c("-d", "--disease"), type="character", default=NULL, 
              help="disease_id such as EFO_0000616", metavar="character"))

opt_parser = OptionParser(option_list=option_list)
opt = parse_args(opt_parser)

#######################
#query Opentargets association data 
get_ass <- GET("https://platform-api.opentargets.io/v3/platform/public/association/filter")
#convert GET response object to text 
get_ass_txt <- content(get_ass, "text", encoding = "UTF-8")
#convert txt data into JSON format
get_ass_json <- fromJSON(get_ass_txt, flatten=TRUE)
#get data from json format
get_ass_df <- get_ass_json$data

#######################
if(is.null(opt$target) && is.null(opt$disease)){
  print_help(opt_parser)
  stop("target_id or disease_id must be supplied", call.=FALSE)
  
} else if (is.null(opt$disease)) {
  #filter for target_id and print target_id, disease_id & association_score.overall 
  target_filtered <- get_ass_df[get_ass_df$target.id == as.character(opt$target),]
  wnt <- c("target.id", "disease.id", "association_score.overall")
  target_fin <- target_filtered[,wnt]
  #print target_id, disease_id & association_score.overall
  print(target_fin)
  #write maximum, minimum and average and standard deviation values of association_score.overall
  target_score <- target_fin$association_score.overall
  res_out <- data.frame(max=max(target_score), min=min(target_score),
                        mean=mean(target_score), sd=sd(target_score))
  rownames(res_out) <- paste0("association_score.overall of ", as.character(opt$target))
  print(res_out)
  
  
} else {
  #filter for disease_id 
  disease_df_filtered <- get_ass_df[get_ass_df$disease.id == as.character(opt$disease),]
  wnt <- c("target.id", "disease.id", "association_score.overall")
  disease_fin <- disease_df_filtered[,wnt]
  #print target_id, disease_id & association_score.overall
  print(disease_fin)
  #write maximum, minimum and average and standard deviation values of association_score.overall
  disease_score <- disease_fin$association_score.overall
  res_out <- data.frame(max=max(disease_score), min=min(disease_score),
                        mean=mean(disease_score), sd=sd(disease_score))
  rownames(res_out) <- paste0("association_score.overall for ", as.character(opt$disease))
  print(res_out)
  
}

#######################end of script

