### Built-in R Features
seq(0, 100, by=2)

v<- c(1,4,7,9,2,71,3)
sort(v)
sort(v, decreasing=T)

rev(v)

str(v)
str(mtcars)

v <- 1:10
v2 <- 35:40
append(v,v2)

is.vector(v)
is.data.frame(v)

as.list(v)

### Apply
sample(x=1:10, 1)

addrand <- function(x) {
  ran <- sample(1:100, 1)
  return (x + ran)
}
addrand(10)

v <- 1:5
res <- lapply(v, addrand) # list apply; list output
res

times2 <- function(num) {
  return (num * 2)
}

res <- sapply(v,times2) # vector/matrix output
res

sapply(v, function(num){num * 2})

add_choice <- function(num, choice) {
  return (num + choice)
}

sapply(v, add_choice, choice=100)

### Math Functions in R
abs(-1)
sum(c(1:5))
mean(c(1:5))
round(1.29939)
round(1.298482, digits=3)

### Regular Expressions
text <- "Hello there, what is your favorite movie?"
grepl('movie', text)
grepl('dog', text)

v <- c('a', 'b', 'c', 'd', 'd')
grepl('b', v)

grep('b', v)
grep('d', v)

### Dates and Timestamps
today <- Sys.Date()
class(today)
as.Date("1990-01-01")
as.Date("June, 01, 2002", format="%B,%d,%Y")
as.POSIXct("11:02:03", format="%H:%M:%S")
strptime("11:02:03", format="%H:%M:%S")