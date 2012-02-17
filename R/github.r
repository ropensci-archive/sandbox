#' Get GitHub metrics on a user or organization's repositories.
#' @import RCurl RJSONIO
#' @param userorg User or organization GitHub name.
#' @param repo Repository name.
#' @param url The base GitHub url (leave to default).
#' @return XXXXXXXX.
#' @export
#' @examples \dontrun{
#' github(userorg = 'ropensci', repo = 'rmendeley')
#' github(userorg = 'hadley', repo = 'ggplot2')
#' github(userorg = 'hadley', repo = 'ggplot2', 'allstats')
#' github(userorg = 'hadley', repo = 'ggplot2', 'forks')
#' }
github <- function(userorg = NA, repo = NA, return_ = 'show',
        url = "https://api.github.com/repos/"){
  url2 <- paste(url, userorg, '/', repo, sep='')
  xx <- getURL(url2)
  tt <- fromJSON(xx)
  if(return_=='show'){tt} else
    if(return_=='allstats'){
        list('watchers'=tt$watchers, 'open_issues'=tt$open_issues, 
             'forks'=tt$forks)} else
      if(return_=='watchers'){tt$watchers} else
        if(return_=='open_issues'){tt$open_issues} else
          if(return_=='forks'){tt$forks}
}