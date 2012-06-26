\name{totimp_getids}
\alias{totimp_getids}
\title{Assign total-impact IDs to more than one item if they do not have one yet.}
\usage{
  totimp_getids(items = NA,
    url = "http://total-impact-core.herokuapp.com/items",
    curl = getCurlHandle())
}
\arguments{
  \item{namespaces}{Namespaces match each item in the items
  parameter.}

  \item{items}{ID for item, e.g., a DOI. See example
  below.}

  \item{url}{The base URL (do not change from default).}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  Returns the assigned tiid.
}
\description{
  Assign total-impact IDs to more than one item if they do
  not have one yet.
}
\examples{
\dontrun{
totimp_getids(namespaces = "doi", items = "10.1371/journal.pcbi.1000361")
}
}

