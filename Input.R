Input<- function(split_input){

source("Prediction Result.R",local = TRUE)
source("CleanCorpus.R",local = TRUE)

options(warn = -1)

library('tm')
library('quanteda')
library(sqldf)
library(RSQLite)
    
db <- dbConnect(SQLite(), dbname='NgramTables')


split_input<- tolower(split_input)
#split_input<- tolower(split_input)

MyInput<-Corpus(VectorSource(split_input))

MyInput<-CleanCorpus(MyInput)

CleanInput<- MyInput[[1]][1]$content

split_input <- strsplit(CleanInput, " ")
length <- length(split_input[[1]])


if (length == 0) {
  input <- c("" ,"" ,"" )
} else if (length == 1) {
  input <- c("" , "", split_input[[1]][(length)] )
}  else if (length == 2) {
  input <- c("", split_input[[1]][(length-1)], split_input[[1]][(length)] )
}  else  {
  input <- c(split_input[[1]][(length-2)], split_input[[1]][(length-1)], split_input[[1]][(length)])
}

input1 <- input[3]
input2 <- input[2]
input3 <- input[1]

Output<-PredictionResult(input1,input2,input3,length)

Output
}