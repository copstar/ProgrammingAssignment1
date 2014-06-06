complete <- function(directory, id = 1:332) {
  files <- paste(getwd(), "/", directory, "/", substr(1000+id,2,4), ".csv", sep = "")
  df <- na.omit(do.call("rbind", lapply(files, read.csv, header = TRUE)) )
  df$ID <- factor(df$ID, levels = id)
  a <- aggregate(Date ~ ID,data = df, FUN = function(x) length(unique(x)))
  colnames(a)<-c("id","nobs")
  a
}