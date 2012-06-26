#' Assign total-impact IDs to more than one item if they do not have one yet.
#' 
#' @import RCurl RJSONIO stringr
#' @param namespaces Namespaces match each item in the items parameter.
#' @param items ID for item, e.g., a DOI. See example below.
#' @param url The base URL (do not change from default).
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Returns the assigned tiid.
#' @export
#' @examples \dontrun{
#' totimp_getids(namespaces = "doi", items = "10.1371/journal.pcbi.1000361")
#' }
totimp_getids <- function(items = NA,
  url = "http://total-impact-core.herokuapp.com/items", curl = getCurlHandle()) 
{
  tosubmit <- list(namespaces, items)
  args <- list(httpAccept = 'application/json', tosubmit)
  tt <- 
    postForm(url, .params = args, curl = curl, style = "POST")
  str_extract(tt[[1]], "[a-z0-9]+")
}