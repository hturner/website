library("miniCRAN")

# tinyverse

repos <- "https://cran.rstudio.com/"

# Specify list of packages to download
pkgs <- c("data.table", "ggplot2")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 33

pkgs <- c("data.table", "ggplot2", "knitr", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 47

pkgs <- c("data.table", "ggplot2", "knitr", "kableExtra", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 59

pkgs <- c("data.table", "ggplot2", "knitr", "kableExtra", "rmarkdown", "pinp")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 60

# Specify list of packages to download
pkgs <- c("tidyverse")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 82

# Specify list of packages to download
pkgs <- c("readr", "ggplot2", "dplyr")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 42

# Specify list of packages to download
pkgs <- c("skimr", "readr", "readxl", "rio", "ggplot2",
          "broom", "dplyr", "knitr", "rmarkdown", "docstring", "testthat")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 85

pkgs <- c("rio", "ggplot2",
          "broom", "data.table", "knitr", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 83

pkgs <- c("skimr", "readr", "readxl", "rio", "ggplot2",
          "broom", "dplyr", "knitr", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 71

pkgs <- c("readr", "readxl", "rio", "ggplot2",
          "broom", "dplyr", "knitr", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)

pkgs <- c("readr", "ggplot2",
          "dplyr", "knitr", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 56

pkgs <- c("readr", "ggplot2",
          "dplyr", "tidyr", "knitr", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 57

pkgs <- c("readr", "ggplot2",
          "dplyr", "knitr", "kableExtra", "rmarkdown")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
length(pkgList)
# 64
