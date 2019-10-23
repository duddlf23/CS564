#1.
less_than = c(1, 6.5, 4.5, 2, 8.5)
high = c(1.5, 4, 3.5, 1.5, 5)
college = c(11, 6.5, 4.5, 7.5, 9)
breast_feed = c(1, 6.5, 4.5, 2, 8.5, 1.5, 4, 3.5, 1.5, 5, 11, 6.5, 4.5, 7.5, 9 )
education = c(rep('less', 5),rep('high', 5),rep('college', 5))
aov.out = aov(breast_feed ~ education)
summary(aov.out)

d1 = density(less_than)
plot(d1, ylim = c(0, 1), col = 'red')
abline(v=mean(less_than), col='red')

d2 = density(high)
lines(d2, col = 'blue')
abline(v=mean(high), col='blue')

d3 = density(college)
lines(d3, col='green')
abline(v=mean(college), col='green')

#2.
month = rep(seq(1,12), 5)
year = c(rep(1, 12), rep(2,12),rep(3,12),rep(4,12),rep(5,12))
revenue = c(15,22,18,23,23,12,26,19,15,14,14,21,18,25,22,15,15,15,12,17,14,18,22,23,22,15,15,14,26,11,23,15,18,10,19,11,23,15,19,17,18,10,15,20,19,12,17,18,24,14,21,18,14,8,18,10,20,23,11,14)

aov.out = aov(revenue ~ year*month)
summary(aov.out)

boxplot(revenue~month)
boxplot(revenue~year)

#3.
f1 = c('Item1', 'Item2', 'Item3')
f2 = c('East', 'West')
k1 = length(f1)
k2 = length(f2)
n = 4

r = c(25,39,36,36,42,24,31,39,28,26,35,29,51,43,42,47,39,36,47,53,32,52,46,33)
tm1 = gl(k1, 1, n*k1*k2, factor(f1))
tm1

tm2 = gl(k2, n*k1, n*k1*k2, factor(f2))
tm2

av = aov(r ~ tm1*tm2)
summary(av)


#4.
install.packages('car')
library(car)
head(Baumann)
?Baumann
attach(Baumann)
Y <- cbind(post.test.1, post.test.2, post.test.3)

fit <- manova(Y ~ group)
summary(fit)
