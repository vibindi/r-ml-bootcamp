library(MASS)

set.seed(101)
df <- Boston

str(df)
summary(df)

head(df)
any(is.na(df))

#install.packages('neuralnet')
library(neuralnet)

maxs <- apply(df, 2, max) 
mins <- apply(df, 2, min)

maxs
mins

scaled <- as.data.frame(scale(df, center=mins, scale=maxs-mins))
head(scaled)

library(caTools)

split = sample.split(scaled$medv, 0.7)

train = subset(scaled, split == T)
test = subset(scaled, split == F)

n <- names(train)
n

f <- as.formula(paste("medv ~", paste(n[!n %in% "medv"], collapse = " + ")))
f

nn <- neuralnet(f,data=train,hidden=c(5,3), linear.output=T)

plot(nn)

predicted.nn.values <- compute(nn,test[1:13])
str(predicted.nn.values)

true.predictions <- predicted.nn.values$net.result*(max(df$medv)-min(df$medv))+min(df$medv)

test.r <- (test$medv)*(max(df$medv)-min(df$medv))+min(df$medv)

MSE.nn <- sum((test.r - true.predictions)^2)/nrow(test)
MSE.nn

error.df <- data.frame(test.r,true.predictions)
head(error.df)

library(ggplot2)
ggplot(error.df,aes(x=test.r,y=true.predictions)) + geom_point() + stat_smooth()
