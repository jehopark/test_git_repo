## HMC R Bootcamp 2016
## Owner: Jeho Park
## Created: May 2016 (adapted from CIS R Workshop)
## Updated: May 25, 2016
## Github URL: https://github.com/jehopark/hmc-r-bootcamp-2016.git

# Some General Stuff ----
demo() # display available demos
demo(graphics) # try graphics demo
library() # show available packages on the computer
search() # show loaded packages
?hist # search for the usage of hist function
??histogram # search for package documents containing the word "histogram"

# Workspace of R ----
a <- 5 # notice a in your Environment window
A <- "text" 
a
A
ls()
print(c(a,A))

# Look Ma, R can do Math!  ---------
1+1
2+runif(1,0,1)
2+runif(1,min=0,max=1)
3^2
3*3
sqrt(3*3) # comments
# comments are preceded by hash sign

# Even More Math! ----

integrand <- function(x) {1/((x+1)*sqrt(x))} ## define the integrated function
integrate(integrand, lower=0, upper=Inf) ## integrate the function from 0 to infinity

# Vectors -----------
# A vector is an array object of the same type data elements.
class(a)
class(A)
B <- c(a,A) # concatenation
B # see the values
class(B) # why characters?

a <- rnorm(10)
a[3:5] <- NA # NA is a missing value
a
# Matrices ----
# A matrix is a two-dimensional rectangular object of the __same type__ (homogeneous) data elements. 
mat <- matrix(rnorm(6), nrow = 3, ncol = 2) 
mat # a matrix
dim(mat) # dimension
t(mat) 

# Lists -------------
# A list is an object that can store different types of vectors. 
aList <- list(name=c("Joseph"), married=T, kids=2)
aList
aList$kids <- aList$kids+1
aList$kids
aList2 <- list(numeric_data=a,character_data=A)
aList2
allList <- list(aList, aList2)
allList # a list of lists

# Data frames ----------
# A data frame is used for storing data tables. It is a list of vectors of equal length. 
n <- c(2, 3, 5) # a vector 
s <- c("aa", "bb", "cc") # a vector
b <- c(TRUE, FALSE, TRUE) # a vector
df <- data.frame(n, s, b) # a data frame
df
mtcars # a built-in (attached) data frame
mtcars$mpg

# Data fremes (Cont.)
myFrame <- data.frame(y1=rnorm(100),y2=rnorm(100), y3=rnorm(100))
head(myFrame) # display first few lines of data
names(myFrame) # display column names
summary(myFrame) # output depends on the data types
plot(myFrame)
myFrame2 <- read.table(file="http://scicomp.hmc.edu/data/R/Rtest.txt", header=T, sep=",")
myFrame2

# Factors ------------
# Factors are a special compoud object used to represent categorical data such as gender, social class, etc.
# Factors have 'levels' attribute. They may be nominal or ordered.
v <- c("a","b","c","c","b")
x <- factor(v) # turn the character vector into a factor object
z <- factor(v, ordered = TRUE) # ordered factor
x
z
table(x)

# Converting between different types ----
# Use of the as() family of functions. 
# Type as. and wait to see the list of as() functions.

integers <- 1:10
as.character(integers)
as.numeric(c('3.7', '4.8'))
indices <- c(1.7, 2.3)
integers[indices] # sometimes R is too generous
integers[0.999999999] # close to 1 but...
df <- as.data.frame(mat)
df

# Getting help online and offline ------
# See slides for more information

=======

## Working with Data -----

# Working with Raw Data -----
# Data import from a local folder
cpds <- read.csv(file.path('.', 'data', 'cpds.csv'))
head(cpds) # good to look at a few lines
class(cpds) # data.frame
# Data import from the Internet
data <- read.table(file="http://scicomp.hmc.edu/data/R/normtemp.txt", header=T)
tail(data) # show the last few lines
# Data import (advanced)
rta <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE)
dim(rta)
rta[1:5, 1:5]
class(rta)
class(rta$time) # what? let's see ?read.table more carefully
rta2 <- read.table("./data/RTADataSub.csv", sep = ",", head = TRUE, stringsAsFactors = FALSE)
class(rta2$time)

## Data Export -----
# Use write.table() to write data to a CSV file
write.csv(data, file = "temp.csv", row.names = FALSE) 
# Writing out plots
pdf('myplot.pdf', width = 7, height = 7) # call pdf() before calling plot()
x <- rnorm(10); y <- rnorm(10)
plot(x, y)
dev.off()

## Subsetting --------
# Three operators: [, [[, and $
x <- c("a", "b", "c", "c", "d", "a") # a character vector
x[1]
x[1:4]
x[x > "a"] 
u <- x > "a" # what's u here?
u
x[u] # subsetting using a boolean vector
y <- list(foo=x, bar=x[u])
y
y[[1]]
y$bar

## Data frame vs matrix ------
m = matrix(1:400000, 2, 200000) # esp. for a large number of columns!
d = as.data.frame(m)
object.size(m) # 1600200 bytes
object.size(d) # 22400568 bytes

## Creating a graph ----
attach(mtcars)
plot(wt, mpg) 
abline(lm(mpg~wt))
title("Regression of MPG on Weight")

## Manipulation graphs ----
par()              # view current settings
orig_par <- par()  # save current settings
par(col.lab="red") # red x and y labels 
plot(wt, mpg)      # create a plot with these new settings 
par(orig_par)      # restore original settings
plot(wt, mpg)
plot(wt, mpg, col.lab="red") # change settings withing plot()
