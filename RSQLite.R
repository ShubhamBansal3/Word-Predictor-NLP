write_to_db_ngrams<- function(mytokens)
{
  
  
  setwd("D:/Capstone Project")  
  
source("Bigrams.R")
  
source("Trigrams.R")
  
source("Fourgrams.R")  
  
Bigrams<- Bigrams(mytokens)
Trigrams<- Trigrams(mytokens)
Fourgrams<- Fourgrams(mytokens)
  
Fourgrams$Words<- as.character(Fourgrams$Words)
Fourgrams$Key1<- sapply(strsplit(Fourgrams$Words, "_"),function(x){x[1]})
Fourgrams$Key2<- sapply(strsplit(Fourgrams$Words, "_"),function(x){x[2]})
Fourgrams$Key3<- sapply(strsplit(Fourgrams$Words, "_"),function(x){x[3]})
Fourgrams$Key4<- sapply(strsplit(Fourgrams$Words, "_"),function(x){x[4]})
Fourgrams<- arrange(Fourgrams,Key1,Key2,Key3,Key4)
  
  
Trigrams$Words<- as.character(Trigrams$Words)
Trigrams$Key1<- sapply(strsplit(Trigrams$Words, "_"),function(x){x[1]})
Trigrams$Key2<- sapply(strsplit(Trigrams$Words, "_"),function(x){x[2]})
Trigrams$Key3<- sapply(strsplit(Trigrams$Words, "_"),function(x){x[3]})
Trigrams<- arrange(Trigrams,Key1,Key2,Key3)
  
  
Bigrams$Words<- as.character(Bigrams$Words)
Bigrams$Key1<- sapply(strsplit(Bigrams$Words, "_"),function(x){x[1]})
Bigrams$Key2<- sapply(strsplit(Bigrams$Words, "_"),function(x){x[2]})
Bigrams<- arrange(Bigrams, Key1,Key2)
  
  
Fourgrams<- Fourgrams[,c(3:6,2)]
colnames(Fourgrams)[5]<- "Weight"

Trigrams<- Trigrams[,c(3:5,2)]
colnames(Trigrams)[4]<- "Weight"

Bigrams<- Bigrams[,c(3:4,2)]
colnames(Bigrams)[3]<- "Weight"

library(sqldf)

#Creating Database 
db <- dbConnect(SQLite(), dbname='NgramTables')

dbListTables(db)

dbRemoveTable(db, 'Bigrams')        # Remove the tables
dbRemoveTable(db, 'Trigrams')
dbRemoveTable(db, 'Fourgrams')


#Writing ngram tables to Database
dbWriteTable(conn = db, name = 'Bigrams', value = Bigrams, row.names = FALSE)
dbWriteTable(conn = db, name = 'Trigrams', value = Trigrams, row.names = FALSE)
dbWriteTable(conn = db, name = 'Fourgrams', value = Fourgrams, row.names = FALSE)

}  