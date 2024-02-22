library(ggplot2)
library(ggthemes)
library(data.table)

df <- fread('Desktop/r-ml-bootcamp/16-data-visualization-project/Economist_Assignment_Data.csv', drop=1)

head(df)

# Use ggplot() + geom_point() to create a scatter plot object called pl. You will need to specify x=CPI and y=HDI and color=Region as aesthetics
pl <-ggplot(df, aes(x=CPI, y=HDI)) + geom_point(aes(color=Region))
pl

# Change the points to be larger empty circles. (You'll have to go back and add arguments to geom_point() and reassign it to pl.) You'll need to figure out what shape= and size=
pl2 <- ggplot(df, aes(x=CPI, y=HDI)) + geom_point(aes(color=Region), size=4, shape=1)
pl2

# Add a trend line
pl3 <- pl2 + geom_smooth(aes(group=1), method='lm', formula=y~log(x), se=F, color='red')
pl3

# Add text
pl4 <- pl3 + geom_text(aes(label=Country, color=Region))
pl4

# Label subset
pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")
pl5 <- pl3 + geom_text(aes(label=Country), color="gray20", data=subset(df, Country %in% pointsToLabel), check_overlap = T)
pl5

# Add theme
pl6 <- pl5 + theme_economist_white()
pl6

# Add scale
pl7 <- pl6 + scale_x_continuous(limits=c(0.9, 10.5), breaks=1:10)
pl7