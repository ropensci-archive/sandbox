#' Search Google+ for users, posts, comments, etc.
#'
#' @import RCurl RJSONIO plyr
#' @param query Full-text search query string.
#' @param language Specify the preferred language to search with. See search 
#'    language codes for available values.
#' @param maxResults The maximum number of activities to include in the response, 
#'    used for paging. For any response, the actual number returned may be less 
#'    than the specified maxResults. Acceptable values are 1 to 20, inclusive. (Default: 10)
#' @param orderBy Specifies how to order search results. Acceptable values are:
#'    "best" - Sort activities by relevance to the user, most relevant first.
#'    "recent" - Sort activities by published date, most recent first. (default)
#' @param pageToken The continuation token, used to page through large result sets. 
#'    To get the next page of results, set this parameter to the value of 
#'    "nextPageToken" from the previous response. This token may be of any length.
#' @param url The base G+ url (leave to default).
#' @return json output.
#' @export
#' @examples \dontrun{
#' gplus(query = 'ecology')
#' }
gplus <- function(query = NULL, pp = NULL,
  url = "https://www.googleapis.com/plus/v1/activities",
  gkey = getOption("gpluskey", stop("need an API key for the G+ API")),
  ..., curl = getCurlHandle())
{
  args <- list(key = gkey)
  if(!is.null(query))
    args$query <- query
  if(!is.null(pp))
    args$pp <- pp
  message(paste(url, "?query=", query, "&key=", gkey, sep=''))
  xx <- getForm(url, 
    .params= args, 
    ..., 
    curl = curl)
  tt <- fromJSON(I(xx))
  get <- function(x) {list(x$title, x$actor$displayName, 
    x$object$plusoners$totalItems, x$object$resharers$totalItems)}
  temp <- llply(tt[[9]], get)
  combdf <- function(x){ 
    yy <- data.frame(x)
    names(yy) <- c("title","user","plusones","shares")
    yy}
  ldply(temp, combdf)
}