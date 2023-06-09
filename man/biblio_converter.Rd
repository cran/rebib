% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{biblio_converter}
\alias{biblio_converter}
\title{bibliography converter}
\usage{
biblio_converter(file_path = "", log_rebib = FALSE)
}
\arguments{
\item{file_path}{provide a file_path with file name to point tex/bbl file}

\item{log_rebib}{option to enable log files for rebib}
}
\value{
bib file
}
\description{
a quick converter for bbl/tex to bib
}
\examples{
test_file <- system.file("standalone/test.bbl", package = "rebib")
dir.create(your_article_folder <- file.path(tempdir(), "testdir"))
file.copy(test_file, your_article_folder)
your_article_path <- xfun::normalize_path(paste(your_article_folder,"test.bbl",sep="/"))
rebib::biblio_converter(file_path = your_article_path)
head(readLines(xfun::with_ext(your_article_path,"bib")))
unlink(your_article_folder,recursive = TRUE)
}
