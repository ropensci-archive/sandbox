#' Get Altmetric.com data for a given article.
#' @import RCurl RJSONIO plyr
#' @param service Service of the article ID you are searchin for: one of 
#'    'id' (Altmetric.com article ID), 'doi' (article DOI), 
#'    'pmid' (PubMed ID), or 'arxiv' (arXiv ID).
#' @param id ID of the article.
#' @param all print all results (TRUE - default), or not (FALSE).
#' @param url The base CitedIn url (should be left to default)
#' @param key Your Altmetric.com API key.
#' @return Altmetric.com data on the given article in a list.
#' @export
#' @examples \dontrun{
#' altmetcom('id', '241939') # using altmetric.com article id
#' altmetcom('doi', '10.1038/480426a') # using doi
#' altmetcom('pmid', '21148220') # using pubmed id
#' altmetcom('arxiv', '1108.2455') # using arxiv id
#' }
altmetcom <- function(service, articleid = NA, all = TRUE,
  url = "http://api.altmetric.com/v1/", key = getOption("altmetriccom"))
{
  if(is.null(key))
    { url2 <- paste(url, service, '/', articleid, sep='') } else
      { url2 <- paste(url, service, '/', articleid, '?key=', key, sep='') }
  message(url2)
  tt <- fromJSON(getURL(url2))
  if(all == TRUE){ tt } else
    { stop("working on more options for this fxn...") }
}