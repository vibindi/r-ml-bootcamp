bike <- read.csv('ml-data/bikeshare.csv')
head(bike)

library(ggplot2)

ggplot(bike, aes(temp, count)) + geom_point(aes(color=temp), alpha=0.3)

bike$datetime <- as.POSIXct(bike$datetime)
ggplot(bike, aes(datetime, count)) + geom_point(aes(color=temp)) + scale_color_gradient(low='cyan', high='orange')

cor(bike[,c('temp', 'count')])

ggplot(bike, aes(factor(season), count)) + geom_boxplot(aes(color=factor(season)))

bike$hour <- sapply(bike$datetime, function(x) {
  format(x, "%H")
})

head(bike)

ggplot(subset(bike, workingday==1), aes(hour, count)) + geom_point(aes(color=temp), position=position_jitter(w=1, h=0)) + scale_color_gradient(low='blue', high='red')

ggplot(subset(bike, workingday==0), aes(hour, count)) + geom_point(aes(color=temp), position=position_jitter(w=1, h=0)) + scale_color_gradient(low='blue', high='red')

temp.model <- lm(count ~ temp, data=bike)
summary(temp.model)

#6.0462 + 9.1705*25
temp.test <- data.frame(temp=c(25))
temp.test
predict(temp.model, temp.test)

bike$hour <- sapply(bike$datetime, function(x) {
  format(x, "%H")
})
bike$hour <- sapply(bike$hour, as.numeric)

model <- lm(count ~ . - casual - registered - datetime - atemp, bike)
print(summary(model))
