### Overview of ggplot2
#install.packages('ggplot2')
library(ggplot2)
pl <- ggplot(data=mtcars, aes(x=mpg, y=hp))
pl2 <- pl + geom_point() + facet_grid(cyl ~ .) + stat_smooth()
pl2 + coord_cartesian(xlim=c(15,25)) + theme_bw()

### Histograms
#install.packages('ggplot2movies')
library(ggplot2movies)
pl <- ggplot(movies, aes(x=rating)) # data and aesthetics
# color='red', fill='pink', alpha=0.4,
pl2 <- pl + geom_histogram(binwidth=0.1, aes(fill=..count..)) # geometry
pl3 <- pl2 + xlab('Movie Rating') + ylab('Count') + ggtitle("My Title")
pl3

### Scatterplots
df <- mtcars
pl <- ggplot(df, aes(x=wt, y=mpg))
#pl2 <- pl + geom_point(size=5, alpha=0.5)
pl2 <- pl + geom_point(aes(size=hp, shape=factor(cyl), color=hp)) + scale_color_gradient(low='blue', high='red')
pl2

### Barplots
df <- mpg
pl <- ggplot(df, aes(x=class))
#pl2 <- pl + geom_bar(aes(fill=drv), position="fill")
pl2 <- pl + geom_bar(aes(fill=drv), position="dodge")
pl2

### Boxplots
df <- mtcars
pl <- ggplot(df, aes(x=factor(cyl), y=mpg))
# + coord_flip()
pl2 <- pl + geom_boxplot(aes(fill=factor(cyl))) + theme_bw()
pl2

### 2 Variable Plotting
pl <- ggplot(movies, aes(x=year, y=rating))
#pl2 <- pl + geom_bin2d(binwidth=c(3,1)) + scale_fill_gradient(high='red', low='blue')
#install.packages('hexbin')
library(hexbin)
#pl2 <- pl + geom_hex() + scale_fill_gradient(high='red', low='blue')
pl2 <- pl + geom_density2d()
pl2

### Coordinates and Faceting
pl <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
print(pl + coord_cartesian(xlim=c(1,4), ylim=c(15,30)))
print(pl + coord_fixed(ratio=1/3))
print(pl + facet_grid(. ~ cyl))
print(pl + facet_grid(drv ~ .))
print(pl + facet_grid(drv ~ cyl))

### Themes
#theme_set(theme())
#install.packages('ggthemes')
library(ggthemes)
pl <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point() + theme_wsj()
pl