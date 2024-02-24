library(ISLR)

head(iris)
summary(iris)

species <- iris[5]
features <- scale(iris[,-5])
var(features[,2])

scaled <- cbind(features, species)
head(scaled)

library(caTools)

set.seed(101)
sample <- sample.split(scaled$Species, SplitRatio=0.7)
train.data <- subset(scaled, sample == T)
test.data <- subset(scaled, sample == F)

library(class)

y_pred <-knn(train.data[,-5], test.data[,-5], train.data[,5], k=1)

y_pred

misclassError <- mean(y_pred != test.data[,5])
misclassError

# Choose K
predicted.purchase <- NULL
error.rate <- NULL

for (i in 1:10) {
  set.seed(101)
  y_pred <- knn(train.data[,-5], test.data[,-5], train.data[,5], k=i)
  error.rate[i] <- mean(y_pred != test.data[,5])
}

error.rate

# Elbow Method
library(ggplot2)
k.values <- 1:10
error.df <- data.frame(error.rate, k.values)

ggplot(error.df, aes(k.values, error.rate)) + geom_point() + geom_line(lty='dotted', color='red')
