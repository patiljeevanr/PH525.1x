dat <- read.csv("mice_pheno.csv")
pop <- dat[dat$Sex=="F" & dat$Diet=="chow",3]
mu <- mean(pop)
N<-30 #assuming using CLT
#N <- 5 #for small sample size of 5 use t-test
y <- sample(pop,N)
Q <- qnorm(1-0.05/2)#assuming using CLT
#Q<-qt(1-0.05/2,4) #use t-test
plot(mu+c(-7,7),c(1,1),type="n",xlab="weights",
     ylab="interval",ylim=c(1,100))
abline(v=mean(pop))
for(i in 1:100){
  y <- sample(pop,N)
  se <- sd(y) / sqrt(N)
  interval <-c(mean(y)-Q*se , mean(y)+Q*se)
  color<-ifelse((interval[1]<=mean(pop) & interval[2]>=mean(pop)),1,2)
  lines(interval,c(i,i),col=color)
}
dat<-read.csv("femaleMiceWeights.csv")
t.test(dat[13:24,2],dat[1:12,2])
