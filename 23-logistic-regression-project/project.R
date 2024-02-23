library(ggplot2)
library(caTools)
library(dplyr)

adult <- read.csv('ml-data/adult_sal.csv')
head(adult)
adult <- select(adult, -X)

head(adult)
str(adult)
summary(adult)

table(adult$type_employer)

unemployed <- function(employer) {
  employer <- as.character(employer)
  if (employer == 'Never-worked' | employer == 'Without-pay') {
    return ('Unemployed')
  } else {
    return (employer)
  }
}

adult$type_employer <- sapply(adult$type_employer, unemployed)
table(adult$type_employer)

group_employed <- function(employer) {
  if (employer == 'Local-gov' | employer == 'State-gov') {
    return('SL-gov')
  } else if (employer == 'Self-emp-inc' | employer == 'Self-emp-not-inc') {
    return ('self-emp')
  } else {
    return (employer)
  }
}
adult$type_employer <- sapply(adult$type_employer, group_employed)
table(adult$type_employer)

table(adult$marital)
group_marital <- function(mar){
  mar <- as.character(mar)
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed') {
    return('Not-Married')
  } else if(mar=='Never-married') {
    return(mar)
  } else {
    return('Married')
  }
}
adult$marital <- sapply(adult$marital, group_marital)
table(adult$marital)

table(adult$country)
Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')
North.America <- c('Canada','United-States','Puerto-Rico' )
Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')
Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')
group_country <- function(country) {
  if (country %in% Asia) {
    return('Asia')
  } else if (country %in% North.America) {
    return('North.America')
  } else if (country %in% Europe) {
    return('Europe')
  } else if (country %in% Latin.and.South.America) {
    return('Latin.and.South.America')
  } else {
    return('Other')      
  }
}
adult$country <- sapply(adult$country, group_country)
table(adult$country)

adult$type_employer <- sapply(adult$type_employer,factor)
adult$country <- sapply(adult$country,factor)
adult$marital <- sapply(adult$marital,factor)

library(Amelia)

adult[adult == '?'] <- NA

missmap(adult)

adult <- na.omit(adult)

ggplot(adult,aes(age)) + geom_histogram(aes(fill=income),binwidth=1) + theme_bw()

ggplot(adult,aes(hr_per_week)) + geom_histogram() + theme_bw()

names(adult)[names(adult)=="country"] <- "region"

ggplot(adult,aes(region)) + geom_bar(aes(fill=income))+theme_bw() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

set.seed(101) 
sample <- sample.split(adult$income, SplitRatio = 0.70)

train <- subset(adult, sample == T)
test <- subset(adult, sample == F)

model <- glm(income ~ ., family = binomial(logit), data = train)

new.step.model <- step(model)
summary(new.step.model)

test$predicted.income = predict(model, newdata=test, type="response")
table(test$income, test$predicted.income > 0.5)

(6372+1423)/(6372+1423+548+872) # accuracy
6732/(6372+548) # recall
6732/(6372+872) # precision