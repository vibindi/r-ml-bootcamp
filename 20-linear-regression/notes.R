df <- read.csv('20-linear-regression/student-mat.csv', sep=';')
head(df)

#install.packages('caTools')
library(caTools)

set.seed(101)

sample <- sample.split(df$G3,  SplitRatio=0.7)

train <- subset(df, sample == T)
test <- subset(df, sample == F)

#model <- lm(y ~ x1 + x2, data)
#model <- lm(y ~ ., data) # use all features

model <- lm(G3 ~ ., data=train)

print(summary(model))

res <- residuals(model)

res <- as.data.frame(res)
head(res)

ggplot(res, aes(res)) + geom_histogram(fill='blue', alpha=0.5)

plot(model)

G3.predictions <- predict(model, test)

results <- cbind(G3.predictions, test$G3)
colnames(results) <- c('predicted', 'actual')
results <- as.data.frame(results)
head(results)

to_zero <- function(x) {
  if (x < 0) {
    return (0)
  } else {
    return (x)
  }
}

results$predicted <- sapply(results$predicted, to_zero)

mse <- mean((results$actual - results$predicted)^2)
mse

rmse <- mse^0.5
rmse

sse <- sum((results$predicted - results$actual)^2)
sse

sst <- sum(((mean(df$G3)) - results$actual)^2)
sst

r2 <- 1 - sse/sst
r2
