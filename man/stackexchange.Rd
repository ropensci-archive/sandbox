\name{stackexchange}
\alias{stackexchange}
\title{Stackoverflow reputation score.}
\usage{
  stackexchange(userid)
}
\arguments{
  \item{userid}{Stackexchange user ID. Can contain up to
  100 semicolon delimited ids.}
}
\value{
  Stackoverflow reputation score(s).
}
\description{
  Get Stackoverflow reputation score for a given user ID.
}
\examples{
\dontrun{
stackexchange(1091766) # one user ID
stackexchange(userid="1091766;258662") # many user IDs
stackexchange(userid="1091766;258662;1097181;1033896;1207152") # lots of user IDs
}
}

