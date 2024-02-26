df <- read.csv('ml-data/bank_note_data.csv')
head(df)

library(caTools)
set.seed(101)
split = sample.split(df$Class, 0.7)

train = subset(df, split == T)
test = subset(df, split == F)

library(neuralnet)

nn <- neuralnet(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy, data=train, hidden=10, linear.output=F)

y.pred <- compute(nn, test[1:4])
head(y.pred$net.result)

pred <- sapply(y.pred$net.result,round)
head(pred)

table(pred,test$Class)

library(randomForest)

df$Class <- factor(df$Class)

library(caTools)
set.seed(101)
split = sample.split(df$Class, 0.7)

train = subset(df, split == T)
test = subset(df, split == F)

model <- randomForest(Class ~ Image.Var + Image.Skew + Image.Curt + Entropy, data=train)
rf.pred <- predict(model,test)
table(rf.pred,test$Class)
