library(lidR)
las <- readLAS("only.laz")
plot(las, color = "RGB")
plot(las, color = "RGB", size = 5)

## Canopy
chm <- rasterize_canopy(las, 0.5, pitfree(subcircle = 0.2))
## Tree tops
ttops <- locate_trees(las, lmf(ws = 5))
## Eredmények
plot(chm, col = height.colors(50))
plot(sf::st_geometry(ttops), add = TRUE, pch = 3)

## Individual trees
algo <- dalponte2016(chm, ttops)
las <- segment_trees(las, algo) # segment point cloud
plot(las, bg = "white", size = 4, color = "treeID") # visualize trees


algo1 <- dalponte2016(chm, ttops)
algo2 <- li2012()
las <- segment_trees(las, algo1, attribute = "IDdalponte")
las <- segment_trees(las, algo2, attribute = "IDli") # resource demanding

crowns_dalponte <- crown_metrics(las, func = NULL, attribute = "IDdalponte", geom = "concave")
crowns_li <- crown_metrics(las, func = NULL, attribute = "IDli", geom = "concave")

par(mfrow=c(1,2),mar=rep(0,4))
plot(sf::st_geometry(crowns_dalponte), reset = FALSE)
plot(sf::st_geometry(crowns_li), reset = FALSE)
