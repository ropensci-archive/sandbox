\name{bitly_expand}
\alias{bitly_expand}
\title{Expand a long URL suing Bit.ly.}
\usage{
  bitly_expand(shorturl,
    bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
    bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")))
}
\arguments{
  \item{shorturl}{The long URL to shorten.}

  \item{bitlyusername}{Your bit.ly username.}

  \item{bitlykey}{Your bit.ly API key.}
}
\value{
  A bit.ly short URL.
}
\description{
  Expand a long URL suing Bit.ly.
}
\examples{
\dontrun{
bitly_expand(shorturl = 'http://bit.ly/MxxXPH')
}
}

