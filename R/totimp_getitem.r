#' Assign a total-impact ID to one item if it doesn't have one yet.
#' 
#' @import RCurl RJSONIO stringr
#' @param tiid Total-impat ID for item.
#' @param url The base URL (do not change from default).
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Returns an item object, metrics that is.
#' @export
#' @examples \dontrun{
#' totimp_getitem(tiid = "0df8aa0eb2c911e19e181231381b0f5a")
#' }
totimp_getitem <- function(tiid = NA,
    url = "http://total-impact-core.herokuapp.com/item/", curl = getCurlHandle()) 
{
  url2 <- paste(url, tiid, sep="")
  tt <- postForm(url2)
  str_extract(tt[[1]], "[a-z0-9]+")
}