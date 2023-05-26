## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo=FALSE---------------------------------------------------------
library(rebib)

## ----prerebibcons, echo=FALSE-------------------------------------------------
dir.create(your_article_folder <- file.path(tempdir(), "exampledir"))
example_files <-  system.file("article", package = "rebib")
x <- file.copy(from = example_files,to=your_article_folder,recursive = T)
your_article_path <- paste(your_article_folder,"article",sep="/")
bib_path <- paste0(your_article_path,"/example.bib")
x <- file.remove(bib_path)

## ----rebibcons, echo=TRUE-----------------------------------------------------
# for files without BibTeX source
rebib::handle_bibliography(your_article_path)
cat(readLines(paste(your_article_path,"example.bib",sep="/")),sep = "\n")

## ----postrebibcons, echo=FALSE------------------------------------------------
unlink(your_article_folder,recursive = T)

## ----prebiblioaggr, echo = FALSE----------------------------------------------
dir.create(your_article_folder <- file.path(tempdir(), "exampledir"))
example_files <-  system.file("aggr_example", package = "rebib")
x <- file.copy(from = example_files,to=your_article_folder,recursive = T)
your_article_path <- paste(your_article_folder,"aggr_example",sep="/")

## ----biblioaggr, echo = TRUE--------------------------------------------------
# Suppose you have a example.bib file in your article path
cat(readLines(paste(your_article_path,"example.bib",sep="/")),sep = "\n")
# for files with BibTeX source as well as embedded entries
rebib::aggregate_bibliography(xfun::normalize_path(your_article_path))
cat(readLines(paste(your_article_path,"example.bib",sep="/")),sep = "\n")

## ----postbiblioaggr, echo = FALSE---------------------------------------------
unlink(your_article_folder,recursive = T)

