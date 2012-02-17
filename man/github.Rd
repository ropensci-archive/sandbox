\name{github}
\alias{github}
\title{Get GitHub metrics on a user or organization's repositories.}
\usage{
  github(userorg = NA, repo = NA, return_ = "show",
    url = "https://api.github.com/repos/")
}
\arguments{
  \item{userorg}{User or organization GitHub name.}

  \item{repo}{Repository name.}

  \item{url}{The base GitHub url (leave to default).}
}
\value{
  XXXXXXXX.
}
\description{
  Get GitHub metrics on a user or organization's
  repositories.
}
\examples{
\dontrun{
github(userorg = 'ropensci', repo = 'rmendeley')
github(userorg = 'hadley', repo = 'ggplot2')
github(userorg = 'hadley', repo = 'ggplot2', 'allstats')
github(userorg = 'hadley', repo = 'ggplot2', 'forks')
}
}

