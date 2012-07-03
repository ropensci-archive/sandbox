\name{stackexchange}
\alias{stackexchange}
\title{Stackoverflow reputation score.}
\usage{
  stackexchange(page = NA, pagesize = NA, fromdate = NA,
    todate = NA, order = NA, min = NA, max = NA, sort = NA,
    ids, url = "https://api.stackexchange.com/2.0/users/")
}
\arguments{
  \item{page}{Page to return.}

  \item{pagesize}{Number of items per page to return.}

  \item{fromdate}{Date to start from.}

  \item{todate}{Date to end at.}

  \item{order}{One of "descending" or "ascending".}

  \item{min}{Minimum XXX.}

  \item{max}{Maximum XXX.}

  \item{sort}{One of "reputation" (default), "creation",
  "name", or "modified".}

  \item{ids}{Stackexchange user ID. Can contain up to 100
  semicolon delimited ids.}

  \item{url}{The base url for Stackexchange.}
}
\value{
  Stackoverflow reputation score(s).
}
\description{
  Get Stackoverflow reputation score for a given user ID.
}
\examples{
\dontrun{
stackexchange(ids = 1091766, order = "desc", sort = "reputation") # one user ID
stackexchange(ids="1091766;258662") # many user IDs
stackexchange(ids="1091766;258662;1097181;1033896;1207152") # lots of user IDs
stackexchange(ids="1091766;258662;1097181;1033896;1207152", sort="name") # with other parameters used
stackexchange() # with other parameters used
}
}

