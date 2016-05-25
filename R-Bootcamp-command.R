## HMC R Bootcamp 2016
## Owner: Jeho Park
## Created: May 2016 (adapted from CIS R Workshop)
## Updated: May 25, 2016
## Github URL: https://github.com/jehopark/hmc-r-bootcamp-2016.git

#Look Ma, R can do Math!  ---------
1+1
2+runif(1,0,1)
2+runif(1,min=0,max=1)
3^2
3*3
sqrt(3*3) # comments
# comments are preceded by hash sign

# Even More Math! 

integrand <- function(x) {1/((x+1)*sqrt(x))} ## define the integrated function
integrate(integrand, lower=0, upper=Inf) ## integrate the function from 0 to infinity


# Some General Stuff -----------
demo() # display available demos
demo(graphics) # try graphics demo
library() # show available packages on the computer
search() # show loaded packages
?hist # search for the usage of hist function
??histogram # search for package documents containing the word "histogram"

# Workspace of R ------------
a <- 5 # notice a in your Environment window
A <- "text" 
a
A
ls()
print(c(a,A))
print(a,A)

# Vector -----------
# A vector is an array object of the same type data elements.
class(a)
class(A)
B <- c(a,A) # concatenation
print(B)
class(B) # why?

# List -------------
# A list is an object that can store different types of vectors. 
aList <- list(name=c("Joseph"), married=T, kids=2)
aList
aList$kids <- aList$kids+1
aList$kids
aList2 <- list(numeric_data=a,character_data=A)
aList2
allList <- list(aList, aList2)
allList # a list of lists

# Data Frame ----------
# A data frame is used for storing data tables. It is a list of vectors of equal length. 
n <- c(2, 3, 5) # a vector 
s <- c("aa", "bb", "cc") # a vector
b <- c(TRUE, FALSE, TRUE) # a vector
df <- data.frame(n, s, b) # a data frame
df
mtcars # a built-in (attached) data frame
mtcars$mpg

# Continued
myFrame <- data.frame(y1=rnorm(100),y2=rnorm(100), y3=rnorm(100))
head(myFrame) # display first few lines of data
names(myFrame) # display column names
summary(myFrame) # output depends on the data types
plot(myFrame)
myFrame2 <- read.table(file="http://scicomp.hmc.edu/data/R/Rtest.txt", header=T, sep=",")
myFrame2

# Subsetting --------
# Three operators: [, [[, and $
# -------------------
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
y[1]
y$bar

# Factor ------------
# Factors are a special compoud object used to represent categorical data such as gender, social class, etc.
# Factors have 'levels' attribute. They may be nominal or ordered.
v <- c("a","b","c","c","b")
x <- factor(v) # turn the character vector into a factor object
z <- factor(v, ordered = TRUE) # ordered factor
x
z
table(x)

# Function ------------
# commands that do something to an object in R
fun <- function(a,b) {
  a*b
}
fun   
fun(2,3) # a function call

# Statitical Tests ---------
## Classical Tests: Student t Test
# Independent Two Sample test
x <- rnorm(10)
y <- rnorm(10)
t.test(x,y)
# One sample test
data <- read.table(file="http://scicomp.hmc.edu/data/R/normtemp.txt", header=T)
names(data)
attach(data)
summary(Temp) 
# Graphical test for normality
qqnorm(Temp)
qqline(Temp)
plot(density(Temp))
# Non-graphical test for normality
shapiro.test(Temp) # Shapiro-Wilk normality test
# Now we are safe to use Student t test
t.test(Temp, mu=98.6)

## Linear Regression
attach(cars) #attach the data
plot(cars) #construct scatterplot
lm(dist ~ speed)
L1 <- lm(dist ~ speed) #save the result
plot(cars, main="dist = -17.579 + 3.932 speed", xlim=c(0, 25))
abline(-17.579, 3.932) #or more simply
abline(L1) # using the value we saved above.