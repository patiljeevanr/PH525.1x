dat<-read.csv("mice_pheno.csv")
hfpop<-dat[dat$Sex=="F" & dat$Diet == "hf",3]
chowpop<-dat[dat$Sex=="F" & dat$Diet == "chow",3]

N<-5
hf<-sample(hfpop,N)
chow<-sample(chowpop,N)
t.test(hf,chow)

N<-12
alpha<-0.05
B<-10000
Ns<-seq(5,50,5) 

power<-sapply(Ns,function(N){
  rejections<-sapply(1:B,function(i){
    hf<-sample(hfpop,N)
    chow<-sample(chowpop,N)
    t.test(hf,chow)$p.value<alpha
  })
  return(mean(rejections))
})
plot(Ns,power)
mean(rejections)
