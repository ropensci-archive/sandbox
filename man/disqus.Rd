\name{disqus}
\alias{disqus}
\title{Search Disqus API.}
\usage{
  disqus(query = NA, parameter = NA, method = NA,
    url = "http://disqus.com/api/3.0",
    key = getOption("natureopensearch", stop("need an API key for the Disqus API")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{query}{Search term(s).}

  \item{parameter}{XXXX}

  \item{method}{XXXX}

  \item{url}{The base Disqus url (leave to default).}
}
\value{
  json output.
}
\description{
  DETAILED DESCRIPTION
}
\examples{
\dontrun{
disqus()
}
}

