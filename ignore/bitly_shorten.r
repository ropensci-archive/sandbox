#' Shorten a long URL suing Bit.ly.
#' @import RCurl RJSONIO
#' @param longurl The long URL to shorten.
#' @param bitlyusername Your bit.ly username. 
#' @param bitlykey Your bit.ly API key. 
#' @return A bit.ly short URL.
#' @export
#' @examples \dontrun{
#' bitly_shorten(longurl = 'http://onlinelibrary.wiley.com/doi/10.1111/j.1461-0248.2011.01702.x/abstract')
#' }
bitly_shorten <- function(longurl,
   bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
   bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")) ) 
{
  fromJSON(getURL(paste(
    "https://api-ssl.bitly.com/v3/shorten?login=", bitlyusername, "&apiKey=",
    bitlykey, "&longUrl=", longurl, "&format=json", sep=''),
    ssl.verifypeer = FALSE))$data$url
}