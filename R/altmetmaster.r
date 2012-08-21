#' Plot altmetrics
#' 
#' This function plots metrics on persons or articles from many sources.
#' 
#' @param diggname Digg username
#' @param gitid GitHub username
#' @param gittype GitHub type, 'user' or 'org'
#' @author Scott Chamberlain
#' @examples 
#' altmetmaster()
#' @export
altmetmaster <- function(altmet = "10.1038/480426a", 
	gitid = "cboettig", gittype = "user", bitlyurl = 'http://bit.ly/xaTrO7') 
{
	#ggplot is easier to load.
	require(ggplot2); require(RCurl); require(RJSONIO); require(plyr)
	
	altmetout <- altmetcom(altmet)
	names(altmetout) <- c("fbook","gplus","twitter")
	alts <- melt(data.frame("cboettig", altmetout))
	names(alts) <- c("user","value","metric")
	alts <- data.frame(user=alts$user,value=alts$metric,metric=alts$value)
	
	gitout <- laply(gitid, git_wf)
	gits_ <- data.frame(ldply(gitid), ldply(gitout), 
											rep(c("gitforks","gitwatchers"), each=length(gitid)))[,-2]
	names(gits_) <- c("user","value","metric")
	
	bitout <- bitly_clicks(bitlyurl)[1]
	names(bitout) <- c("bitly_clicks")
	bit <- melt(data.frame("cboettig", bitout))
	names(bit) <- c("user","value","metric")
	bit <- data.frame(user=bit$user,value=bit$metric,metric=bit$value)
	
	df <- rbind(alts, gits_, bit)
	
	myplot <- ggplot(df, aes(metric, value, fill=user)) + 
		geom_bar(position="dodge") +
		theme_bw(base_size = 18)
	message("names default to Github user names")
	print(myplot)
	invisible();
}

#' Get Altmetric.com data for a given article.
#' @import RCurl RJSONIO plyr
#' @param id doi of the article.
#' @param url The base CitedIn url (should be left to default)
#' @param key Your Altmetric.com API key.
#' @return Altmetric.com data on the given article in a list.
#' @export
#' @examples \dontrun{
#' altmetcom('10.1038/480426a') # using doi
#' }
altmetcom <- function(id = NA, 
	url = "http://api.altmetric.com/v1/", key = getOption("altmetriccom"))
{
	if(is.null(key))
	{ url2 <- paste(url, 'doi', '/', id, sep='') } else
	{ url2 <- paste(url, 'doi', '/', id, '?key=', key, sep='') }
	tt <- fromJSON(getURL(url2))
	tt[names(tt) %in% c("cited_by_gplus_count","cited_by_tweeters_count","cited_by_fbwalls_count")]
}

#' Get github stats (watchers and forks).
#' 
#' This function gets watchers and forks of github repos for a user or organization.
#' 
#' @param id name of the github user or organization
#' @param type either "user" or "org"
#' @author Scott Chamberlain
#' @export
git_wf <- function (id = "hadley", type = "user") 
{
	
	if (type == "user") {
		url = "https://api.github.com/users/"
	}
	else if (type == "org") {
		url = "https://api.github.com/orgs/"
	}
	else stop("parameter 'type' has to be either 'user' or 'org' ")
	url2 <- paste(url, id, "/repos?per_page=100", sep = "")
	xx <- RCurl::getURL(url2)
	tt <- RJSONIO::fromJSON(xx)
	if (!length(tt) == 1) {
		tt <- tt
	}
	else {
		stop("user or organization not found - search GitHub? - https://github.com/")
	}
	out <- plyr::ldply(tt, function(x) t(c(x$forks, x$watchers)))
	names(out) <- c("Forks", "Watchers")
	out$Forks <- as.integer(out$Forks)
	out$Watchers <- as.integer(out$Watchers)
	c(gitforks=sum(out$Forks), gitwatchers=sum(out$Watchers))
}

#' Get Bit.ly clicks for a given URL.
#' 
#' @import RCurl RJSONIO
#' @param bitlyurl The bit.ly short URL.
#' @param bitlyusername Your bit.ly username. 
#' @param bitlykey Your bit.ly API key. 
#' @return Vector of length 2, with user clicks and global clicks.
#' @export
#' @examples \dontrun{
#' bitly_clicks(bitlyurl = 'http://bit.ly/xaTrO7')
#' }
bitly_clicks <- function(bitlyurl,
												 bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
												 bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")) ) 
{
	out <- fromJSON(getURL(paste(
		"https://api-ssl.bitly.com/v3/clicks?login=", bitlyusername, "&apiKey=",
		bitlykey, "&shortUrl=", bitlyurl, "&format=json", sep='')))
	c(out$data$clicks[[1]][3], out$data$clicks[[1]][5])
}