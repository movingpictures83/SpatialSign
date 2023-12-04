library(AppliedPredictiveModeling)
transparentTheme(trans=.4)
library(caret)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
   # Need to get the three files
   csvfile <<- paste(pfix, parameters["csvfile", 2], sep="/")

   myData <<- read.csv(csvfile)
   mdrrClass <<- readLines(paste(pfix, parameters["classes", 2], sep="/"))
}

run <- function() {}

output <- function(outputfile) {

plotSubset <- data.frame(scale(myData[, c("nC", "X4v")])) 
transformed <- spatialSign(plotSubset)
transformed <- as.data.frame(transformed)
xyplot(nC ~ X4v,
       data = transformed,
       groups = mdrrClass,
       auto.key = list(columns = 2))
ggsave(
  outputfile
)


}
