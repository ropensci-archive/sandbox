#' Get GitHub metrics on a user or organization's repositories.
#' 
#' @import RCurl RJSONIO
#' @param userorg User or organization GitHub name.
#' @param repo Repository name.
#' @param url The base GitHub url (leave to default).
#' @return json output.
#' @export
#' @examples \dontrun{
#' github(userorg = 'ropensci', repo = 'rmendeley')
#' github(userorg = 'hadley', repo = 'ggplot2')
#' github(userorg = 'hadley', repo = 'ggplot2', 'allstats')
#' github(userorg = 'hadley', repo = 'ggplot2', return_ = 'forks')
#' }
github <- function(userorg = NA, repo = NA, return_ = 'show')
{
	url = "https://api.github.com/repos/"
	
  url2 <- paste(url, userorg, '/', repo, sep='')
  message(url2)
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

#' Authenticate with github
#' @import httr
#' @param client_id Consumer key. can be supplied here or read from Options()
#' @param  client_secret Consumer secret. can be supplied here or read from Options()
#' @examples \dontrun{
#' github_sign <- github_auth()
#' }
#' @export
github_auth <- function(client_id = NULL, client_secret = NULL)
{
	if(!is.null(client_id)) {client_id=client_id} 
		else {client_id = getOption("github_client_id", stop("Missing Github client id"))}
	if(!is.null(client_secret)) {client_secret=client_secret} 
		else {client_secret = getOption("github_client_secret", stop("Missing Github client secret"))}
	if(!exists("github_sign")){
		github_app <- oauth_app("github", key=client_id, secret=client_secret)
		github_urls <- oauth_endpoint(NULL, "authorize", "access_token", base_url = "https://github.com/login/oauth")
		github_token <- oauth2.0_token(github_urls, github_app)
		github_sign <- httr::sign_oauth2.0(github_token$access_token)
		assign('github_sign', github_sign, envir=GitHubAuthCache)
		message("\n GitHub authentication was successful \n")
		return(github_sign)
	} else { NULL }
}

#' Helper function to get authentication
#'
#' The authentication environment is created by new.env function in the zzz.R file.  
#' The authentication token 'oauth' is created by the figshare_auth function.  
#' This helper function lets all other functions load the authentication.  
#' @keywords internal
github_get_auth <- function()
{
  if(!exists("github_sign", envir=GitHubAuthCache))
    tryCatch(github_auth(), error= function(e) 
      stop("Requires authentication. 
      Are your credentials stored in options? 
      See github_auth function for details."))
  get("github_sign", envir=GitHubAuthCache)
}

#' Get GitHub metrics on a user or organization's repositories.
#' 
#' @import RJSONIO plyr ggplot2 httr lubridate reshape2
#' @param userorg User or organization GitHub name.
#' @param repo Repository name.
#' @param since Date to start at.
#' @param until Date to stop at.
#' @param author Specify a committer, if none, will return all.
#' @param per_page Number of commits to return per call
#' @param timeplot Make a ggplot2 plot visualizing additions and deletions by user. Defaults to FALSE.
#' @param session (optional) the authentication credentials from \code{\link{github_auth}}. If not provided, will attempt to load from cache as long as github_auth has been run.  
#' @return data.frame or ggplot2 figure.
#' @examples \dontrun{
#' github_commits(userorg = 'ropensci', repo = 'rmendeley')
#' github_commits(userorg = 'ropensci', repo = 'rfigshare', since='2013-01-01T')
#' github_commits(userorg = 'ropensci', repo = 'taxize_', since='2009-01-01T', per_page=300, timeplot=TRUE)
#' }
#' @export
github_commits <- function(userorg = NA, repo = NA, since = NULL, until = NULL,
	author = NULL, per_page = NULL, timeplot = FALSE, session = github_get_auth())
{	
	url = "https://api.github.com/repos/"
	url2 <- paste0(url, userorg, '/', repo, '/commits')
	args <- compact(list(since = since, until = until, author = author, per_page = per_page))

	tt = content(GET(url2, session, query=args))
	
	shas <- laply(tt, function(x) x$sha)
	# stats <- llply(shas, function(x) fromJSON(getURL(paste0(url2,"/",x)))$stats[2:3] )

	stats <- llply(shas, function(x) content(GET(paste0(url2,"/",x), session))$stats[2:3] )
	stats <- ldply(stats, function(x) data.frame(x))
	
	temp <- ldply(tt, function(x) c(x$commit$committer[["date"]], x$committer$login) )
	names(temp) <- c("date","name")
	temp$name <- as.factor(temp$name)
	temp$date <- as.Date(temp$date)

	alldat <- cbind(temp, stats)
	# temp$num <- rep(1, nrow(temp))
	alldat$yearmonth <- as.Date(sapply(alldat$date, function(x) paste0(year(x), "-", month(x), "-1")))
	
	alldat_m <- melt(alldat[,-5], id=1:2)
	
	if(!timeplot){ temp } else
	{
		ggplot(alldat_m, aes(date, value, colour=variable)) +
			geom_line() +
			scale_x_date() +
			facet_grid(name ~ .) + 
			labs(x="", y="")
		
	}
}