# Multi analysis 
diabetesDataFrame<-read.csv("file:///C:/Users/deepa/Desktop/Assignment 1 (1)/Assignment 1/Deep Assignment/data-01.csv")
  
diabetesDataFrame

ls(diabetesDataFrame)

names(diabetesDataFrame)

str(diabetesDataFrame)


dim(diabetesDataFrame)

head(diabetesDataFrame)

tail(diabetesDataFrame)

View(diabetesDataFrame)

plot(diabetesDataFrame)

#nstall.packages('VIM')
library(VIM)

aggr(diabetesDataFrame)
x.df<-diabetesDataFrame
#subset
x.sub<-subset(x.df,select=Time<500)
x.sub
y.sub<-subset(x.df,select=Date<500)
y.sub

#nstall.packages("ggplot2")
library(ggplot2)

#Pre breakfast and Post breakfast during April and May 

PPbreafast<- subset(diabetesDataFrame,Code==c(58,59))

PPbreafast

plot(PPbreafast$Code,PPbreafast$Value)
## Here we observe that if we consider the whole data set we see the person has check only prebreakfast and has
## not taken any value of post breakfast. 
## Basically we can say that amongst all the 943 observation the post breakfast Code is not used
## and if we consider Lunch or supper it is seen that Post anything (Lunch,supper) is not taken 

# forming subset of NPH and Regular individually 

NPH<- subset(diabetesDataFrame,Code==c(34))
NPH
##Scatterplot

plot(NPH$Code,NPH$Value)

## In the above plot we see that The value of the code 34(NPH insulin dose) I more between 15 to 20 
## we observe that there are two outliers 
## this may be condition when patient had to take high value because of some reason(Very low glucouse level)

Regular<- subset(diabetesDataFrame,Code==c(33))
Regular 

plot(Regular$Code,Regular$Value)
Regular
## Here we can observe that Regular insulin has value between 2 to 12 and the data is suparate individually 
## there is no such exception case when the person had to take very high Value 



insulinGivenDataSet <- subset(diabetesDataFrame,Code == c(33,34,35))
rownames(insulinGivenDataSet) <- 1:nrow(insulinGivenDataSet)
head(insulinGivenDataSet)

## Scatter plot for the insulin dose and it's amount given

ggplot(insulinGivenDataSet,aes(x=Code,y=Value)) + geom_point() +
  labs(x="Insulin Codes",y="Insulin Dose Amount",title="Insulin dose and Amount")



