library('tm')
library('quanteda')

CreateSampleCorpus<- function(filepath)
{
setwd(filepath)

ConnTwitter<- file("./final/en_US/en_US.twitter.txt")
Connblogs<- file("./final/en_US/en_US.blogs.txt")
ConnNews<- file("./final/en_US/en_US.news.txt")


Twitter<- readLines(ConnTwitter)
#Blogs<- readLines(Connblogs)
#News<- readLines(ConnNews)

#All<- c(Twitter,Blogs,News)
All<- c(Twitter)

Len<- length(All)

A<- sample(1:Len,1000000,replace = FALSE)

Sample<- All[A]

CorpusVec<- Corpus(VectorSource(Sample))

CorpusVec
}