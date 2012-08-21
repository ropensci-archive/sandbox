\name{bitly_clicks}
\alias{bitly_clicks}
\title{Get Bit.ly clicks for a given URL.}
\usage{
  bitly_clicks(bitlyurl,
    bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
    bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")))

  bitly_clicks(bitlyurl,
    bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
    bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")))
}
\arguments{
  \item{bitlyurl}{The bit.ly short URL.}

  \item{bitlyusername}{Your bit.ly username.}

  \item{bitlykey}{Your bit.ly API key.}

  \item{bitlyurl}{The bit.ly short URL.}

  \item{bitlyusername}{Your bit.ly username.}

  \item{bitlykey}{Your bit.ly API key.}
}
\value{
  Vector of length 2, with user clicks and global clicks.

  Vector of length 2, with user clicks and global clicks.
}
\description{
  Get Bit.ly clicks for a given URL.

  Get Bit.ly clicks for a given URL.
}
\examples{
\dontrun{
bitly_clicks(bitlyurl = 'http://bit.ly/xaTrO7')
}
\dontrun{
bitly_clicks(bitlyurl = 'http://bit.ly/xaTrO7')
}
}

