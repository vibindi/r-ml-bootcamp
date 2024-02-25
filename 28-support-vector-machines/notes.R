library(ISLR)
print(head(iris))

#install.packages('e1071')
library(e1071)

help(svm)

model <- svm(Species ~ ., data = iris)

summary(model)

pred.values <- predict(model, iris)
pred.values
table(pred.values, iris[,5])

# cost is allowing soft margin
# gamma deals with non linear kernel functions; small gamma is gaussian with large variance

tune.results <- tune(svm, train.x=iris[1:4], train.y=iris[,5], kernel='radial', ranges=list(cost=c(0.1, 1, 10), gamma=c(0.1, 0.5, 0.7, 1, 2)))
summary(tune.results)

tuned.svm <- svm(Species ~ ., data=iris, kernel='radial', cost=1.5, gamma=0.1)
summary(tuned.svm)

pred.values <- predict(model, iris)
pred.values
table(pred.values, iris[,5])