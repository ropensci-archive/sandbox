\name{totimp_getitem}
\alias{totimp_getitem}
\title{Get TotalImpact metrics on an identifier.}
\usage{
  totimp_getitem(tiid = NA,
    url = "http://total-impact-core.herokuapp.com/item/",
    getimage = NULL, curl = getCurlHandle())
}
\arguments{
  \item{tiid}{Total-impat ID for item.}

  \item{url}{The base URL (do not change from default).}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  Returns an item object, metrics that is.
}
\description{
  Get TotalImpact metrics on an identifier.
}
\examples{
\dontrun{
tiid <- totimp_getid("doi/10.1111/j.1461-0248.2012.01776.x")
totimp_getitem(tiid = tiid)
}
}

