
#1

library(igraph)
N = matrix(c(0,1,1,1,0, 1,0,0,1,1, 0,1,0,1,0,
                            0,1,1,0,0, 0,1,1,0,0),
                          nrow=5, byrow=TRUE)

lab = LETTERS[1:5]
dimnames(N) <- list(lab,lab)
N
gn <- graph.adjacency(N)
plot(gn, vertex.color = 2:6, vertex.size = 15, edge.color = 'black', edge.arrow.size = 0.3)

#2

data <- read.table('edgesdata3.txt', header = T)
head(data)
gdf <- graph.data.frame(data, directed = F)

V(gdf)$color <- ifelse(V(gdf)$name == 'CA', 'red', 'cornsilk')
E(gdf)$color <- ifelse(E(gdf)$spec == 'X', 'red', ifelse(E(gdf)$spec == 'Y', 'blue', 'gray'))
plot(gdf, edge.arrow.size = 0.2, vertex.label.cex = 0.7, vertex.size = 15, edge.arrow.size = 0.5)

#3
install.packages('mapproj')
library(mapproj)
library(ggmap)
metro_map <- get_map(location = c(left = -77.22557, bottom = 39.05721, right = -77.11271, top = 39.14247))

library(geomnet)
data(bikes, package = 'geomnet')
library(ggnetwork)
tripnet <- fortify(as.edgedf(bikes$trips), bikes$stations[,c(2,1,3:5)])
tripnet$Metro = FALSE
idx <- grep("Metro", tripnet$from_id)
tripnet$Metro[idx] <- TRUE


ggmap(metro_map) + geom_net(layout.alg=NULL, data = tripnet, labelon = T, aes(from_id = from_id, to_id = to_id, x = long, y = lat, linewidth = n/15, colour = Metro)) + scale_colour_manual('Metro Station', values = c('azure4', 'red')) + theme_net() %+replace% theme(aspect.ratio = NULL, legend.position = 'bottom') + coord_map()
