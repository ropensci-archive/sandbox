\name{gplus}
\alias{gplus}
\title{Search Google+ for users, posts, comments, etc.}
\usage{
  gplus(query = NULL, pp = NULL,
    url = "https://www.googleapis.com/plus/v1/activities",
    gkey = getOption("gpluskey", stop("need an API key for the G+ API")),
    ..., curl = getCurlHandle())
}
\arguments{
  \item{query}{Full-text search query string.}

  \item{language}{Specify the preferred language to search
  with. See search language codes for available values.}

  \item{maxResults}{The maximum number of activities to
  include in the response, used for paging. For any
  response, the actual number returned may be less than the
  specified maxResults. Acceptable values are 1 to 20,
  inclusive. (Default: 10)}

  \item{orderBy}{Specifies how to order search results.
  Acceptable values are: "best" - Sort activities by
  relevance to the user, most relevant first.  "recent" -
  Sort activities by published date, most recent first.
  (default)}

  \item{pageToken}{The continuation token, used to page
  through large result sets.  To get the next page of
  results, set this parameter to the value of
  "nextPageToken" from the previous response. This token
  may be of any length.}

  \item{url}{The base G+ url (leave to default).}
}
\value{
  json output.
}
\description{
  Search Google+ for users, posts, comments, etc.
}
\examples{
\dontrun{
gplus(query = 'ecology')
}
}

