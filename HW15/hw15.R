#1.
data("attitude")
str(attitude)
library(rela)
paf_dat <- paf(as.matrix(attitude))
paf_dat$KMO

library(psych)
scree(attitude, factors = F, pc = T)

pca <- principal(attitude, nfactors = 2, rotate = 'none')
pca

fa.diagram(pca)


#2.

pca <- principal(USArrests, nfactors = 2, rotate = 'none')
pca

biplot.psych(pca, col = c('black', 'red'), cex = c(0.5, 1), arrow.len = 0.08, main = NULL, labels = rownames(USArrests))
