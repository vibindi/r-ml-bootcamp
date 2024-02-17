### Data Frame Basics
state.x77
women
LakeHuron
WorldPhones
head(state.x77)
tail(state.x77)
str(state.x77) # structure

days <- c('Mon', 'Tue', 'Wed')
temp <- c(22.2, 21.2, 25)
rain <- c(T, F, T)
df <- data.frame(days, temp, rain)
df

### Data Frame Indexing and Selection
df[1,] # row 1
df[,1] # col 1
df[, 'rain']
df[2:3, c('days', 'temp')]
df$days
df['days']
subset(df, subset = rain==T)
sorted.temp <- order(df[,'temp'])
sorted.temp
df[sorted.temp,]
desc.temp <- order(-df$temp)
desc.temp


### Data Frame Operations
empty <- data.frame()
c1 <- 1:10
c2 <- letters[1:10]
df <- data.frame(col.name.1=c1, col.name.2=c2)
df
df2 <- read.csv('file_name.csv')
write.csv(df, file='saved_df.csv')
nrow(df)
ncol(df)
colnames(df)
rownames(df)
str(df)
summary(df)
df[[5,2]]
df[[5, 'col.name.2']]
df[[2, 'col.name.1']] <- 9999
df
head(mtcars)
mtcars$mpg
head(mtcars[c('mpg', 'cyl')])
dfnew <- rbind(df, df)
dfnew
df$newcol <- 2 * df$col.name.1
df
df[,'newcol.copy'] <- df$newcol
colnames(df) <- c('1', '2', '3', '4')
colnames(df)[1] <- 'hello'
df[-2,] # everything but the second row
mtcars[mtcars$mpg > 20,]
mtcars[(mtcars$mpg > 20) & (mtcars$cyl == 6), c('mpg', 'cyl', 'hp')]
subset(mtcars, mpg > 20 & cyl == 6)
is.na(mtcars) # T/F Matrix
any(is.na(mtcars)) # are there any na values anywhere in df
mtcars$mpg[is.na(mtcars$mpg)] <- mean(mtcars$mpg)
