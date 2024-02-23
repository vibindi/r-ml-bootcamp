# Sigmoid (logistic function)
# s(z) = 1 / (1 + e^-z) -> [0,1]

# model evaluation --> confusion matrix
# actual vs predicted (yes and no)
# TP and TN, when correct
# FP (Type 1 error) and FN (Type 2 Error), when incorrect
# Accuracy: (TP + TN) / total
# Misclassification rate: (FP + FN) / total

df.train <- read.csv('22-logistic-regression/titanic_train.csv')
head(df.train)
str(df.train)

#install.packages('Amelia')
library(Amelia)

missmap(df.train, main='Missing Map', col=c('yellow', 'black'))

library(ggplot2)
ggplot(df.train, aes(Survived)) + geom_bar()
ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))
ggplot(df.train, aes(Age)) + geom_histogram(bins=20, alpha=0.5, fill='blue')
ggplot(df.train, aes(SibSp)) + geom_bar()
ggplot(df.train, aes(Fare)) + geom_histogram(fill='green', color='black', alpha=0.5)

pl <- ggplot(df.train, aes(Pclass, Age))
pl <- pl + geom_boxplot(aes(group=Pclass, fill=factor(Pclass)), alpha=0.4)
pl <- pl + scale_y_continuous(breaks=seq(min(0), max(80), by=2)) + theme_bw()
pl

impute_age <- function(age, class) {
  out <- age
  for (i in 1:length(age)) {
    if (is.na(age[i])) {
      if (class[i] == 1) {
        out[i] <- 37
      } else if (class[i] == 2) {
        out[i] <- 29
      } else {
        out[i] <- 24
      }
    } else {
      out[i] <- age[i]
    }
  }
  return (out)
}

fixed.ages <- impute_age(df.train$Age, df.train$Pclass)
df.train$Age <- fixed.ages
missmap(df.train, main='Imputation Check', col=c('yellow', 'black'))

library(dplyr)
df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)
head(df.train, 3)
str(df.train)

df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

str(df.train)

log.model <- glm(Survived ~ ., family=binomial(link='logit'), data=df.train)
summary(log.model)

## Train Test Split and Prediction
library(caTools)
set.seed(101)
split <- sample.split(df.train$Survived, SplitRatio=0.7)
final.train <- subset(df.train, split==T)
final.test <- subset(df.train, split==F)

final.log.model <- glm(Survived ~ ., family=binomial(link='logit'), data=final.train)
summary(final.log.model)

fitted.probs <- predict(final.log.model, final.test, type='response') # predict for classification
fitted.results <- ifelse(fitted.probs > 0.5, 1,0)

misclassError <- mean(fitted.results != final.test$Survived)
print(1 - misclassError) # accuracy
 
table(final.test$Survived, fitted.probs > 0.5)