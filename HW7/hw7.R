#1.

X = c(3.3, 2.9, 2.5, 4.0, 2.8, 2.5, 3.7, 3.8, 3.5, 2.7, 2.6, 4.0)
Y = c(2.7, 2.5, 1.9, 3.3, 2.7, 2.2, 3.1, 4.0, 2.9, 2.0, 3.1, 3.2)

#(a)
reg <- lm(Y~X)
reg$coefficients


#(b)
plot(X, Y)
lines(X, reg$fitted.values,col='red')

#(c)
predict(reg, list(X = 3.0))

#(d)
summary(reg)

#(e)
summary(reg)

#(f)
plot(X, Y)
lines(X, reg$fitted.values,col='blue')
for (i in 1:length(X)){
  lines(c(X[i], X[i]), c(reg$fitted.values[i], Y[i]), col='red')
}

#2.
install.packages('ISwR')
library(ISwR)
str(kfm)
head(kfm)
reg <- lm(dl.milk ~. +as.numeric(kfm$sex) ,data = kfm)
summary(reg)

data <- kfm
data$sex = as.numeric(kfm$sex)

cor(data)

reg <- lm(dl.milk ~., data = data)
summary(reg)

reg <- lm(dl.milk ~. - mat.weight, data = data)
summary(reg)

reg <- lm(dl.milk ~. - mat.weight -no, data = data)
summary(reg)

reg <- lm(dl.milk ~. - mat.weight -no, data = data)
summary(reg)

reg <- lm(dl.milk ~. - mat.weight -no -sex, data = data)
summary(reg)

reg <- lm(dl.milk ~. - mat.weight -no -sex -ml.suppl, data = data)
summary(reg)


#3
X = c(rep(27.2, 27), rep(27.7, 24), rep(28.3, 30), rep(28.4, 27), rep(29.9, 28))
Y = rep(1,136)
Y[1:25] = 0
Y[28:34] = 0
Y[52:55] = 0
Y[82:89] = 0
Y[109]= 0
out1 <- glm(Y~X)
summary(out1)

exp(out1$coefficients[2])

conf_interval_beta1 = c(0.26883 - 1.96 * 0.03803, 0.26883 + 1.96 * 0.03803)
exp(conf_interval_beta1)

prob <- function(x){
  1/(1 + exp(-(out1$coefficients[1] + out1$coefficients[2] * x)))
}

temperature = seq(27,31,0.01)
male_ratio = prob(temperature)
plot(temperature, male_ratio, type = 'l')

#4
library(HSAUR3)
head(womensrole)
str(womensrole)

n = length(womensrole$education)
agree = c(rep(1, n) , rep(0, n))
education = c(womensrole$education, womensrole$education)
gender = c(womensrole$gender, womensrole$gender)
freq = c(womensrole$agree, womensrole$disagree)
new_d = data.frame(agree, education, gender,freq)

fit <- glm(agree ~ education + gender, weights = freq, data = new_d)
summary(fit)


fit2 <- glm(agree ~ education , weights = freq, data = new_d)
summary(fit2)
prob <- function(x){
  1/(1 + exp(-(fit2$coefficients[1] + fit2$coefficients[2] * x)))
}
education = seq(0,20,0.01)
plot(education, prob(x),type='l',col='red')
