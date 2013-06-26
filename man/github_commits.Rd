\name{github_commits}
\alias{github_commits}
\title{Get GitHub metrics on a user or organization's repositories.}
\usage{
  github_commits(userorg = NA, repo = NA, since = NULL,
    until = NULL, author = NULL, limit = 100, sha = NULL,
    timeplot = FALSE)
}
\arguments{
  \item{userorg}{User or organization GitHub name.}

  \item{repo}{Repository name.}

  \item{since}{Date to start at.}

  \item{until}{Date to stop at.}

  \item{author}{Specify a committer, if none, will return
  all.}

  \item{limit}{Number of commits to return per call}

  \item{sha}{The commit sha to start returning commits
  from.}

  \item{timeplot}{Make a ggplot2 plot visualizing additions
  and deletions by user. Defaults to FALSE.}
}
\value{
  data.frame or ggplot2 figure.
}
\description{
  Get GitHub metrics on a user or organization's
  repositories.
}
\examples{
\dontrun{
github_commits(userorg = 'ropensci', repo = 'rmendeley')
github_commits(userorg = 'ropensci', repo = 'rfigshare', since='2009-01-01T')
github_commits(userorg = 'ropensci', repo = 'taxize_', since='2009-01-01T', limit=500, timeplot=TRUE)
}
}

