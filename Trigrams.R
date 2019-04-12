Trigrams<- function(mytokens)
{
  library(dplyr)
  
  ngram <- tokens_ngrams(mytokens, n = 3)
  
  mydfm_bi <- dfm(ngram, remove = stopwords())
  
  trimdfm_3 <- dfm_trim(mydfm_bi, min_termfreq = 5, min_docfreq = 2)
  
  TFIDF<- dfm_tfidf(trimdfm_3)
  
  Len<- length(colnames(TFIDF))
  
  Words<- colnames(TFIDF)[1:Len]
  
  InMax<- docfreq(TFIDF, scheme = "inversemax")
  
  Trigrams<- data.frame(Words,InMax)%>%arrange(desc(InMax))
  
}