library("miniCRAN")

repos <- "https://cran.rstudio.com/"

# Specify list of packages to download
pkgs <- c("tidyverse", "skimr", "readr", "readxl", "rio", "ggplot2",
          "broom", "dplyr", "knitr", "rmarkdown", "docstring", "testthat")
pkgList <- pkgDep(pkgs, repos = repos, type = "source", suggests = FALSE)
pkgList

# Create folder for miniCRAN
pth <- file.path("G:/miniCRAN")
dir.create(pth)

# Make repo for source and win.binary
makeRepo(pkgList, path = pth, repos = repos,
         type = c("source", "win.binary"))

# List all files in miniCRAN
list.files(pth, recursive = TRUE, full.names = FALSE)

# Check for available packages
pkgAvail(repos = pth, type = "win.binary")[, c(1:3, 5)]

# install from local repo
install.packages(c("skimr", "readr", "readxl", "rio", "ggplot2",
                   "broom", "dplyr", "knitr", "rmarkdown"),
                 repos = paste0("file:///", pth),
                 type = "win.binary")

install.packages(c("docstring",
                   "testthat"),
                 repos = paste0("file:///", pth),
                 type = "source")

