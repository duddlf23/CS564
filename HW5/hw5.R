#1.


data("mtcars")
attach(mtcars)

#(1)
str(mtcars)
hist(mpg, freq = F)
lines(density(mpg))
shapiro.test(mpg)
qqnorm(mpg)
qqline(mpg)


#(2)
x1 <- mpg[am == 0]
x2 <- mpg[am == 1]
var.test(x1, x2)$p.value

t.test(x1, x2, alternative = 'less', var.equal = T)


#2.
install.packages('robustbase')
library(robustbase)
data("NOxEmissions")

str(NOxEmissions)
x_bar <- mean(NOxEmissions$LNOx)
alpha = 0.05
cri_z_value <- qnorm(1-alpha/2)
n = length(NOxEmissions$LNOx)
st = cri_z_value * sd(NOxEmissions$LNOx) / n^0.5

conf_interval = c(x_bar - st, x_bar + st)
conf_interval
