#' Get Altmetric data for a given DOI.
#' @import RCurl RJSONIO plyr
#' @param doi DOI of the article.
#' @param df print data.frame (TRUE), or list (FALSE - default).
#' @param url The base CitedIn url (should be left to default)
#' @param key Your Altmetric.com API key.
#' @param bitlyusername Your bit.ly username. 
#' @param bitlykey Your bit.ly API key. 
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Data.frame or list of citations of the PubMed ID.
#' @export
#' @examples \dontrun{
#' altmet_doi('10.1038/480426a', df = TRUE)
#' altmet_doi('10.1038/480426a')
#' altmet_doi("10.1111/j.1365-2745.2006.01176.x") # doesn't work
#' }
altmet_doi <- 
function(doi = NA, df = FALSE,
        url = "http://api.altmetric.com/v1/doi/",
        key = getOption("altmetriccom", stop("need an API key for Altmetric.com")),
        bitlyusername = getOption("bitlyusername", stop("need a username for Bit.ly")),
        bitlykey = getOption("bitlykey", stop("need an API key for Bit.ly")),
        ...,
        curl = getCurlHandle()){
  url2 <- paste(url, doi, sep='')
  tt <- fromJSON(getURL(url2))[[20]]
  df <- ldply(tt, function(x) as.data.frame(x))
  df
#   bitly <- function(bitlyusername, bitlykey, longurl) {
#     out <- getURL(paste(
#       "https://api-ssl.bitly.com/v3/shorten?login=", bitlyusername, "&apiKey=",
#       bitlykey, "&longUrl=", longurl, "/format=json", sep=''),
#                   ssl.verifypeer = FALSE)
#     fromJSON(out)$data$url
#   }
#   df$url <- 
#     sapply(df$url, function(x) bitly(bitlyusername, bitlykey, x))
}