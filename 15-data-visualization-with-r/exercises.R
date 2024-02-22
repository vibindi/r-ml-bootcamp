library (ggplot2)
library(ggthemes)

head(mpg)

# Histogram of hwy mpg values:
ggplot(mpg, aes(x=hwy)) + geom_histogram(fill='red', alpha=0.6)

# Barplot of car counts per manufacturer with color fill defined by cyl count
ggplot(mpg, aes(x=manufacturer)) + geom_bar(aes(fill=factor(cyl)))

# Switch now to use the txhousing dataset that comes with ggplot2
head(txhousing)

# Create a scatterplot of volume versus sales. Afterwards play around with alpha and color arguments to clarify information.
ggplot(txhousing, aes(x=sales, y=volume)) + geom_point(color='blue', alpha=0.3)

# Add a smooth fit line to the scatterplot from above. Hint: You may need to look up geom_smooth()
ggplot(txhousing, aes(x=sales, y=volume)) + geom_point(color='blue', alpha=0.3) + geom_smooth(color='red')