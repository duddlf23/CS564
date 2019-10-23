#1.

#(1)
dt1 <- array(c(14,4,7,10,15,9,3,11,5), dim=c(3,3), dimnames=list('Radio Format Preference' = c('Music', 'News-talk', 'Sports'), 'Age' = c('Young Adult', 'Middle Age', 'Older Adult')))
library(gmodels)
CrossTable(dt1,prop.chisq=F, prop.t=F, expected=T,format='SPSS')

#(2)
install.packages('vcd')
library(grid)
library(vcd)

mosaic(dt1, shade = T, legend = T)

#2.
library(vcd)
head(Arthritis)
str(Arthritis)

dat <- Arthritis[,-c(1,4)]
dat
tb <- table(dat)
tb


mosaic(tb, shade = T, legend = T)


mantelhaen.test(tb)

doubledecker(tb)
mosaic(~Treatment + Improved, data = dat, shade = T, subset = Sex == 'Female', gp = shading_max, legend = T)
