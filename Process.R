## R honlap : https://www.r-project.org/
## A program letöltése CRAN ról
install.packages("lidR")
## Csomag betöltése
library(lidR)
## Fájl beolvasás és jellemzők
las <- readLAS("lidars/terra_las/cloud619adf4281ddc50.las")
las
