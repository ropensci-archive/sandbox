\name{github_allrepos}
\alias{github_allrepos}
\title{Get GitHub metrics on a user or organization's repositories.}
\usage{
  github_allrepos(userorg = NA, return_ = "names",
    session = sandbox:::github_get_auth())
}
\arguments{
  \item{userorg}{User or organization GitHub name.}

  \item{repo}{Repository name.}

  \item{session}{(optional) the authentication credentials
  from \code{\link{github_auth}}. If not provided, will
  attempt to load from cache as long as github_auth has
  been run.}
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
github_allrepos(userorg = 'ropensci')
}
}

