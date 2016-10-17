## ---- echo = FALSE, message = FALSE--------------------------------------
library(ungeneanno)

## ------------------------------------------------------------------------
    mat <- matrix(c("1","BRAF.exp","1","BRCA2.mut","2","BRAF.cnv","2","AURKB.mut","2","PTEN.exp")
        ,ncol = 2,byrow = TRUE)
    mat

## ------------------------------------------------------------------------
    geneanno <- getUniqueGeneList(geneanno(),mat)
    slot(geneanno,"genelist")
    slot(geneanno,"groupnos")

