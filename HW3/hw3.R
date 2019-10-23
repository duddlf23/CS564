
#1.

library(xml2)
library(rvest)
web <- read_html('https://en.wikipedia.org/wiki/World_Happiness_Report')
tbl <- html_nodes(web, 'table')
tbl
table <- tbl %>% .[5] %>% html_table(header=T,fill=TRUE)
table_df <- table[[1]]
names(table_df)
head(table_df)
table_df$`GDP per capita`
library(ggplot2)
ggplot(table_df, aes(x=Score, y=`GDP per capita`)) + geom_point(color='blue') + stat_smooth(size = 2, color = 'red') + theme_bw()


#2.

library(gtrendsR)
LG_trend <- gtrends(keyword = c("LG", "LG"), geo=c("KR", "US"), time="today 12-m")

SAM_trend <- gtrends(keyword = c("SAMSUNG", "SAMSUNG"), geo=c("KR", "US"), time="today 12-m")

trend <- gtrends(keyword = c("LG", "LG", "SAMSUNG", "SAMSUNG"), geo=c("KR", "US", "KR", "US"), time="today 12-m")

plot(trend)
