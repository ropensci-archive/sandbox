\name{digg_user}
\alias{digg_user}
\title{Get Digg metrics on a user.}
\usage{
  digg_user(usernames = NA, userids = NA,
    url = "http://services.digg.com/2.0/user.getInfo", ...,
    curl = getCurlHandle())
}
\arguments{
  \item{usernames}{Comma separated list of usernames (e.g.,
  'kevinrose,leolaporte').}

  \item{userids}{Comma separated list of user IDs (e.g.,
  '59,60').}

  \item{url}{The base Digg url (leave to default).}

  \item{...}{optional additional curl options (debugging
  tools mostly)}

  \item{curl}{If using in a loop, call getCurlHandle()
  first and pass the returned value in here (avoids
  unnecessary footprint)}
}
\value{
  A data.frame with results.
}
\description{
  Given a single or multiple Digg usernames or user ID's,
  returns for each number of diggs, comments, followers,
  following, and submissions.
}
\details{
  Only supply one or the other of usernames or userids.
}
\examples{
\dontrun{
digg_user(usernames = 'kevinrose,leolaporte')
digg_user(userids = '59,60')
}
}

