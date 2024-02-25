df1 <- read.csv('ml-data/winequality-red.csv', sep=';')
df2 <- read.csv('ml-data/winequality-white.csv', sep=';')

df1$label <- sapply(df1$pH, function(x) {'red'})
df2$label <- sapply(df2$pH, function(x) {'white'})

head(df1)
head(df2)

wine <- rbind(df1, df2)
str(wine)

library(ggplot2)

ggplot(wine,aes(x=residual.sugar)) + geom_histogram(aes(fill=label),color='black') + theme_bw()
ggplot(wine,aes(x=citric.acid)) + geom_histogram(aes(fill=label),color='black') + theme_bw()
ggplot(wine,aes(x=alcohol)) + geom_histogram(aes(fill=label),color='black') + theme_bw()
ggplot(wine,aes(x=citric.acid,y=residual.sugar)) + geom_point(aes(color=label),alpha=0.2) + theme_bw()
ggplot(wine,aes(x=volatile.acidity,y=residual.sugar)) + geom_point(aes(color=label),alpha=0.2) + theme_bw()

clus.data <- wine[,-13]
head(clus.data)

clus <- kmeans(wine[-13], 2)
clus$centers

table(clus$cluster, wine$label)