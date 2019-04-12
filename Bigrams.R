Bigrams<- function(mytokens)
{
library(dplyr)
library(quanteda)
  
ngram <- tokens_ngrams(mytokens, n = 2)

mydfm_bi <- dfm(ngram, remove = stopwords())

trimdfm_2 <- dfm_trim(mydfm_bi, min_termfreq = 5, min_docfreq = 2)

TFIDF<- dfm_tfidf(trimdfm_2)

Len<- length(colnames(TFIDF))

Words<- colnames(TFIDF)[1:Len]

InMax<- docfreq(TFIDF, scheme = "inversemax")

Bigrams<- data.frame(Words,InMax)%>%arrange(desc(InMax))

Bigrams

}