#install.packages('rpart')
library(rpart)

str(kyphosis)
head(kyphosis)

tree <- rpart(Kyphosis ~ ., method='class', data=kyphosis)
printcp(tree)

plot(tree, uniform=T, main='Kyphosis Tree')
text(tree)

#install.packages('rpart.plot')
library(rpart.plot)

prp(tree)

#install.packages('randomForest')
library(randomForest)

rf.model <- randomForest(Kyphosis ~ ., data=kyphosis)
print(rf.model)

rf.model$predicted
rf.model$ntree
rf.model$confusion