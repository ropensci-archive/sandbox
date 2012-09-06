#' Get TotalImpact metrics on an identifier.
#' 
#' @import stringr httr
#' @param tiid Total-impat ID for item.
#' @param url The base URL (do not change from default).
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Returns an item object, metrics that is.
#' @export
#' @examples \dontrun{
#' tiid <- totimp_getid("doi/10.1111/j.1461-0248.2012.01776.x")
#' totimp_getitem(tiid = tiid)
#' }
totimp_getitem <- function(tiid = NA,
    url = "http://total-impact-core.herokuapp.com/item/", 
		getimage = NULL, curl = getCurlHandle()) 
{
  url2 <- paste(url, tiid, sep="")
  tt <- content(GET(url2))
  ldply(tt$metrics, function(x) as.data.frame(x))
}