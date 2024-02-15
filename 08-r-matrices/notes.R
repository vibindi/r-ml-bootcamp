### Creating a Matrix
1:10
v <- 1:10
v
matrix(v)
matrix(v, nrow=2)
matrix(1:12, nrow=4, byrow=T)

goog <- c(450, 451, 452, 445, 468)
msft <- c(230, 231, 232, 245, 268)

stocks <- c(goog, msft)
stocks
stock.matrix <- matrix(stocks, byrow=T, nrow=2)
stock.matrix
days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
st.names <- c('GOOG', 'MSFT')
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
print(stock.matrix)

### Matrix Arithmetic
mat <- matrix(1:25, byrow=T, nrow=5)
mat
mat[mat > 15]

mat * mat
mat %*% mat # matrix multiplication

### Matrix Operations
colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)
FB <- c(101, 102, 203, 492, 102)
tech.stocks <- rbind(stock.matrix, FB)
tech.stocks
avg <- rowMeans(tech.stocks)
avg

tech.stocks <- cbind(tech.stocks, avg)
tech.stocks

### Matrix Selection and Indexing
mat <- matrix(1:50, byrow=T, nrow=5)
mat[1,]
mat[,1]
mat[1:2, 1:3]
mat[,9:10]

### Factor and Categorical Matrices
# Nominal Categorical Variables: without order
# Ordinal Categorical Variables: have order
animal <- c('d', 'c', 'd', 'c', 'c')
id <- c(1,2,3,4,5)
fact.ani <- factor(animal)
fact.ani
temps <- c('cold', 'med', 'hot', 'hot', 'hot', 'cold', 'med')
temps
fact.temp <- factor(temps, ordered=T, levels=c('cold', 'med', 'hot'))
fact.temp
summary(fact.temp)
summary(temps)