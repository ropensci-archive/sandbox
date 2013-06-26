\name{github_repo}
\alias{github_repo}
\title{Get GitHub metrics on a user or organization's repositories.}
\usage{
  github_repo(userorg = NA, repo = NA, return_ = "show")
}
\arguments{
  \item{userorg}{User or organization GitHub name.}

  \item{repo}{Repository name.}

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
github_auth()
options(useragent='ropensci')
github_repo(userorg = 'ropensci', repo = 'rmendeley')
github_repo(userorg = 'hadley', repo = 'ggplot2')
github_repo(userorg = 'hadley', repo = 'ggplot2', 'allstats')
github_repo(userorg = 'hadley', repo = 'ggplot2', return_ = 'forks')
}
}

