\name{github_get_auth}
\alias{github_get_auth}
\title{Helper function to get authentication}
\usage{
  github_get_auth()
}
\description{
  The authentication environment is created by new.env
  function in the zzz.R file. The authentication token
  'oauth' is created by the github_auth() function. This
  helper function lets all other functions load the
  authentication.
}
\keyword{internal}

