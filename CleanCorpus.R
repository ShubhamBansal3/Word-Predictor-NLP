CleanCorpus<- function(CorpusVec)
{
cleanSample <- tm_map(CorpusVec,
                      content_transformer(function(x){ 
                        iconv(x, to="UTF-8", sub="byte")}))
cleanSample <- tm_map(cleanSample, content_transformer(removePunctuation))
cleanSample <- tm_map(cleanSample, content_transformer(removeNumbers))
cleanSample <- tm_map(cleanSample, content_transformer(tolower))
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x) 
cleanSample <- tm_map(cleanSample, content_transformer(removeURL))
cleanSample <- tm_map(cleanSample, stripWhitespace)
#cleanSample <- tm_map(cleanSample, removeWords, stopwords("english"))
#cleanSample <- tm_map(cleanSample, removeWords, profanitywords)

cleanSample

}