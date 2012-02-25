require(RJSONIO); require(RCurl)
url <- "https://api.github.com/repos/ropensci/rmendeley"
url <- "https://api.github.com/repos/ropensci/rmendeley/downloads"
tt <- getURL(url)
fromJSON(tt)
#' Get GitHub metrics on your repositories.
#' @import RCurl RJSONIO
#' @param user Username.
#' @param org Organization name.
#' @param repo Repository name.
#' @param stat One of issues, downloads, gists, pulls, collaborators, commits, 
#'    forks, keys, watchers, or hooks.
#' @param url The base GitHub url (should be left to default)
#' @return XXXXXXXX.
#' @export
#' @examples \dontrun{
#' github2(user = 'ropensci', repo = 'rmendeley', stat = 'downloads')
#' github2(user = 'ropensci', repo = 'rmendeley', stat = 'issues')
#' github(user = 'ropensci', repo = 'rmendeley')
#' }
github2 <- function(user = NA, org = NA, repo = NA, stat = NA,
                   url = "https://api.github.com/repos/"){
  url2 <- paste(url, if(!is.na(user)) paste(user, '/', sep=''), 
                if(!is.na(org)) paste(org, '/', sep=''),
                if(!is.na(repo)) paste(repo, '/', sep=''), 
                if(!is.na(stat)) paste(stat), sep='')
  xx <- getURL(url2)
  fromJSON(xx)
}

install.packages("devtools")
require(devtools)
install_github("raltmet", "ropensci")
require(raltmet)