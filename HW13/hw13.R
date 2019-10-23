HP <- read.csv('HappyIndex.csv', header=TRUE)

str(HP)
head(HP)
HD <- data.frame(Rank=HP[,1],Country=HP[,2],LifeExpectancy=HP[,4],Wellbeing=HP[,5],
                 Footprint=HP[,7],InequalityOutcome=HP[,8],HPI=HP[,11])

head(HD)

HD <- transform(HD, wel = cut(Wellbeing, breaks = c(0, 5, 6, 8), include.lowest = T, right = F, labels = c('C', 'B', 'A')))

head(HD)

aov.out <- aov(HPI ~ wel, data=HD)
summary(aov.out)

tkh <- TukeyHSD(aov.out, conf.level=0.95)
tkh

plot(tkh, las=1)
