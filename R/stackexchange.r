#' Stackoverflow reputation score.
#' 
#' Get Stackoverflow reputation score for a given user ID.
#' @import RCurl RJSONIO plyr
#' @param userid Stackexchange user ID. Can contain up to 100 semicolon delimited ids.
#' @return Stackoverflow reputation score(s).
#' @export
#' @examples \dontrun{
#' stackexchange(1091766) # one user ID
#' stackexchange(userid="1091766;258662") # many user IDs
#' stackexchange(userid="1091766;258662;1097181;1033896;1207152") # lots of user IDs
#' }
stackexchange <- function(userid)
{
  url <- "https://api.stackexchange.com/2.0/users/"
  url2 <- paste(url, userid, "?site=stackoverflow", sep='')
  header = dynCurlReader()
  curlPerform(url = url2, headerfunction = header$update, curl = header$curl())
  tt <- gunzip(header$value())
  reps <- laply(fromJSON(tt)[[1]], function(x) x$reputation)
  users <- laply(fromJSON(tt)[[1]], 
                 function(x) paste(x$user_id, x$display_name, sep="/"))
  names(reps) <- users
  reps
}