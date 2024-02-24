library(ISLR)
head(College)
df <- College

library(ggplot2)
ggplot(df, aes(Room.Board, Grad.Rate)) + geom_point(aes(color=Private))
ggplot(df, aes(F.Undergrad)) + geom_histogram(aes(fill=Private), color='black')
ggplot(df,aes(Grad.Rate)) + geom_histogram(aes(fill=Private),color='black')

subset(df, Grad.Rate > 100)
df['Cazenovia College', 'Grad.Rate'] <- 100
subset(df, Grad.Rate > 100)

library(caTools)
set.seed(101)
sample = sample.split(df$Private, SplitRatio = .7)
train = subset(df, sample == T)
test = subset(df, sample == F)

library(rpart)
tree <- rpart(Private ~ ., method='class', data = train)
tree.pred <- predict(tree, test)
head(tree.pred)

tree.pred <- as.data.frame(tree.pred)
yesno <- function(x) {
  if (x>=0.5) {
    return('Yes')
  } else {
    return("No")
  }
}
tree.pred$Private <- sapply(tree.pred$Yes, yesno)
head(tree.pred)
table(tree.pred$Private,test$Private)

library(rpart.plot)
prp(tree)

library(randomForest)
rf.model <- randomForest(Private ~ ., data = train, importance = T)
rf.model$confusion

rf.model$importance

rf.pred <- predict(rf.model,test)
table(rf.pred, test$Private)