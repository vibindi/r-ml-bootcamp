### Arithmetic in R
8 %% 2
5 %% 3

### Variables
variable <- 100
variable

bank.account <- 10
bank.account

### R Data Types
# numerical (1, 3.2)
# logical (TRUE, FALSE, T, F)
# characters/strings ('', "")

### Vector Basics
nvec <- c(1,2,3,4,5)
nvec
class(nvec) # "numeric"

# all elements must be same class, else will be converted

temps <- c(72,71,68,50,75, 47, 90)
names(temps) <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
temps

### Vector Operations
v1 <- c(1,2,3)
v2 <- c(5,6,7)
v1 + v2
sum(v1)
sum.of.vec <- sum(v1)
sum.of.vec

### Comparison Operators
v <- c(1,2,3,4,5)
v < 2
vv <- c(10,20,30,40,50)
v < vv

### Vector Indexing and Slicing
v[2]
vv[2]
v[2:4]
v[c(1,4)]
temps['Tue']
temps[c('Mon', 'Tue', 'Wed')]
v[v > 2]
filter <- v > 2
v[filter]

### Getting Help in R
help('vector')
??vector
help.search('vector')
