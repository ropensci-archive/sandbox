\name{github_timeseries}
\alias{github_timeseries}
\title{Create time series bar plot.}
\usage{
  github_timeseries(data = NULL)
}
\arguments{
  \item{data}{Data set to plot with.}
}
\description{
  Create time series bar plot.
}
\examples{
\dontrun{
# Run with example data set (commits from the ropensci organization account)
github_timeseries()

# Get your own data
github_auth()
mydat <- llply(c('ggplot2','plyr','httr'), function(x) github_commits(userorg='hadley',repo=x,limit=500))
mydat <- ldply(mydat)
github_timeseries(mydat)
}
}

