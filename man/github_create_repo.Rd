\name{github_create_repo}
\alias{github_create_repo}
\title{Create a new github repo.}
\usage{
  github_create_repo(user = NULL, org = NULL, name = NULL,
    description = NULL, homepage = NULL, private = FALSE,
    has_issues = TRUE, has_wiki = TRUE,
    has_downloads = TRUE, team_id = NULL,
    auto_init = FALSE, gitignore_template = NULL)
}
\arguments{
  \item{userorg}{User or organization GitHub name.}

  \item{name}{Your new repo name. Required}

  \item{description}{Description of repo. Optional}

  \item{homepage}{Homepage for repo. Optional}

  \item{private}{Make the repo private? Creating private
  repositories requires a paid GitHub account.}

  \item{has_issues}{true to enable issues for this
  repository, false to disable them.}

  \item{has_wiki}{true to enable the wiki for this
  repository, false to disable it}

  \item{has_downloads}{true to enable downloads for this
  repository, false to disable them.}

  \item{team_id}{The id of the team that will be granted
  access to this repository. This is only valid when
  creating a repo in an organization.}

  \item{auto_init}{true to create an initial commit with
  empty README. Default is False.}

  \item{gitignore_template}{See
  \link{https://github.com/github/gitignore}}

  \item{session}{(optional) the authentication credentials
  from \code{\link{github_auth}}.  If not provided, will
  attempt to load from cache as long as github_auth has
  been run.}
}
\description{
  Create a new github repo.
}
\examples{
\dontrun{
github_auth(scope='repo')
github_create_repo(user='schamberlain', name='test', description='testing', homepage='http://schamberlain.github.com/scott/')
}
}

