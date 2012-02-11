\name{citedin}
\alias{citedin}
\title{Get CitedIn data for a given PubMed ID.}
\usage{
  citedin(pmid = NA, df = FALSE,
    url = "http://www.citedin.org/webservice.php/citations",
    ..., curl = getCurlHandle())
}
\arguments{
  \item{pmid}{PubMed ID of the article.}

  \item{df}{print data.frame (TRUE), or list (FALSE -
  default).}

  \item{url}{The base CitedIn url (should be left to
  default)}

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
  Get CitedIn data for a given PubMed ID.
}
\examples{
\dontrun{
citedin(15489334, df = TRUE)
citedin(15489331)
}
}

