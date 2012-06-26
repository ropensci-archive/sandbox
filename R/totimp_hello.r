#' Check that Total Impact (http://totalimpact.org/) API works - hello world.
#' 
#' @import RCurl RJSONIO
#' @param url The base URL (do not change from default).
#' @return Hello world message, including basic info on the API.
#' @export
#' @examples \dontrun{
#' totimp_hello()
#' }
totimp_hello <- function(url = "http://total-impact-core.herokuapp.com/v1") 
{
  fromJSON(getURL(url))
}