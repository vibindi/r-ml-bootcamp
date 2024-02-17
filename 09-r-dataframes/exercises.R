# Ex 1: Recreate the following dataframe by creating vectors and using the data.frame function:
#	Age	Weight	Sex
# Sam	22	150	M
# Frank	25	165	M
# Amy	26	120	F

Age <- c(22, 25, 26)
Weight <- c(150, 165, 120)
Sex <- c('M', 'M', 'F')
df1 <- data.frame(Age, Weight, Sex)
rownames(df1) <- c('Sam', 'Frank', 'Amy')
df1

# Ex 2: Check if mtcars is a dataframe using is.data.frame()
is.data.frame(df1)

# Ex 3: Use as.data.frame() to convert a matrix into a dataframe:
mat <- matrix(1:25,nrow = 5)
mat
df3 <- as.data.frame(mat)
df3

# Ex 4: Set the built-in data frame mtcars as a variable df. We'll use this df variable for the rest of the exercises.
df <- mtcars

# Ex 5: Display the first 6 rows of df
head(df, 6)

# Ex 6: What is the average mpg value for all the cars?
mean(df$mpg)

# Ex 7: Select the rows where all cars have 6 cylinders (cyl column)
df[df$cyl == 6,]

# Ex 8: Select the columns am,gear, and carb.
df[c('am', 'gear', 'carb')]

# Ex 9: Create a new column called performance, which is calculated by hp/wt.
df$performance <- df$hp / df$wt
df

# Ex 10: Your performance column will have several decimal place precision. Figure out how to use round() (check help(round)) to reduce this accuracy to only 2 decimal places.
help(round)
df$performance <- round(df$performance, digits=2)
head(df)

# Ex 11: What is the mpg of the Hornet Sportabout?
df['Hornet Sportabout', 'mpg']