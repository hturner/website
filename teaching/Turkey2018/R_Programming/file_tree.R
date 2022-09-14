library(data.tree)
library(purrr)
dir <- "E:/Repos/CRAN/gnm"
dat <- data.frame(pathString = dir(dir, full.names = FALSE,recursive = FALSE))
tree <- as.Node(dat)

cat(ToDataFrameTree(tree$`E:`$Repos$gnm)[[1]], sep = "\n")
