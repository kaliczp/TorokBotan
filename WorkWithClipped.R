library(lidR)
las <- readLAS("only.laz")
plot(las, color = "RGB")

## Canopy
chm <- rasterize_canopy(las, 0.5, pitfree(subcircle = 0.2))
## Tree tops
ttops <- locate_trees(las, lmf(ws = 5))
## Eredmények
plot(chm, col = height.colors(50))
plot(sf::st_geometry(ttops), add = TRUE, pch = 3)
