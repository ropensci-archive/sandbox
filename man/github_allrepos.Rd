\name{github_allrepos}
\alias{github_allrepos}
\title{Get GitHub metrics on a user or organization's repositories.}
\usage{
  github_allrepos(userorg = NA, type = "org",
    return_ = "names", per_page = 100)
}
\arguments{
  \item{userorg}{User or organization GitHub name.}

  \item{type}{One of user or org (defaults to org)}

  \item{repo}{Repository name.}

  \item{per_page}{(optional) Number of results to return}
}
\value{
  Vector of names or repos for organization or user.
}
\description{
  Get GitHub metrics on a user or organization's
  repositories.
}
\examples{
\dontrun{
github_auth()
options(useragent='ropensci')
github_allrepos(userorg = 'ropensci')
}
}

