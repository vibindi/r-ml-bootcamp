### CSV Files with R
write.csv(mtcars, file='Desktop/r-ml-bootcamp/11-r-data-io/cars.csv')
ex <- read.csv('Desktop/r-ml-bootcamp/11-r-data-io/cars.csv')
ex

### Excel Files with R
#install.packages('readxl')
#install.packages('xlsx')
#library(readxl)
#library(xlsx)
excel_sheets('file.xlsx') # print all sheets
df <- read_excel(('file.xlsx'), sheet="Sheet1")
entire.workbook <- lapply(excel_sheets('file.xlsx'), read_excel, path="file.xlsx")
entire.workbook
write.xlsx(mtcars, "output.xlsx")

### Web Scraping with R
#install.packages('rvest')
#library(rvest)
lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
demo(package='rvest', topic='tripadvisor')
