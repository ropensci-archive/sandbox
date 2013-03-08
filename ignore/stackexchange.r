#' Stackoverflow reputation score.
#' 
#' Get Stackoverflow reputation score for a given user ID.
#' @import RCurl RJSONIO plyr R.utils
#' @param page Page to return.
#' @param pagesize Number of items per page to return.
#' @param fromdate Date to start from.
#' @param todate Date to end at.
#' @param order One of "descending" or "ascending".
#' @param min Minimum XXX.
#' @param max Maximum XXX.
#' @param sort One of "reputation" (default), "creation", "name", or "modified".
#' @param ids Stackexchange user ID. Can contain up to 100 semicolon delimited ids.
#' @param url The base url for Stackexchange.
#' @return Stackoverflow reputation score(s).
#' @export
#' @examples \dontrun{
#' stackexchange(ids = 16632) # one user ID
#' stackexchange(ids="16632;258662") # many user IDs
#' stackexchange(ids="16632;258662;1097181;1033896;1207152") # lots of user IDs
#' stackexchange(ids="16632;258662;1097181;1033896;1207152", sort="name") # using other parameters
#' }
stackexchange <- function(page = NA, pagesize = NA, fromdate = NA, todate = NA, 
    order = NA, min = NA, max = NA, sort = NA, ids,
    url = "https://api.stackexchange.com/2.0/users/")
{
  if(!is.na(page)){ page <- paste("&page=", page, sep="") } else { page <- NULL }
  if(!is.na(pagesize)){ pagesize <- paste("&pagesize=", pagesize, sep="") } else { pagesize <- NULL }
  if(!is.na(fromdate)){ fromdate <- paste("&fromdate=", fromdate, sep="") } else { fromdate <- NULL }
  if(!is.na(todate)){ todate <- paste("&todate=", todate, sep="") } else { todate <- NULL }
  if(!is.na(order)){ order <- paste("&order=", order, sep="") } else { order <- NULL }
  if(!is.na(min)){ min <- paste("&min=", min, sep="") } else { min <- NULL }
  if(!is.na(max)){ max <- paste("&max=", max, sep="") } else { max <- NULL }
  if(!is.na(sort)){ sort <- paste("&sort=", sort, sep="") } else { sort <- NULL }
  url2 <- paste(url, ids, "?site=stackoverflow", page, pagesize, fromdate, 
      todate, order, min, max, sort, sep="")
  tt <- getURL(url2, .opts=list(encoding="identity,gzip")) 
  fromJSON(tt)[[1]]
#   laply(fromJSON(tt)[[1]], function(x) c(id=x$user_id, name=x$display_name, reputation=x$reputation, badge=x$badge_counts))
}


library(httr); library(plyr)
# stackexchange(ids = "16632;258662")
stackexchange_ <- function(page = NULL, pagesize = NULL, fromdate = NULL, 
    todate = NULL, order = NULL, min = NULL, max = NULL, sort = NULL, ids,
    url = "https://api.stackexchange.com/2.0/users/")
{
  query <- compact(list(page = page, pagesize = pagesize, fromdate = fromdate, 
    todate = todate, order = order, min = min, max = max, sort = sort, 
    site = "stackoverflow"))
  res <- GET(paste0(url, ids), query = query)
  json <- parsed_content(res)
  json
#   lapply(json$items, "[", 
#          c("user_id", "display_name", "reputation", "badge_counts"))
}

stackexchange__ <- function(page = NULL, pagesize = NULL, fromdate = NULL, 
    todate = NULL, order = NULL, min = NULL, max = NULL, sort = NULL, ids,
    url = "https://api.stackexchange.com/2.0/users/")
{
#   query <- compact(list(page = page, pagesize = pagesize, fromdate = fromdate, 
#     todate = todate, order = order, min = min, max = max, sort = sort, 
#     site = "stackoverflow"))
  url2 <- paste(url, ids, "?site=stackoverflow", sep="")
  res <- getURL(url2, .opts=list(encoding="identity,gzip"))
  fromJSON(res)[[1]]
  #   lapply(json$items, "[", 
  #          c("user_id", "display_name", "reputation", "badge_counts"))
}

system.time( stackexchange_(ids = "16632") )
system.time( stackexchange(ids = "16632") )
system.time( stackexchange__(ids = "16632") )

system.time( stackexchange(ids = "16632;258662;1097181;1033896;1207152;1207153;1207154;1207155;1207156") )
system.time( llply(list(16632, 258662, 1097181, 1033896, 1207152, 1207153, 1207154, 1207155, 1207156), function(x) stackexchange_(ids=x)) )
system.time( stackexchange__(ids = "16632;258662;1097181;1033896;1207152;1207153;1207154;1207155;1207156") )