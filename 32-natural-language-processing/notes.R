### LOGIC 
# TF(d,t) -> term frequency, importance of term t within document d, number of occurences of term in doc
# IDF(t) = log(D / t) -> importance of term in the corpus, D number of documents, t is number of documents with the term t
# TF-IDF(term x within document y) = tf(x,y) * log(N / df_t)

#install.packages('tm',repos='http://cran.us.r-project.org')
#install.packages('twitteR',repos='http://cran.us.r-project.org')
#install.packages('wordcloud',repos='http://cran.us.r-project.org')
#install.packages('RColorBrewer',repos='http://cran.us.r-project.org')
#install.packages('e1017',repos='http://cran.us.r-project.org')
#install.packages('class',repos='http://cran.us.r-project.org')

getTwitterOAuth(consumer_key, consumer_secret)

args(grep)
grep('A', c('A','B','C','D','A'))

args(nchar)
nchar('helloworld')
nchar('hello world')

args(gsub)
gsub('pattern','replacement','hello have you seen the pattern here?')

print(paste('A','B','C',sep='...'))

substr('abcdefg',start=2,stop = 5)

strsplit('2016-01-23',split='-')

library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)

setup_twitter_oauth(consumer_key, consumer_secret, access_token=NULL, access_secret=NULL)

soccer.tweets <- searchTwitter("soccer", n=2000, lang="en")
soccer.text <- sapply(soccer.tweets, function(x) x$getText())

soccer.text <- iconv(soccer.text, 'UTF-8', 'ASCII') # remove emoticons
soccer.corpus <- Corpus(VectorSource(soccer.text)) # create a corpus

term.doc.matrix <- TermDocumentMatrix(soccer.corpus,
                                      control = list(removePunctuation = TRUE,
                                      stopwords = c("soccer","http", stopwords("english")),
                                      removeNumbers = TRUE,tolower = TRUE))

head(term.doc.matrix)
term.doc.matrix <- as.matrix(term.doc.matrix)

word.freqs <- sort(rowSums(term.doc.matrix), decreasing=TRUE) 
dm <- data.frame(word=names(word.freqs), freq=word.freqs)

wordcloud(dm$word, dm$freq, random.order=FALSE, colors=brewer.pal(8, "Dark2"))