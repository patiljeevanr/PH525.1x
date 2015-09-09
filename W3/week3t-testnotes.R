dat<-read.csv("femaleMiceWeights.csv")
dat

control <- dat[1:12,2]
treatment <- dat[13:24,2]
diff <- mean(treatment)-mean(control)
diff

t.test(treatment,control)

#using cLT

sd(control)/sqrt(length(control))

se <- sqrt(var(treatment)/length(treatment)+
             var(control)/length(control))

tstat <- diff/se
tstat

#p-value

1-pnorm(abs(tstat)) + pnorm(-abs(tstat))
##0.0398622 =! 0.053 not using CLT because sample size(12) is not big enough.

2*pnorm(-abs(tstat))
