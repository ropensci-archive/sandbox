#' Assign a total-impact ID to one item if it doesn't have one yet.
#' 
#' @import RCurl RJSONIO stringr
#' @param item ID for item, e.g., a DOI. See example below.
#' @param url The base URL (do not change from default).
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Returns the assigned tiid.
#' @export
#' @examples \dontrun{
#' totimp_getid(item = "doi/10.1371/journal.pcbi.1000361")
#' }
totimp_getid <- function(item = NA,
  url = "http://total-impact-core.herokuapp.com/tiid/", curl = getCurlHandle()) 
{
  url2 <- paste(url, item, sep="")
  tt <- getURL(url2)
  str_extract(tt[[1]], "[a-z0-9]+")
}