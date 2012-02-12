\name{altmet_doi}
\alias{altmet_doi}
\title{Get Altmetric data for a given DOI.}
\usage{
  altmet_doi(doi = NA, df = FALSE,
    url = "http://api.altmetric.com/v1/doi/",
    bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
    bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{doi}{DOI of the article.}

  \item{df}{print data.frame (TRUE), or list (FALSE -
  default).}

  \item{url}{The base CitedIn url (should be left to
  default)}

  \item{bitlyusername}{Your bit.ly username.}

  \item{bitlykey}{Your bit.ly API key.}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  Data.frame or list of citations of the PubMed ID.
}
\description{
  Get Altmetric data for a given DOI.
}
\examples{
\dontrun{
altmet_doi('10.1038/480426a', df = TRUE)
altmet_doi('10.1038/480426a')
altmet_doi("10.1111/j.1365-2745.2006.01176.x") # doesn't work
}
}

