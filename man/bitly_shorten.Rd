\name{bitly_shorten}
\alias{bitly_shorten}
\title{Shorten a long URL suing Bit.ly.}
\usage{
  bitly_shorten(longurl,
    bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
    bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")))
}
\arguments{
  \item{longurl}{The long URL to shorten.}

  \item{bitlyusername}{Your bit.ly username.}

  \item{bitlykey}{Your bit.ly API key.}
}
\value{
  A bit.ly short URL.
}
\description{
  Shorten a long URL suing Bit.ly.
}
\examples{
\dontrun{
bitly_shorten(longurl = 'http://onlinelibrary.wiley.com/doi/10.1111/j.1461-0248.2011.01702.x/abstract')
}
}

