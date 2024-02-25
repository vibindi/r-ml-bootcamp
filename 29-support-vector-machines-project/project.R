loans <- read.csv('ml-data/loan_data.csv')
str(loans)
summary(loans)

loans$inq.last.6mths <- factor(loans$inq.last.6mths)
loans$delinq.2yrs <- factor(loans$delinq.2yrs)
loans$pub.rec <- factor(loans$pub.rec)
loans$not.fully.paid <- factor(loans$not.fully.paid)
loans$credit.policy <- factor(loans$credit.policy)

library(ggplot2)

ggplot(loans, aes(fico)) + geom_histogram(aes(fill = not.fully.paid), color='black', alpha = 0.5) + scale_fill_manual(values = c('green','red')) + theme_bw()

ggplot(loans, aes(factor(purpose))) + geom_bar(aes(fill = not.fully.paid), position = "dodge") + theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

ggplot(loans,aes(int.rate, fico)) + geom_point(aes(color = not.fully.paid), alpha = 0.3) + theme_bw()

library(caTools)

set.seed(101)
s = sample.split(loans$not.fully.paid, 0.7)
train = subset(loans, s == T)
test = subset(loans, s == F)

library(e1071)

model <- svm(not.fully.paid ~ ., data = train)
summary(model)

y.pred <- predict(model, test[1:13])
table(y.pred, test$not.fully.paid)

tuned.results <- tune(svm, train.x = not.fully.paid ~ ., data = train, kernel = 'radial', ranges = list(cost = c(1, 10), gamma = c(0.1, 1)))
summary(tuned.results)

model <- svm(not.fully.paid ~ .,data = train,cost=10,gamma = 0.1)
predicted.values <- predict(model,test[1:13])
table(predicted.values, test$not.fully.paid)