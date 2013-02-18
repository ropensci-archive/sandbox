#' Get Digg metrics on a user.
#' 
#' Given a single or multiple Digg usernames or user ID's, returns for each
#'  number of diggs, comments, followers, following, and submissions.
#' @import RCurl RJSONIO
#' @param usernames Comma separated list of usernames (e.g., 'kevinrose,leolaporte').
#' @param userids Comma separated list of user IDs (e.g., '59,60').
#' @param url The base Digg url (leave to default).
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return A data.frame with results.
#' @details Only supply one or the other of usernames or userids.
#' @export
#' @examples \dontrun{
#' digg_user(usernames = 'kevinrose,leolaporte')
#' digg_user(userids = '59,60')
#' }
digg_user <- function(usernames = NA, userids = NA,
  url = "http://services.digg.com/2.0/user.getInfo", ..., curl = getCurlHandle())
{
  args <- list()
  if(!is.na(usernames))
    args$usernames <- usernames
  if(!is.na(userids))
    args$user_ids <- userids
  message(paste(url,"?",names(args[1]),"=",args[1],sep=''))
  xx <- getForm(url, 
    .params = args,
    ...,
    curl = curl)
  tt <- fromJSON(xx)
  out <- ldply(tt$users, function(x) 
    c(x$diggs, x$comments, x$followers, x$following, x$submissions))
  names(out) <- c("user","diggs","comments","followers","following","submissions")
  out
}
