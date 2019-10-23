#1.

library(maps)
library(mapdata)
dev.off()
map('worldHires',xlim=c(-10,2),ylim=c(50,60))
cols = c("cyan","magenta","pink","yellow","red")
British = c("UK","Ireland","Isle of Man","Isle of Wight","Wales")
for(i in 1:5)
  map("worldHires",region=British[i],col=cols[i],add=TRUE,fill=TRUE)
map.axes()
map.cities(country = 'UK',capitals=1,col='red')

#2
library(googleVis)
str(Population)
WP = data.frame(Country=Population$Country, Population.in.millions=round(Population$Population/1e6,0),Rank=as.numeric(Population$Rank))
GM <- gvisGeoChart(WP, "Country",'Population.in.millions','Rank', options=list(dataMode='regions',width=800,height=600))
GT <- gvisTable(WP,options=list(width=300,height=400))
G2 <- gvisMerge(GM,GT,horizontal=T)
plot(G2)


#2 - before modified.
library(sp)
dev.off()
gadm <- readRDS("KOR_adm1.rds") 
plot(gadm)
rnames <- gadm$NAME_1
rnames
Regional_pop = c(3498529, 1591625, 3373871, 2484557, 1514370, 1550806, 1469214, 12716780, 2700398, 3373871, 2943069, 641597, 1864791, 1903914, 243048, 9930616, 1172304)
gadm$pop <- Regional_pop
spplot(gadm, 'pop')
title('Regional Population (2016)')
