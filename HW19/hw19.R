data(mtcars)
str(mtcars)

library(igraph)
mat = cor(t(mtcars[, c(1,3:6)]))

mat[mat < 0.99] = 0
mat[mat > 0] = 1
net = graph_from_adjacency_matrix(mat, mode = 'directed', diag = F)

plot(net, edge.arrow.size = 0.3)

mtcars.scaled <- scale(mtcars[, c(1,3:6)])
ds <- dist(mtcars.scaled, method = 'euclidean')
hcst <- hclust(ds, method = 'complete')
plot(hcst, labels = rownames(mtcars.scaled), cex = 0.8)
rect.hclust(hcst, 4)


library(networkD3)

radialNetwork(hcst)

diagonalNetwork(hcst) 

dendroNetwork(hcst, textColour = c('red', 'magenta', 'blue', 'green')[cutree(hcst, 4)])
