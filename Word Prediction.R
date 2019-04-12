library('tm')
library('quanteda')

setwd("D:/Capstone Project")

filepath<-  "D:/Capstone Project"

source("CreateSampleCorpus.R")
source("CleanCorpus.R")
source("RSQLite.R")
source("Input.R")

CorpusVec<- CreateSampleCorpus(filepath)

cleanSample<- CleanCorpus(CorpusVec)

rm(CorpusVec)

Quanteda_Corp<- corpus(cleanSample)

mytokens <- tokens(Quanteda_Corp, remove_punct = TRUE)

write_to_db_ngrams(mytokens)

db <- dbConnect(SQLite(), dbname='NgramTables')

#Trigrams<- dbGetQuery(db,"Select * from Trigrams")
#Bigrams<- dbGetQuery(db,"Select * from Bigrams")
#Fourgrams<- dbGetQuery(db,"Select * from Fourgrams")


MyInput<-"Something in the"
 
# MyInput<-Corpus(VectorSource(MyInput))
# 
# MyInput<-CleanCorpus(MyInput)
# 
# CleanInput<- MyInput[[1]][1]$content

CleanInput<- MyInput

Input(CleanInput)