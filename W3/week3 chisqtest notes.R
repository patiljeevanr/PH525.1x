tab<-matrix(c(180,40,20,10),2,2)
rownames(tab)<-c("AA or Aa","aa")
colnames(tab)<-c("Controls","Cases")
prop.table(tab)
#           Controls Cases
# AA or Aa     0.72  0.08
# aa           0.16  0.04
prop.table(tab,2)
#           Controls     Cases
# AA or Aa 0.8181818 0.6666667
# aa       0.1818182 0.3333333
prop.table(tab,1)
#           Controls Cases
# AA or Aa      0.9   0.1
# aa            0.8   0.2
ctest<-chisq.test(tab)
ctest
# 
# Pearson's Chi-squared test with
# 	Yates' continuity correction
# 
# data:  tab
# X-squared = 2.9001, df = 1, p-value = 0.08857
