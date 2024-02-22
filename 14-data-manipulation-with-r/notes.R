### Guide to Using Dplyr
#install.packages('dplyr')
#install.packages('nycflights13') # a sample dataset
library(dplyr)
library(nycflights13)

head(flights)
str(flights)

summary(flights)

head(filter(flights, month==6, day==1, carrier=='AA'))

slice(flights, 1:10)

head(arrange(flights, year, month, day, air_time))

head(select(flights, carrier, arr_time))

head(rename(flights, airline_carrier=carrier))

distinct(select(flights, carrier))

mutate(flights, new_col=arr_delay - dep_delay) # returns whole df
transmute(flights, new_col=arr_delay - dep_delay) # only returns new column

summarize(flights, avg_air_time=mean(air_time, na.rm=T))
summarize(flights, tot_air_time=sum(air_time, na.rm=T))

sample_n(flights, 10)

sample_frac(flights, 0.001)

### Pipe Operator
# Chain together multiple operations
df <- mtcars

df %>% filter(mpg > 20) %>% sample_n(size=5) %>% arrange(desc(mpg))

### Guide to Tidyr
#install.packages('tidyr')
#install.packages('data.table')

library(tidyr)
library(data.table)

comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)
df

head(df %>% gather(Quarter,Revenue,Qtr1:Qtr4))
head(gather(df,Quarter,Revenue,Qtr1:Qtr4))

stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks

stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)

df <- data.frame(x = c(NA, "a.x", "b.y", "c.z"))
df

df %>% separate(x, c("ABC", "XYZ"))

unite(mtcars, "vs.am", c("vs","am"),sep = '.')

mtcars %>%
  unite(vs_am, vs, am) %>%
  separate(vs_am, c("vs", "am"))

