# Choose K where Within Group Sum Squares stops decreasing by a super large amount
library(ISLR)
print(head(iris))

library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color=Species)) + geom_point(size=4)

set.seed(101)
iris.cluster <- kmeans(iris[,1:4], centers = 3, nstart = 20)
iris.cluster

table(iris.cluster$cluster, iris$Species)

library(cluster)

clusplot(iris, iris.cluster$cluster, color=T, shade=T, labels=0, lines=0)

