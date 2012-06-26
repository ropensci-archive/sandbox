\name{totimp_getid}
\alias{totimp_getid}
\title{Assign a total-impact ID to one item if it doesn't have one yet.}
\usage{
  totimp_getid(item = NA,
    url = "http://total-impact-core.herokuapp.com/tiid/",
    curl = getCurlHandle())

  totimp_getid(item = NA,
    url = "http://total-impact-core.herokuapp.com/tiid/",
    curl = getCurlHandle())
}
\arguments{
  \item{item}{ID for item, e.g., a DOI. See example below.}

  \item{url}{The base URL (do not change from default).}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}

  \item{item}{ID for item, e.g., a DOI. See example below.}

  \item{url}{The base URL (do not change from default).}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  Returns the assigned tiid.

  Returns the assigned tiid.
}
\description{
  Assign a total-impact ID to one item if it doesn't have
  one yet.

  Assign a total-impact ID to one item if it doesn't have
  one yet.
}
\examples{
\dontrun{
totimp_getid(item = "doi/10.1371/journal.pcbi.1000361")
}
\dontrun{
totimp_getid(item = "doi/10.1371/journal.pcbi.1000361")
}
}

