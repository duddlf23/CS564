#1.
library(googleVis)
df <- read.csv('SeoulClinic.csv', header = T)

mat_df <- t(data.matrix(df))
df2 <- data.frame(mat_df[-1,])
colnames(df2) <- df$Clinic
df2 <- data.frame(gu = rownames(df2), df2)

col <- gvisColumnChart(df2, options = list(title = 'Clinics in Seoul Area District', legend = 'top'))
plot(col)
#2.
library(ggvis)
trees %>% ggvis(~Girth, ~Height, fill := input_select(c('red','green','blue')), size = ~ Volume) %>% layer_points()
