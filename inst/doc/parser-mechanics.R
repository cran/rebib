## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup,echo=FALSE---------------------------------------------------------
library(rebib)

## ----stage0.5, echo = FALSE---------------------------------------------------
dir.create(your_article_folder <- file.path(tempdir(), "exampledir"))
example_files <-  system.file("article", package = "rebib")
x <- file.copy(from = example_files,to=your_article_folder,recursive = T)
your_article_path <- paste(your_article_folder,"article",sep="/")

## ----stage1,echo=TRUE---------------------------------------------------------
file_name <- rebib:::get_texfile_name(your_article_path)
bib_items <- rebib:::extract_embeded_bib_items(your_article_path,file_name)
bib_items[[1]]
bib_items[[2]]

## ----stage2.1,echo=TRUE-------------------------------------------------------
bib_items[[1]][1]

## ----stage2.2,echo=TRUE-------------------------------------------------------
bib_items[[1]][2]

## ----stage2.3,echo=TRUE-------------------------------------------------------
bib_items[[1]][3]

## ----stage2.4,echo=TRUE-------------------------------------------------------
bib_items[[1]][4:6]

## ----stage2.5,echo=TRUE-------------------------------------------------------
bib_entry <- rebib:::bib_handler(bib_items)
bib_entry

## ----prestage3,echo=FALSE-----------------------------------------------------
file_path <- paste0(your_article_path,"/",file_name)
bib_path <- paste0(your_article_path,"/example.bib")
x <- file.remove(bib_path)

## ----stage3,echo=TRUE---------------------------------------------------------
rebib:::bibtex_writer(bib_entry,file_path)
cat(readLines(paste(your_article_path,"example.bib",sep="/")),sep = "\n")

## ----stageend, echo =FALSE----------------------------------------------------
unlink(your_article_folder)

