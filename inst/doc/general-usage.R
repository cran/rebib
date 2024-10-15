## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo = FALSE-------------------------------------------------------
library(rebib)

## ----prebibliocon, echo = FALSE-----------------------------------------------
dir.create(your_article_folder <- file.path(tempdir(), "exampledir"))
example_files <- system.file("standalone", package = "rebib")
x <- file.copy(from = example_files,to=your_article_folder,recursive = T,)
path_to_your_file <- paste(your_article_folder,"standalone", "sample.bbl", sep = "/")

## ----bibliocon, echo = TRUE---------------------------------------------------
rebib::biblio_converter(path_to_your_file)

## ----postbibliocon, echo =FALSE-----------------------------------------------
unlink(your_article_folder)

## ----bib_agg,fig.alt="A Flow chart of Bibliography Aggregation",fig.align='center',fig.cap="A Flow chart of Bibliography Aggregation",echo=FALSE----
knitr::include_graphics("../man/figures/bib_agg.svg")

## ----prebiblioaggr, echo = FALSE----------------------------------------------
dir.create(your_article_folder <- file.path(tempdir(), "exampledir"))
example_files <-  system.file("aggr_example", package = "rebib")
x <- file.copy(from = example_files,to=your_article_folder,recursive = T,)
your_article_path <- paste(your_article_folder,"aggr_example",sep="/")

## ----biblioaggr, echo = TRUE--------------------------------------------------
# Suppose you have a example.bib file in your article path
cat(readLines(paste(your_article_path,"example.bib",sep="/")),sep = "\n")
# for files with BibTeX source as well as embedded entries
rebib::aggregate_bibliography(xfun::normalize_path(your_article_path))
cat(readLines(paste(your_article_path,"example.bib",sep="/")),sep = "\n")

## ----postbiblioaggr, echo = FALSE---------------------------------------------
unlink(your_article_folder,recursive = T)

