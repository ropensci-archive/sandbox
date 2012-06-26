#' Expand a long URL suing Bit.ly.
#' 
#' @import RCurl RJSONIO
#' @param shorturl The long URL to shorten.
#' @param bitlyusername Your bit.ly username. 
#' @param bitlykey Your bit.ly API key. 
#' @return A bit.ly short URL.
#' @export
#' @examples \dontrun{
#' bitly_expand(shorturl = 'http://bit.ly/MxxXPH')
#' }
bitly_expand <- function(shorturl,
  bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
  bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")) ) 
{
  fromJSON(getURL(paste(
    "https://api-ssl.bitly.com/v3/expand?login=", bitlyusername, "&apiKey=",
    bitlykey, "&shortUrl=", shorturl, "&format=json", sep=''),
    ssl.verifypeer = FALSE))$data$expand[[1]][[2]]
}