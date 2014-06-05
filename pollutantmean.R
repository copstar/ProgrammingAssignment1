source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
submit(manual=TRUE)

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## This function returns the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  files <- paste(getwd(), "/", directory, "/", substr(1000+id,2,4), ".csv", sep = "")
  df <- do.call("rbind", lapply(files, read.csv, header = TRUE)) 
  round(mean(df[[pollutant]], na.rm = TRUE), digits = 3)
}

complete <- function(directory, id = 1:332) {
  files <- paste(getwd(), "/", directory, "/", substr(1000+id,2,4), ".csv", sep = "")
  df <- na.omit(do.call("rbind", lapply(files, read.csv, header = TRUE)) )
  df$ID <- factor(df$ID, levels = id)
  a <- aggregate(Date ~ ID,data = df, FUN = function(x) length(unique(x)))
  colnames(a)<-c("id","nobs")
  a
}


