batting <- read.csv('Desktop/r-ml-bootcamp/capstone-data-project/Batting.csv')
head(batting)

str(batting)

head(batting$AB)
head(batting$X2B)

batting$BA <- batting$H / batting$AB

tail(batting$BA, 5)

batting$OBP <- (batting$H + batting$BB + batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR
batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR)) / batting$AB

str(batting)

sal <- read.csv('Desktop/r-ml-bootcamp/capstone-data-project/Salaries.csv')
head(sal)
summary(sal)

batting <- subset(batting, subset=yearID >= 1985)
summary(batting)

combo <- merge(batting, sal, by=c('playerID', 'yearID'))
summary(combo)

lost_players <- subset(combo, playerID %in% c('giambja01', 'damonjo01', 'saenzol01'))
lost_year <- subset(lost_players, subset=yearID == 2001)

players <- select(lost_year, playerID, H, X2B, X3B, HR, OBP, SLG, BA, AB)

# Replacement Players
library(dplyr)

summarize(players, sum_at_bats=sum(AB, na.rm=T)) # 1469
summarize(players, avg_obp=mean(OBP, na.rm=T)) # 0.3638687

combo.2001 <- subset(combo, subset=yearID == 2001 & salary <= 15000000)
combo.2001 <- select(combo.2001, playerID, AB, OBP, salary)
arrange(combo.2001, desc(AB), desc(OBP), salary)

# playerID  AB  OBP       salary
# suzukic01 692 0.3814714 $5,666,667
# stewash01 640 0.3710602 $2,183,333
# boonebr01 623 0.3722628 $3,250,000
