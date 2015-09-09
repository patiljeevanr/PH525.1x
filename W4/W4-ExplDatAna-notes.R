library(UsingR)
x=father.son$fheight
# we will described how reporting the proportion
#of data points in a series of intervals 
#through a histogram. 

round(sample(x,20),1)


hist(x,breaks=  seq(floor(min(x)),ceiling(max(x))),
     main="Height Histogram",xlab="Height in inches")


# Empirical Cumulative Distribution Function
# it reports for any given no. the percent of individual that are below that threshold

xs<-seq(floor(min(x)),ceiling(max(x)),0.1)
plot(xs,ecdf(x)(xs),type="l",xlab="Heights in inches",ylab="F(x)")

#-------------------------------------------------
#Approximation by Normal Distri
mean(x>70)
1-pnorm(70,mean(x),sd(x))

ps<-seq(0.01,0.99,0.01)
qs<-quantile(x,ps)
normalqs<-qnorm(ps,mean(x),sd(x))
plot(normalqs,qs,xlab="Normal percentiles",ylab="height percentiles")
abline(0,1)

#OR

qqnorm(x)
qqline(x)

#-------------------------------------------------

#Boxplot 
#used when data is not normally distributed and when there is a large diff bw mean and median

boxplot(exec.pay,ylab="10,000s of dollars",ylim=c(0,300))

#--------------------------------------------------

#Scatter plot
data("father.son")
x=father.son$fheight
y=father.son$sheight

plot(x,y,xlab="Father's height in inches",ylab="Son's height in inches",
     main=paste("correlation =",signif(cor(x,y),2)))
abline(0,0.5)

#coorealation -> standardize two units then multiply them together take mean.

#stratifying data
boxplot(split(y,round(x)))
mean(y[round(x)==72])


#standardize the data 

x=(x-mean(x))/sd(x)
y=(y-mean(y))/sd(y)
means=tapply(y,round(x*4)/4,mean)

fathersheights=as.numeric(names(means))
plot(fathersheights,means,ylab="average of strata of son height",ylim=range(fathersheights))
abline(0,cor(x,y))
