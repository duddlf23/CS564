#1.

#(1)
library(MASS)
attach(Animals)
plot(log(brain), log(body), type='p',lwd=10, col=3)
text(log(brain), log(body), row.names(Animals), cex=0.8)

#(2)
library(ggplot2)
ggplot(Animals, aes(log(brain), log(body), size=10,label = row.names(Animals))) + geom_point(colour = 3) + geom_text(size=4) + theme_bw() +theme(legend.position = 'none')


#2.

Married <- c(652, 1537, 598, 242)
Prev.married <- c(36, 46, 38, 21)
Single <- c(218, 327, 106, 67)
caff <- cbind(Married, Prev.married, Single)
row.names(caff) <- c('0', '1-150', '151-300','>300')
caff
barplot(caff, beside = T, col=2:5, ylab = 'Caffeine consumption', xlab = 'Martial state', legend.text = row.names(caff))


#3.

ggplot(iris, aes(x=Sepal.Length, fill=Species)) + geom_histogram(color='black') + facet_grid(Species ~ .)


#4.
data("airquality")

air <- airquality

air$Month <- factor(air$Month, labels = c('May','June','July','August','September'))

ggplot(air, aes(Day, Ozone, size=Wind, fill=Month)) + geom_point(shape=21,color = 'black') + scale_x_continuous(breaks = seq(1, 31, 5)) + xlab('Day of the month') + ylab('Ozone (ppb)') + ggtitle("Air Quality in New York by Day") + theme(plot.title = element_text(hjust = 0.5))
