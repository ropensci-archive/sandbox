\name{github_auth}
\alias{github_auth}
\title{Authenticate with github}
\usage{
  github_auth(client_id = NULL, client_secret = NULL,
    scope = NULL)
}
\arguments{
  \item{client_id}{Consumer key. can be supplied here or
  read from Options()}

  \item{client_secret}{Consumer secret. can be supplied
  here or read from Options()}

  \item{scope}{Comma separated list of scopes. One or more
  of: user, user:email, user:follow, public_repo, repo,
  repo:status, delete_repo, notifications, gist}
}
\description{
  Authenticate with github
}
\examples{
\dontrun{
github_auth()
}
}

