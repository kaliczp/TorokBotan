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

subset1 <- clip_rectangle(las, 618250, 5281925, 618334, 5282000)
plot(subset1, color = "RGB")

subset2 <- clip_polygon(las, xpoly = c(618325,
                                       618343,
                                       618280,
                                       618265,
                                       618325
                                       ),
                        ypoly = c(5281920,
                                  5281981,
                                  5282003,
                                  5281940,
                                  5281920
                                  )
                        )


## Canopy
chm <- rasterize_canopy(las, 0.5, pitfree(subcircle = 0.2))
## Tree tops
ttops <- locate_trees(las, lmf(ws = 5))
## Eredmények
plot(chm, col = height.colors(50))
plot(sf::st_geometry(ttops), add = TRUE, pch = 3)
