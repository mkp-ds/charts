
library(datasets)

## x-y axis chart
plot(iris$Species)
plot(iris$Species,iris$Petal.Length)
plot(iris$Sepal.Length,iris$Sepal.Width)
plot(cars)

airsafetydata<- read.csv('C:/Users/xyz/Desktop/datasets/airline-safety.csv',header=TRUE,sep=",",quote="\"'")

## Bar chart --for Categorical variables
#library(datasets)
?mtcars
head(mtcars)

barplot(mtcars$cyl)  #Does NOT work as wanted-- need aggregation

cylinders <-table(mtcars$cyl) #creating aggregated table
barplot(cylinders)   # bar chart
plot(cylinders)      # x-y plot

## Histograms -- for Quantitative variables
head(iris)

hist(iris$Sepal.Length)
hist(iris$Petal.Width)

# put graphs in 3 rows & 1 column
par(mfrow=c(3,1))

#histogram for each species using options
#set of small graphs method -- i.e. repeat graphs for each item
hist(iris$Petal.Width [iris$Species=="setosa"],
xlim=c(0,3),
breaks=9,
main="Petal width for Setosa", # chart label
xlab="", # x axis label
col="red")

hist(iris$Petal.Width [iris$Species=="versicolor"],
     xlim=c(0,3),
     breaks=9,
     main="Petal width for Versicolor", # chart label
     xlab="", # x axis label
     col="blue")

hist(iris$Petal.Width [iris$Species=="virginica"],
     xlim=c(0,3),
     breaks=9,
     main="Petal width for Virginica", # chart label
     xlab="", # x axis label
     col="purple")

#Restore graphics parameter
par(mfrow=c(1,1))

#Scatter plots -- to visualize the association between 2 quantitative variables
hist(mtcars$mpg)
hist(mtcars$wt)

#basic x-y plot for 2 quantitative variables
plot(mtcars$wt,mtcars$mpg)

# overlay plots/charts on top of each other 
head(lynx)

hist(lynx)

hist(lynx,
     breaks=14,     # number of bins --a suggestion to R which it may or may not take
     freq=FALSE,    # axis shows density, not frequency
     col="thistle1", # color for histogram
     main=paste("Histogram of Annual Canadian Lynx Trappings, 1821-1934"),
     xlab="Number of Lynx Trapped")

#add a density normal(dnorm) distribution
curve(dnorm(x, mean= mean(lynx), sd=sd(lynx)),
     col="thistle4", # color for histogram
     lwd=2, # line width in pixels
     add=TRUE) # superimpose on previous graph
     
# add 2 kernel density estimators
lines(density(lynx), col = "blue",lwd=2)
lines(density(lynx,adjust=3), col = "purple",lwd=2)

## SUMMARY
summary(iris$Petal.Length)
summary(iris)
summary(iris$Species) # categorical variable

## PSYCH
#install.packages("psych",dependencies=TRUE) #the minimum requirement
#install.packages("psych", repos = "https://personality-project.org/r", type="source")
#library(psych)
#install.packages("ctv") #this downloads the task view package
#library(ctv) #this activates the ctv package

# ??psych

## DESCRIBE -- only for quantitative variables but not for categorical variables
describe(iris$Petal.Length)
describe(iris)

# selecting cases for analysis -- either by category or by value or both
hist(iris$Petal.Length [iris$Species=="setosa"], # by categorical var
     main="Petal Length for Setosa")

hist(iris$Petal.Length [iris$Petal.Width <2], # by quantitative var
     main="Petal Length when width<2")

# by both categorical & qty vars
hist(iris$Petal.Length [iris$Species=="setosa" & iris$Petal.Width <2], 
     main="Petal Length for Setosa when width<2")

#Create sub sample
#format: data[rows, columns]
i.setosa<- iris[iris$Species=="setosa",] # return all columns for "setosa" rows
head(i.setosa)
summary(i.setosa)