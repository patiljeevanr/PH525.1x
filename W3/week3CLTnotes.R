pops<-read.csv("mice_pheno.csv")
head(pops)

hf<-pops[pops$Diet=="hf" & pops$Sex=="F",3]
chow<-pops[pops$Diet=="chow" & pops$Sex=="F",3]

mean(hf)-mean(chow)

x<-sample(hf,12)
y<-sample(chow,12)

mean(x)-mean(y)

Ns<-c(3,5,10,25)
B<-10000
res<-sapply(Ns,function(n){
  sapply(1:B,function(j){
    mean(sample(hf,n))-mean(sample(chow,n))
  })
})
library(rafalib)
mypar2(2,2)
for(i in seq(along=Ns)){
  title<-paste("Avg=",signif(mean(res[,i]),3))
  title<-paste(title,"SD=",signif(sd(res[,i]),3))
  qqnorm(res[,i],main=title)
  qqline(res[,i])
}

