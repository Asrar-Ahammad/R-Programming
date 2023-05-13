# Load the igraph package
library(igraph)

# Create a simple example network
nodes <- c("Alice", "Bob", "Charlie", "Dave", "Eve")
edges <- data.frame(from = c("Alice", "Bob", "Charlie", "Dave", "Eve"),
                    to = c("Bob", "Charlie", "Dave", "Eve", "Alice"))

# Create the graph object
graph <- graph.data.frame(edges, directed = FALSE, vertices = nodes)

# Visualize the network
plot(graph, edge.arrow.size = 0.5, edge.color = "gray", vertex.color = "lightblue", vertex.size = 30, vertex.label.cex = 0.8)

# Perform social network analysis
# Get degree centrality
degree <- degree(graph)
print("Degree Centrality:")
print(degree)

# Get betweenness centrality
betweenness <- betweenness(graph)
print("Betweenness Centrality:")
print(betweenness)

# Get community structure
community <- cluster_edge_betweenness(graph)
print("Community Structure:")
print(community)
