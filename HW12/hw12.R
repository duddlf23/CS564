# 1.
data(toothpaste, package = 'HSAUR3')
toothpaste
??toothpaste
tooth <- toothpaste[,-c(1,2,5)]

library(NbClust)
?NbClust
nb <- NbClust(tooth, method = 'complete', max.nc = 4)
n = nb$Best.nc[1]

library(cluster)

kc <- kmeans(tooth, centers = n, nstart = 4)
kc
sobj <- silhouette(kc$cluster, dist(tooth))
summary(sobj)
dev.off()
plot(sobj, col=2:4)


#2.

Albania <- c(10.1 ,       1.4,         0.5 ,     8.9  ,   0.2  ,  42.3 ,      0.6  ,     5.5 ,    1.7)
Austria <-c(     8.9    ,     14    ,     4.3   ,  19.9   ,  2.1     , 28  ,     3.6   ,    1.3  ,   4.3  )   
Belgium <-c(    13.5     ,   9.3     ,    4.1 ,    17.5  ,   4.5 ,   26.6  ,     5.7   ,    2.1  ,     4   )  
Bulgaria<-c(    7.8   ,       6   ,      1.6 ,     8.3 ,    1.2 ,   56.7 ,      1.1 ,      3.7 ,    4.2  )  
Czechosl.<-c(    9.7   ,    11.4   ,      2.8 ,    12.5 ,      2 ,   34.3 ,        5 ,      1.1 ,      4  )   
Denmark  <-c(    10.6   ,    10.8   ,      3.7 ,      25 ,    9.9 ,   21.9 ,      4.8 ,      0.7 ,    2.4     )
EGermany  <-c(    8.4    ,   11.6    ,     3.7  ,   11.1  ,   5.4  ,  24.6  ,     6.5  ,     0.8  ,   3.6     )
Finland   <-c(    9.5     ,   4.9     ,    2.7   ,  33.7   ,  5.8   , 26.3   ,    5.1   ,      1   ,  1.4     )
France   <-c(      18      ,  9.9      ,   3.3    , 19.5,     5.7    ,28.1    ,   4.8    ,   2.4    , 6.5     )
Greece   <-c(    10.2       ,   3       ,  2.8,     17.6 ,    5.9,    41.7     ,  2.2     ,  7.8,     6.5     )
Hungary   <-c(    5.3 ,      12.4  ,       2.9 ,     9.7  ,   0.3 ,   40.1      ,   4      , 5.4 ,    4.2     )
Ireland   <-c(   13.9  ,       10   ,      4.7  ,   25.8   ,  2.2  ,    24,       6.2       ,1.6  ,   2.9     )
Italy    <-c(       9   ,     5.1    ,     2.9   ,  13.7    , 3.4   , 36.8 ,      2.1,       4.3   ,  6.7     )
Netherl. <-c(     9.5    ,   13.6     ,    3.6    , 23.4     ,2.5    ,22.4  ,     4.2 ,      1.8    , 3.7     )
Norway   <-c(     9.4     ,   4.7      ,   2.7     ,23.3,     9.7,      23   ,    4.6  ,     1.6     ,2.7     )
Poland  <-c(      6.9 ,      10.2       ,  2.7,     19.3 ,      3 ,   36.1    ,   5.9   ,      2,     6.6     )
Portugal <-c(     6.2  ,      3.7        , 1.1 ,     4.9  ,  14.2  ,    27     ,  5.9    ,   4.7 ,    7.9     )
Romania <-c(      6.2   ,     6.3 ,        1.5  ,   11.1   ,    1   , 49.6      , 3.1     ,  5.3  ,   2.8     )
Spain   <-c(      7.1    ,    3.4  ,       3.1   ,   8.6    ,   7    ,29.2,       5.7      , 5.9   ,  7.2     )
Sweden  <-c(      9.9     ,   7.8   ,      3.5    , 24.7     ,7.5,    19.5 ,      3.7,       1.4    ,   2     )
Switzerl.<-c(    13.1      , 10.1    ,     3.1,     23.8,     2.3 ,   25.6  ,     2.8 ,      2.4,     4.9     )
UK      <-c(     17.4 ,       5.7     ,    4.7 ,    20.6 ,    4.3  ,  24.3   ,    4.7  ,     3.4 ,    3.3     )
USSR    <-c(      9.3  ,      4.6      ,   2.1  ,   16.6  ,     3   , 43.6    ,   6.4   ,    3.4  ,   2.9     )
WGermany <-c(    11.4   ,    12.5       ,  4.1   ,  18.8   ,  3.4    ,18.6     ,  5.2    ,   1.5   ,  3.8     )
Yugosl.  <-c(     4.4    ,      5        , 1.2    ,  9.5    , 0.6 ,   55.9      ,   3     ,  5.7    , 3.2   )
data <-rbind(Albania, Austria,Belgium,Bulgaria ,Czechosl.,Denmark, EGermany,Finland,  France, Greece,Hungary, Ireland,Italy ,Netherl.,Norway,Poland,Portugal,Romania,Spain,Sweden,Switzerl.,UK,USSR,WGermany,Yugosl.)
dim(data)
class(data)
data <- as.data.frame(data)
colnames(data) <- c('RedMeat', 'WhiteMeat', 'Eggs', 'Milk', 'Fish', 'Cereals', 'Starch', 'Nuts', 'FruitVeg')
kc <- kmeans(data, centers = 2, nstart = 4)
kc

sobj <- silhouette(kc$cluster, dist(data))
summary(sobj)
dev.off()
plot(sobj, col=2:3)

clusplot(data, kc$cluster, color=T, shade=T,labels=2)

ds <- dist(data, method = 'euclidean')

hcst <- hclust(ds, method='complete')
plot(hcst, labels = rownames(data), cex=0.8)

