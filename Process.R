## R honlap : https://www.r-project.org/
## A program letöltése CRAN ról csak először
install.packages("lidR")
## Csomag betöltése
library(lidR)
## Fájl beolvasás és jellemzők
las <- readLAS("lidars/terra_las/cloud619adf4281ddc50.las")
las
## Nézegetés
plot(las)
plot(las, color = "RGB")

subset1 <- clip_rectangle(las, 618058.5, 5281838, 618534.4, 5282139)


## Canopy
chm <- rasterize_canopy(las, 0.5, pitfree(subcircle = 0.2))
## Tree tops
ttops <- locate_trees(las, lmf(ws = 5))
## Eredmények
plot(chm, col = height.colors(50))
plot(sf::st_geometry(ttops), add = TRUE, pch = 3)
