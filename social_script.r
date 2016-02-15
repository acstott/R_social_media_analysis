# load termDocMatrix
load('/Users/amanda/Development/social_media_analysis_R/termDocMatrix.rdata')
# inspect part of the matrix
termDocMatrix[5:10,1:20]

# change it to a Boolean matrix
termDocMatrix[termDocMatrix>=1] <- 1
# transform into a term-term adjacency matrix
termMatrix <- termDocMatrix %*% t(termDocMatrix)
# inspect terms numbered 5 to 10
termMatrix[5:10,5:10]

library(igraph)

# build a graph from the above matrix
g <- graph.adjacency(termMatrix, weighted=T)

# remove loops
g <- simplify(g)

# set labels and degrees of vertices
V(g)$label <- V(g)$name
V(g)$degree <- degree(g)

# set seed to make the layout reproducible
set.seed(3952)
layout1 <- layout.fruchterman.reingold(g)
par(ask=TRUE)
plot(g, layout=layout1)


