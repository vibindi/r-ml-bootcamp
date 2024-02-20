v <- c(1,2,3)
m <- matrix(1:10, nrow=2)
df <- mtcars
my.list <- list(v,m,df)
my.list
my.named.list <- list(sample_vec=v, my.matrix=m, sample.df = df)
my.named.list
my.named.list['sample_vec']
my.named.list$sample_vec
my.named.list[['sample_vec']]
