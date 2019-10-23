#1
library(rpart)
str(cu.summary)
rfit <- rpart(Mileage ~ Price + Country + Reliability + Type,data = cu.summary, method = 'anova')
rfit
plot(rfit, uniform = T)
text(rfit, use.n = T, all=T, cex=.8)

library(grid)
library(libcoin)
library(mvtnorm)
library(partykit)
plot(as.party(rfit))
tp_args = list(id=F)

#2
str(kyphosis)
cfit <- rpart(Kyphosis ~., data= kyphosis, method = 'class')
cfit

plot(as.party(cfit))
tp_args = list(id=F)
