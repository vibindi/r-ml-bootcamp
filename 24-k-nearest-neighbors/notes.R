#install.packages("ISLR")
library(ISLR)

str(Caravan)

summary(Caravan$Purchase)

any(is.na(Caravan))

var(Caravan[,1])
var(Caravan[,2])
# Scales are different for variables

# Standardize Variables
purchase <- Caravan[,86]
standardized.Caravan <- scale(Caravan[,-86])
var(standardized.Caravan[,1]) # 1
var(standardized.Caravan[,2]) # 1

# Train Test Split
test.index <- 1:1000

test.data <- standardized.Caravan[test.index,]
test.purchase <- purchase[test.index]

train.data <- standardized.Caravan[-test.index,]
train.purchase <- purchase[-test.index]

# KNN
library(class)

set.seed(101)

predicted.purchase <- knn(train.data, test.data, train.purchase, k=1)
head(predicted.purchase)
misclass.error <- mean(test.purchase != predicted.purchase)
misclass.error # 11.6%

# Choose K value
predicted.purchase <- NULL
error.rate <- NULL

for (i in 1:20) {
  set.seed(101)
  predicted.purchase <- knn(train.data, test.data, train.purchase, k=i)
  error.rate[i] <- mean(test.purchase != predicted.purchase)
}

error.rate

# Elbow Method
library(ggplot2)
k.values <- 1:20
error.df <- data.frame(error.rate, k.values)

ggplot(error.df, aes(k.values, error.rate)) + geom_point() + geom_line(lty='dotted', color='red')
