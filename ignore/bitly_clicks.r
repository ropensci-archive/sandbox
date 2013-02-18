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