\name{github_repo}
\alias{github_repo}
\title{Get GitHub metrics on a user or organization's repositories.}
\usage{
  github_repo(userorg = NA, repo = NA, return_ = "show",
    session = sandbox:::github_get_auth())
}
\arguments{
  \item{userorg}{User or organization GitHub name.}

  \item{repo}{Repository name.}

  \item{session}{(optional) the authentication credentials
  from \code{\link{github_auth}}. If not provided, will
  attempt to load from cache as long as github_auth has
  been run.}

  \item{return_}{what to return, one of: show (raw data),
  allstats, watchers, open_issues, or forks}
}
\value{
  json
}
\description{
  Get GitHub metrics on a user or organization's
  repositories.
}
\examples{
\dontrun{
github_repo(userorg = 'ropensci', repo = 'rmendeley')
github_repo(userorg = 'hadley', repo = 'ggplot2')
github_repo(userorg = 'hadley', repo = 'ggplot2', 'allstats')
github_repo(userorg = 'hadley', repo = 'ggplot2', return_ = 'forks')
}
}

