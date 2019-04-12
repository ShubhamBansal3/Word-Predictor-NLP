Fourgrams<- function(mytokens)
{
  library(dplyr)
  
  ngram <- tokens_ngrams(mytokens, n = 4)
  
  mydfm_bi <- dfm(ngram)
  
  trimdfm_4 <- dfm_trim(mydfm_bi, min_termfreq = 5, min_docfreq = 2)
  
  TFIDF<- dfm_tfidf(trimdfm_4)
   
  Len<- length(colnames(TFIDF))
   
  Words<- colnames(TFIDF)[1:Len]
  
  
  InMax<- docfreq(TFIDF, scheme = "inversemax")
  
  Fourgrams<- data.frame(Words,InMax)%>%arrange(desc(InMax))
  
  Fourgrams
}