
corr <- function(directory, threshold = 0) {
  # directory<-"specdata"
#   id<-1:332
#   files <- paste(getwd(), "/", directory, "/", substr(1000+id,2,4), ".csv", sep = "")
#   df <- na.omit(do.call("rbind", lapply(files, read.csv, header = TRUE)) )
  library(plyr)
  dfa<-ddply(df,"ID",function(x) length(unique(x$Date))) #hetzelfde als: dfa<-aggregate(df["Date"], by=df["ID"], FUN=length)
  colnames(dfa)<-c("ID","freq")
  dfc<-ddply(df,"ID",function(x) round(cor(x$nitrate,x$sulfate),digits=5))
  result<-merge(dfa,dfc,by.x="ID",by.y="ID")
  result$V1[result$freq>=threshold]
}
#   head(result$V1[result$freq>=150])
#   summary(result$V1[result$freq>=150])
