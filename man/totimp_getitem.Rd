\name{totimp_getitem}
\alias{totimp_getitem}
\title{Assign a total-impact ID to one item if it doesn't have one yet.}
\usage{
  totimp_getitem(tiid = NA,
    url = "http://total-impact-core.herokuapp.com/item/",
    curl = getCurlHandle())
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
  Assign a total-impact ID to one item if it doesn't have
  one yet.
}
\examples{
\dontrun{
totimp_getitem(tiid = "0df8aa0eb2c911e19e181231381b0f5a")
}
}

