\name{altmetcom}
\alias{altmetcom}
\title{Get Altmetric.com data for a given article.}
\usage{
  altmetcom(service, articleid = NA, all = TRUE,
    url = "http://api.altmetric.com/v1/",
    key = getOption("altmetriccom"))
}
\arguments{
  \item{service}{Service of the article ID you are searchin
  for: one of 'id' (Altmetric.com article ID), 'doi'
  (article DOI), 'pmid' (PubMed ID), or 'arxiv' (arXiv
  ID).}

  \item{id}{ID of the article.}

  \item{all}{print all results (TRUE - default), or not
  (FALSE).}

  \item{url}{The base CitedIn url (should be left to
  default)}

  \item{key}{Your Altmetric.com API key.}
}
\value{
  Altmetric.com data on the given article in a list.
}
\description{
  Get Altmetric.com data for a given article.
}
\examples{
\dontrun{
altmetcom('id', '241939') # using altmetric.com article id
altmetcom('doi', '10.1038/480426a') # using doi
altmetcom('pmid', '21148220') # using pubmed id
altmetcom('arxiv', '1108.2455') # using arxiv id
}
}

