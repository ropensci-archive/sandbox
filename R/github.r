#' Get GitHub metrics on a user or organization's repositories.
#' 
#' @import httr
#' @param userorg User or organization GitHub name.
#' @param repo Repository name.
#' @param session (optional) the authentication credentials from \code{\link{github_auth}}. If not provided, will attempt to load from cache as long as github_auth has been run. 
#' @param return_ what to return, one of: show (raw data), allstats, watchers, open_issues, or forks
#' @return json
#' @examples \dontrun{
#' github_repo(userorg = 'ropensci', repo = 'rmendeley')
#' github_repo(userorg = 'hadley', repo = 'ggplot2')
#' github_repo(userorg = 'hadley', repo = 'ggplot2', 'allstats')
#' github_repo(userorg = 'hadley', repo = 'ggplot2', return_ = 'forks')
#' }
#' @export
github_repo <- function(userorg = NA, repo = NA, return_ = 'show', session = sandbox:::github_get_auth())
{
	url = "https://api.github.com/repos/"
	url2 <- paste(url, userorg, '/', repo, sep='')
	tt = content(GET(url2, session))
	if(return_=='show'){tt} else
	if(return_=='allstats'){
    	list('watchers'=tt$watchers, 'open_issues'=tt$open_issues, 
        	 'forks'=tt$forks)} else
  	if(return_=='watchers'){tt$watchers} else
    	if(return_=='open_issues'){tt$open_issues} else
      		if(return_=='forks'){tt$forks}
}

#' Get GitHub metrics on a user or organization's repositories.
#' 
#' @import httr
#' @param userorg User or organization GitHub name.
#' @param repo Repository name.
#' @param session (optional) the authentication credentials from \code{\link{github_auth}}. If not provided, will attempt to load from cache as long as github_auth has been run. 
#' @return Vector of names or repos for organization or user.
#' @examples \dontrun{
#' github_allrepos(userorg = 'ropensci')
#' }
#' @export
github_allrepos <- function(userorg = NA, return_ = 'names', session = sandbox:::github_get_auth())
{
  url = "https://api.github.com/orgs/"
  url2 <- paste(url, userorg, '/repos?per_page=100', sep='')
  tt = content(GET(url2, session))
  if(return_=='show'){tt} else
    if(return_=='names'){
        sapply(tt, function(x) x$name)
    } else
      { NULL }
}

#' Authenticate with github
#' @import httr
#' @param client_id Consumer key. can be supplied here or read from Options()
#' @param client_secret Consumer secret. can be supplied here or read from Options()
#' @examples \dontrun{
#' github_auth()
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
		assign('github_sign', github_sign, envir=sandbox:::GitHubAuthCache)
		message("\n GitHub authentication was successful \n")
		invisible(github_sign)
	} else { NULL }
}

#' Helper function to get authentication
#'
#' The authentication environment is created by new.env function in the zzz.R file.  
#' The authentication token 'oauth' is created by the github_auth() function.  
#' This helper function lets all other functions load the authentication.  
#' @keywords internal
github_get_auth <- function()
{
  if(!exists("github_sign", envir=sandbox:::GitHubAuthCache))
    tryCatch(github_auth(), error= function(e) 
      stop("Requires authentication. 
      Are your credentials stored in options? 
      See github_auth function for details."))
  get("github_sign", envir=sandbox:::GitHubAuthCache)
}

#' Get GitHub metrics on a user or organization's repositories.
#' 
#' @import RJSONIO plyr ggplot2 httr lubridate reshape2
#' @param userorg User or organization GitHub name.
#' @param repo Repository name.
#' @param since Date to start at.
#' @param until Date to stop at.
#' @param author Specify a committer, if none, will return all.
#' @param limit Number of commits to return per call
#' @param sha The commit sha to start returning commits from.
#' @param timeplot Make a ggplot2 plot visualizing additions and deletions by user. Defaults to FALSE.
#' @param session (optional) the authentication credentials from \code{\link{github_auth}}. If not provided, will attempt to load from cache as long as github_auth has been run.  
#' @return data.frame or ggplot2 figure.
#' @examples \dontrun{
#' github_commits(userorg = 'ropensci', repo = 'rmendeley')
#' github_commits(userorg = 'ropensci', repo = 'rfigshare', since='2009-01-01T')
#' github_commits(userorg = 'ropensci', repo = 'taxize_', since='2009-01-01T', limit=100, timeplot=TRUE)
#' }
#' @export
github_commits <- function(userorg = NA, repo = NA, since = NULL, until = NULL,
	author = NULL, limit = 100, sha = NULL, timeplot = FALSE, session = sandbox:::github_get_auth())
{	
	url = "https://api.github.com/repos/"
	url2 <- paste0(url, userorg, '/', repo, '/commits')
	if(limit > 100) {per_page = 100} else {per_page = limit}

	if(limit > 100) {
		tt <- list()
		shavec <- list("youdummy")
		iter = 0
		iter_ = 1
		status = "notdone"
		while(status == "notdone"){
			iter <- iter + 1
			iter_ <- iter_ + 1
			args <- compact(list(since = since, until = until, author = author, per_page = per_page, sha = sha))
			out <- content(GET(url2, session, query=args))
			sha <- out[[length(out)]]$sha; since = NULL; until = NULL
			shavec[[iter_]] <- sha
			if(shavec[[(length(shavec)-1)]] == shavec[[length(shavec)]]) { status = "done" } else
			{
				tt[[iter]] <- out
			}
		}
		tt <- do.call(c, tt)
	} else
	{
		args <- compact(list(since = since, until = until, author = author, per_page = per_page, sha = sha))
		tt = content(GET(url2, session, query=args))
	}
	
	shas <- unique(laply(tt, function(x) x$sha))
	getstats <- function(x){
		tempist <- content(GET(paste0(url2,"/",x), session))
		c(tempist$sha, tempist$stats[[2]], tempist$stats[[3]])
	}
	stats <- llply(shas, getstats)
	statsdf <- ldply(stats)
	statsdf <- colClasses(statsdf, c("character","numeric","numeric"))
	
	forceit <- function(x){
		dd <- c(x$sha, x$commit$committer[["date"]], x$committer$login)
		if(!length(dd)==3){ c(dd, "whoknowshit") } else
			{ dd }
	}
	temp <- ldply(tt, forceit)
	names(temp) <- c("sha","date","name")
	temp$name <- as.factor(temp$name)
	temp$date <- as.Date(temp$date)
	temp <- temp[!duplicated(temp),]

	alldat <- merge(statsdf, temp, by.x="V1", by.y="sha")
	alldat <- alldat[,-1] # drop sha column
	names(alldat)[1:2] <- c("additions","deletions")

	alldat_m <- melt(alldat, id=3:4)
	
	if(!timeplot){ alldat_m } else
	{
		ggplot(alldat_m, aes(date, value, colour=name)) +
			geom_line() +
			scale_x_date() +
			facet_grid(variable ~ .) + 
			labs(x="", y="")
		
	}
}