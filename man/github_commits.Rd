\name{github_commits}
\alias{github_commits}
\title{Get GitHub metrics on a user or organization's repositories.}
\usage{
  github_commits(userorg = NA, repo = NA, since = NULL,
    until = NULL, author = NULL, limit = 100, sha = NULL,
    timeplot = FALSE,
    session = raltmet:::github_get_auth())
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

  \item{session}{(optional) the authentication credentials
  from \code{\link{github_auth}}. If not provided, will
  attempt to load from cache as long as github_auth has
  been run.}
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
github_commits(userorg = 'ropensci', repo = 'taxize_', since='2009-01-01T', limit=100, timeplot=TRUE)
}
}

